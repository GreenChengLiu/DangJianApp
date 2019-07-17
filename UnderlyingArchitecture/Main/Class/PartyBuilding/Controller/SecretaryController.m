//
//  SecretaryController.m
//  UnderlyingArchitecture
//
//  Created by liuPengCheng on 2019/7/15.
//  Copyright © 2019 liuPengCheng. All rights reserved.
//

#import "SecretaryController.h"
#import "MessageController.h"
#import "ViewMessageController.h"
#import "SecretaryCell.h"
#import "PartyApi.h"
#import "SecreataryModel.h"
@interface SecretaryController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *secretaryTableView;
@property (nonatomic, strong) NSMutableArray *secretaryArray;
@property (nonatomic, assign) NSInteger page;
@end

@implementation SecretaryController
- (NSMutableArray *)secretaryArray{
    if (!_secretaryArray) {
        _secretaryArray = [NSMutableArray array];
    }
    return _secretaryArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"书记有话说";
    [self.secretaryTableView registerNib:LNib(@"SecretaryCell") forCellReuseIdentifier:@"se"];
    self.secretaryTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.page = 1;
    [self getRequest];
    [self addMJRefresh];
    
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 44)];
    [button setTitle:@"发布消息" forState:UIControlStateNormal];
    button.titleLabel.font = SYSTEMFONT(15);
    [button addTarget:self action:@selector(nextMessage:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitleColor:[UIColor colorWithHex:0x333333] forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
}
- (void)addMJRefresh{
    self.secretaryTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        self.page = 1;
        [self getRequest];
        [self.secretaryTableView.mj_header endRefreshing];
    }];
    self.secretaryTableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        self.page += 1;
        [self getRequest];
        [self.secretaryTableView.mj_footer endRefreshing];
    }];
}
#pragma mark ================= << 右侧按钮 >>
- (void)nextMessage:(UIButton *)button{
    MessageController *messageVC = [[MessageController alloc] init];
    [self.navigationController pushViewController:messageVC animated:YES];
}
#pragma mark ================= << tableview delegate && datasource >>
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SecreataryModel *semodel = self.secretaryArray[indexPath.row];
    SecretaryCell *secell = [tableView dequeueReusableCellWithIdentifier:@"se" forIndexPath:indexPath];
    secell.content.text = semodel.title;
    secell.time.text = semodel.add_time;
    
    return secell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.secretaryArray.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SecreataryModel *model = self.secretaryArray[indexPath.row];
    if (model.is_gongkai == -1) {
        [self showALertWithTitle:@"抱歉,你没有查看此条消息的权限"];
    } else {
        ViewMessageController *viewVC = [[ViewMessageController alloc] init];
        [self.navigationController pushViewController:viewVC animated:YES];
    }
}
#pragma mark ================= << 网络请求 >>
- (void)getRequest{
    NSDictionary *json = @{
                           @"page":@(self.page),
                           @"limit":@(15)
                           };
    [[PartyApi sharePartyApi] secretaryToTalkRequestParmeters:json andReturnObject:^(NSDictionary * _Nonnull obj) {
        NSInteger code = [obj[@"code"] integerValue];
        if (code == 200) {
            if (self.page == 1) {
                [self.secretaryArray removeAllObjects];
            }
            NSArray *array = obj[@"data"];
            [array enumerateObjectsUsingBlock:^(NSDictionary * object, NSUInteger idx, BOOL * _Nonnull stop) {
                SecreataryModel *model = [SecreataryModel yy_modelWithDictionary:object];
                [self.secretaryArray addObject:model];
            }];
            [self.secretaryTableView reloadData];
        } else {
            [self showALertWithTitle:obj[@"msg"]];
        }
    } andError:^(NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

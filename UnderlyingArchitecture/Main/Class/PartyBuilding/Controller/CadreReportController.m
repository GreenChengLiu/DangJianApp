//
//  TwoController.m
//  UnderlyingArchitecture
//
//  Created by mac on 2019/6/26.
//  Copyright © 2019 liuPengCheng. All rights reserved.
//

#import "CadreReportController.h"
#import "CadreDetailsController.h"
#import "AddReportController.h"
/**  cell  **/
#import "CadreReportCell.h"
/**  api  **/
#import "PartyApi.h"
#import "PartyModel.h"
@interface CadreReportController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation CadreReportController

- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
    

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"干部报备";
    self.page = 1;
    [self getRequest];
    [self addMJRefresh];
    [self.tableView registerNib:LNib(@"CadreReportCell") forCellReuseIdentifier:@"cadre"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 60, 40)];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitle:@"添加" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    button.frame = view.bounds;
    [view addSubview:button];
    UIBarButtonItem *batItem = [[UIBarButtonItem alloc] initWithCustomView:view];
    self.navigationItem.rightBarButtonItem = batItem;
}
#pragma mark ======   添加button action:   ======
- (void)buttonAction:(UIButton *)sender{
    AddReportController *addVC = [[AddReportController alloc] init];
    
    [self.navigationController pushViewController:addVC animated:YES];
}
#pragma mark ======   add mjrefresh   ======
- (void)addMJRefresh{
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        self.page = 1;
        [self getRequest];
        [self.tableView.mj_header endRefreshing];
    }];
    self.tableView.mj_footer = [MJRefreshBackFooter footerWithRefreshingBlock:^{
        self.page += 1;
        [self getRequest];
        [self.tableView.mj_footer endRefreshing];
    }];
}

#pragma mark ======   tableview delegate datasource   ======
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CadreModel *model = self.dataArray[indexPath.row];
    CadreReportCell *cadrecell = [tableView dequeueReusableCellWithIdentifier:@"cadre" forIndexPath:indexPath];
    if (model.status == 0) {
        cadrecell.approval.textColor = [UIColor colorWithHex:0x1377DE];
        cadrecell.approval.text = @"审核中";
    } else {
        cadrecell.approval.textColor = [UIColor colorWithHex:0x6DD486];
        cadrecell.approval.text = @"审核完成";
    }
    [cadrecell.headimg sd_setImageWithURL:ImageURL(NSStringFormat(@"%@%@",BASE_IMAGE_URL,model.headimg)) placeholderImage:ImageNamed(@"placeholder")];
    cadrecell.name.text = model.name;
    cadrecell.content.text = model.waichushiyou;
    NSString *time = [NSString ConvertStrToTime:NSStringFormat(@"%ld",model.waichushijian) withStatus:1];
    NSLog(@"time  %@",time);
    cadrecell.time.text = time;
    
    return cadrecell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    CadreDetailsController *detailVC = [[CadreDetailsController alloc] init];
    
    [self.navigationController pushViewController:detailVC animated:YES];
}
    
#pragma mark ======   请求   ======
- (void)getRequest{
    UserModel *user = [UserModel shareUserModel];
    [user getUserInfo];
    NSDictionary *json = @{
                           @"page":@(self.page),
                           @"token":user.token
                           };
    [SVProgressHUD showWithStatus:@"正在请求"];
    [[PartyApi sharePartyApi] partyCadreReportListParameters:json andReturnObject:^(NSDictionary * _Nonnull obj) {
        NSInteger code = [obj[@"code"] integerValue];
        if (code == 200) {
            NSArray *data = obj[@"data"][@"data"];
            if (self.page == 1) {
                [self.dataArray removeAllObjects];
            }
            [data enumerateObjectsUsingBlock:^(NSDictionary * object, NSUInteger idx, BOOL * _Nonnull stop) {
                CadreUserModel *user = [CadreUserModel yy_modelWithDictionary:object[@"user"]];
                CadreModel *cadreModel = [CadreModel yy_modelWithDictionary:object];
                cadreModel.user = user;
                [self.dataArray addObject:cadreModel];
            }];
            [self.tableView reloadData];
            [SVProgressHUD showSuccessWithStatus:@"获取成功"];
        } else {
            [SVProgressHUD dismissWithDelay:0.5];
            [self showALertWithTitle:obj[@"msg"]];
        }
    } andError:^(NSError * _Nonnull error) {
        [SVProgressHUD showErrorWithStatus:@"请求失败"];
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

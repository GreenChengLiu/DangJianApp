//
//  SessionsAndLessonController.m
//  UnderlyingArchitecture
//
//  Created by mac on 2019/7/3.
//  Copyright © 2019 liuPengCheng. All rights reserved.
//

#import "SessionsAndLessonController.h"
#import "SessionUploadController.h"
#import "PartyModel.h"
#import "PartyApi.h"
#import "AssessmentCell.h"
@interface SessionsAndLessonController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *seccionTableView;
@property (nonatomic, assign) NSInteger page;
@property (nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation SessionsAndLessonController

- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"三会一课";
    [self gerRequest];
    self.seccionTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.seccionTableView registerNib:LNib(@"AssessmentCell") forCellReuseIdentifier:@"assess"];
    [self addMJRefresh];
    
    self.seccionTableView.delegate = self;
    self.seccionTableView.dataSource = self;
    

    
}

- (void)addMJRefresh{
    self.seccionTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        self.page = 1;
        [self gerRequest];
        [self.seccionTableView.mj_header endRefreshing];
    }];
    self.seccionTableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        self.page += 1;
        [self gerRequest];
        [self.seccionTableView.mj_footer endRefreshing];
    }];
}

- (void)buttonAction:(UIButton *)button{
    SessionUploadController *uploadVC = [[SessionUploadController alloc] init];
    
    [self.navigationController pushViewController:uploadVC animated:YES];
}
#pragma mark ======   tableview delegate datasource   ======
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AssessmentModel *model = self.dataArray[indexPath.row];
    AssessmentCell *asscell = [tableView dequeueReusableCellWithIdentifier:@"assess" forIndexPath:indexPath];
    [asscell refreshTheModel:model];
    
    return asscell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (void)gerRequest{
    UserModel *user = [UserModel shareUserModel];
    [user getUserInfo];
    NSDictionary *json = @{
                           @"page":@(self.page),
                           @"limit":@(15),
                           @"token":user.token
                           };
    [[PartyApi sharePartyApi] partyAssessmentListParameters:json andReturnObject:^(NSDictionary * _Nonnull obj) {
        NSInteger code = [obj[@"code"] integerValue];
        if (code == 200) {
            NSArray *array = obj[@"data"];
            if (self.page == 1) {
                [self.dataArray removeAllObjects];
            }
            [array enumerateObjectsUsingBlock:^(NSDictionary * object, NSUInteger idx, BOOL * _Nonnull stop) {
                AssessmentModel *model = [AssessmentModel yy_modelWithDictionary:object];
                model.user = [CadreUserModel yy_modelWithDictionary:object[@"user"]];
                model.type = [AssessmentTypeModel yy_modelWithDictionary:object[@"type"]];
                [self.dataArray addObject:model];
            }];
            [self.seccionTableView reloadData];
        } else {
            [self showALertWithTitle:obj[@"msg"]];
        }
    } andError:^(NSError * _Nonnull error) {
        NSLog(@"错误信息: %@",error);
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

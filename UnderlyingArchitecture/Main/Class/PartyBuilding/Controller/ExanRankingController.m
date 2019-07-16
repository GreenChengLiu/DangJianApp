//
//  ExanRankingController.m
//  UnderlyingArchitecture
//
//  Created by mac on 2019/7/2.
//  Copyright © 2019 liuPengCheng. All rights reserved.
//

#import "ExanRankingController.h"
#import "PartyApi.h"
#import "PartyModel.h"
#import "BranchCell.h"
#import "ExamRankingCell.h"
@interface ExanRankingController () <UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *rankTableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, assign) NSInteger page;

@end

@implementation ExanRankingController

- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}
    

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = self.titles;
    self.page = 1;
    [self getRequest];
    [self addMJRefresh];
    [self.rankTableView registerNib:LNib(@"ExamRankingCell") forCellReuseIdentifier:@"exam"];
    [self.rankTableView registerNib:LNib(@"BranchCell") forCellReuseIdentifier:@"branch"];
    self.rankTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}
- (void)addMJRefresh{
    self.rankTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        self.page = 1;
        [self getRequest];
        [self.rankTableView.mj_header endRefreshing];
    }];
    self.rankTableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        self.page += 1;
        [self getRequest];
        [self.rankTableView.mj_footer endRefreshing];
    }];
}

#pragma mark ======   tableview delegate datasource   ======
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.status == 2) {
        return 66;
    } else {
        return UITableViewAutomaticDimension;
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    PartyModel *model = self.dataArray[indexPath.row];
    if (self.status == 2) {
        ExamRankingCell *examCell = [tableView dequeueReusableCellWithIdentifier:@"exam" forIndexPath:indexPath];
        if (indexPath.row < 3) {
            examCell.numberRank.hidden = YES;
            examCell.rankImage.hidden = NO;
        } else {
            examCell.numberRank.hidden = NO;
            examCell.rankImage.hidden = YES;
        }
        if (indexPath.row == 0) {
            examCell.rankImage.image = ImageNamed(@"rank-first");
        } else if (indexPath.row == 1){
            examCell.rankImage.image = ImageNamed(@"rank-two");
        } else if (indexPath.row == 2) {
            examCell.rankImage.image = ImageNamed(@"rank-three");
        }
        
        examCell.numberRank.text = NSStringFormat(@"%ld",indexPath.row + 1);
        [examCell.headImg sd_setImageWithURL:ImageURL(NSStringFormat(@"http://dj.micuer.com%@",model.headimgurl)) placeholderImage:ImageNamed(@"placeholder")];
        examCell.name.text = model.username;
        examCell.age.text = NSStringFormat(@"年龄: %ld",model.age);
        examCell.stt.text = NSStringFormat(@"%ld分",model.zuizhongdefen);
        
        return examCell;
    } else {
        BranchCell *branchCell = [tableView dequeueReusableCellWithIdentifier:@"branch" forIndexPath:indexPath];
        if (indexPath.row < 3) {
            branchCell.rankNum.hidden = YES;
            branchCell.rankImage.hidden = NO;
        } else {
            branchCell.rankNum.hidden = NO;
            branchCell.rankImage.hidden = YES;
        }
        if (indexPath.row == 0) {
            branchCell.rankImage.image = ImageNamed(@"rank-first");
        } else if (indexPath.row == 1){
            branchCell.rankImage.image = ImageNamed(@"rank-two");
        } else if (indexPath.row == 2) {
            branchCell.rankImage.image = ImageNamed(@"rank-three");
        }
        branchCell.rankNum.text = NSStringFormat(@"%ld",indexPath.row + 1);
        branchCell.branck.text = model.username;
        branchCell.stt.text = NSStringFormat(@"%ld分",model.zuizhongdefen);
        
        return branchCell;
    }
}

#pragma mark ======   网络请求   ======
- (void)getRequest{
    UserModel *user = [UserModel shareUserModel];
    [user getUserInfo];
    NSDictionary *json = @{
                           @"page":@(self.page),
                           @"limit":@(10),
                           @"status":@(self.status),
                           @"token":user.token,
                           @"times":@""
                           };
    [SVProgressHUD showWithStatus:@"正在请求"];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [[PartyApi sharePartyApi] partyExamRankingParameters:json andReturnObject:^(NSDictionary * _Nonnull obj) {
            NSInteger code = [obj[@"code"] integerValue];
            if (code == 200) {
                NSArray *data = obj[@"data"];
                if (self.page == 1) {
                    [self.dataArray removeAllObjects];
                }
                [data enumerateObjectsUsingBlock:^(NSDictionary* object, NSUInteger idx, BOOL * _Nonnull stop) {
                    [SVProgressHUD showSuccessWithStatus:@"请求成功"];
                    PartyModel *model = [PartyModel yy_modelWithDictionary:object];
                    [self.dataArray addObject:model];
                }];
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.rankTableView reloadData];
                });
            } else {
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self showALertWithTitle:obj[@"msg"]];
                });
            }
        } andError:^(NSError * _Nonnull error) {
            NSLog(@"错误信息:%@",error);
            [SVProgressHUD  showErrorWithStatus:@"请求失败"];
        }];
    });
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

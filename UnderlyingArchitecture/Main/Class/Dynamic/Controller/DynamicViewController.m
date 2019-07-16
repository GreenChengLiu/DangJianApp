//
//  DynamicViewController.m
//  UnderlyingArchitecture
//
//  Created by mac on 2019/6/24.
//  Copyright © 2019 liuPengCheng. All rights reserved.
//

#import "DynamicViewController.h"
/**  cells  **/
#import "HomeCell.h"
#import "HomeNoImgCell.h"
/**  model  **/
#import "DynamicModel.h"
#import "DynamicApi.h"
/**  controllers  **/
#import "DynamicDetailsController.h"
#import "DynamicVideoController.h"
@interface DynamicViewController () <UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *dynamicTableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, assign) NSInteger page;

@end

@implementation DynamicViewController
- (NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"党建动态";
    self.page = 1;
    [self addMJRefresh];
    [self addRegisterNib];
    self.dynamicTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self getRequest];
}
#pragma mark ======   添加刷新   ======
- (void)addMJRefresh{
    self.dynamicTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        self.page = 1;
        [self getRequest];
        [self.dynamicTableView.mj_header endRefreshing];
    }];
    self.dynamicTableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        self.page += 1;
        [self getRequest];
        [self.dynamicTableView.mj_footer endRefreshing];
    }];
}
- (void)addRegisterNib{
    self.dynamicTableView.delegate = self;
    self.dynamicTableView.dataSource = self;
    
    [self.dynamicTableView registerNib:LNib(@"HomeCell") forCellReuseIdentifier:@"home"];
    [self.dynamicTableView registerNib:LNib(@"HomeNoImgCell") forCellReuseIdentifier:@"nocell"];
}
#pragma mark ======   table view delegate && datasource   ======
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DynamicModel *model = self.dataArray[indexPath.row];
    if (![NSString isStringNull:model.img]) {
        HomeCell *homcell = [tableView dequeueReusableCellWithIdentifier:@"home" forIndexPath:indexPath];
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
        style.lineSpacing = 8;
        NSAttributedString *attributed = [[NSAttributedString alloc] initWithString:model.name attributes:@{NSForegroundColorAttributeName : [UIColor colorWithHex:0x333333],NSFontAttributeName : SYSTEMFONT(15), NSParagraphStyleAttributeName : style}];
        homcell.title.attributedText = attributed;
        [homcell.image sd_setImageWithURL:ImageURL(model.img) placeholderImage:ImageNamed(@"暂无")];
        homcell.time.text = model.add_time;
        homcell.num.text = NSStringFormat(@"%ld",model.pv);
        return homcell;
    } else {
        HomeNoImgCell *cell = [tableView dequeueReusableCellWithIdentifier:@"nocell" forIndexPath:indexPath];
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
        style.lineSpacing = 8;
        NSAttributedString *attributed = [[NSAttributedString alloc] initWithString:model.name attributes:@{NSForegroundColorAttributeName : [UIColor colorWithHex:0x333333],NSFontAttributeName : SYSTEMFONT(15), NSParagraphStyleAttributeName : style}];
        cell.titleLabel.attributedText = attributed;
        cell.timeLabel.text = model.add_time;
        cell.numLabel.text = NSStringFormat(@"%ld",model.pv);
        return cell;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DynamicModel *model = self.dataArray[indexPath.row];
    if ([model.content rangeOfString:@"video"].location == NSNotFound) {
        DynamicDetailsController *dynamicVC = [[DynamicDetailsController alloc] init];
        dynamicVC.content = model.content;
        dynamicVC.name = model.name;
        [self.navigationController  pushViewController:dynamicVC animated:YES];
    } else {
        DynamicVideoController *videoVC = [[DynamicVideoController alloc] init];
        videoVC.content = model.content;
        videoVC.name = model.name;
        [self.navigationController  pushViewController:videoVC animated:YES];
    }
}

#pragma mark ======  网络请求   ======
- (void)getRequest{
    NSDictionary *json = @{
                           @"page":@(self.page),
                           @"limit":@(10)
                           };
    [[DynamicApi shareDynamicApi] DynamicListParameter:json andReturnObject:^(NSDictionary * _Nonnull obj) {
        NSInteger code = [obj[@"code"] integerValue];
        if (code == 200) {
            if (self.page == 1) {
                [self.dataArray removeAllObjects];
            }
            NSArray *data = obj[@"data"];
            for (NSDictionary *dcit in data) {
                DynamicModel *model = [DynamicModel yy_modelWithDictionary:dcit];
                [self.dataArray addObject:model];
            }
            [self.dynamicTableView reloadData];
        } else {
            [self showALertWithTitle:obj[@"msg"]];
        }
    } andError:^(NSError * _Nonnull error) {
        NSLog(@"错误信息:%@",error );
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

//
//  PartyBuildingViewController.m
//  UnderlyingArchitecture
//
//  Created by mac on 2019/6/24.
//  Copyright © 2019 liuPengCheng. All rights reserved.
//

#import "PartyBuildingViewController.h"
#include <objc/runtime.h>
/**  controllers  **/
#import "FileController.h"
#import "ExanRankingController.h"
#import "CadreReportController.h"
#import "SDCycleScrollView.h"
#import "SessionsAndLessonController.h"

#import "SecretaryController.h"
#import "PageController.h"
#import "OrganizationalNavigationController.h"
#import "MicroInformationController.h"
/**  cell  **/
#import "CollectionCell.h"
#import "PartyView.h"
/**  请求  **/
#import "PartyApi.h"
@interface PartyBuildingViewController () <SDCycleScrollViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,PartyViewDelegate,partyBackgroundViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic, strong) SDCycleScrollView *SDCycleView;
@property (nonatomic, strong) NSMutableArray *coursesArray;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *collectionArray;
@property (nonatomic, strong) PartyView *partyView;
@property (nonatomic, strong) PartyBackgroundView *partyBackgroundView;
@end

@implementation PartyBuildingViewController
- (NSMutableArray *)coursesArray{
    if (!_coursesArray) {
        _coursesArray = [NSMutableArray array];
    }
    return _coursesArray;
}
- (NSMutableArray *)collectionArray{
    if (!_collectionArray) {
        _collectionArray = [NSMutableArray array];
    }
    return _collectionArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"指尖党建";
    self.scrollView.contentSize = CGSizeMake(0, 1050 + ((SCREENـWIDTH - 6) / 2) * 32 / 107);
    [self getPartyList];
    [self getCoursesMap];
    [self addSDCycleView];
    [self addPartyView];
    [self addCollectionView];

    
}

#pragma mark ======   添加轮播图   ======
- (void)addSDCycleView{
    self.SDCycleView = [[SDCycleScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREENـWIDTH, 240)];
    self.SDCycleView.pageControlAliment = SDCycleScrollViewPageContolAlimentCenter;
    self.SDCycleView.pageControlStyle = SDCycleScrollViewPageContolStyleClassic;
    self.SDCycleView.currentPageDotColor = [UIColor whiteColor];
    [self.scrollView addSubview:self.SDCycleView];
    self.SDCycleView.pageControlBottomOffset = 40;
    self.SDCycleView.titleLabelHeight = 35;
}
#pragma mark ======   添加中心层   ======
- (void)addPartyView{
    self.partyView = [[PartyView alloc] initWithFrame:CGRectMake(0, 240, SCREENـWIDTH, 410)];
    self.partyView.delegate = self;
    [self.scrollView addSubview:_partyView];
    
    UIView *centerView = [[UIView alloc] initWithFrame:CGRectMake(0, 650, SCREENـWIDTH, ((SCREENـWIDTH - 6) / 2) * 32 / 107)];
//    centerView.backgroundColor = [UIColor orangeColor];
    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, (SCREENـWIDTH - 6) / 2, ((SCREENـWIDTH - 6) / 2) * 32 / 107)];
    imageView1.image = ImageNamed(@"首页1.png");
    [centerView addSubview:imageView1];
    
    UIImageView *imageview2 = [[UIImageView alloc] init];
    imageview2.image = ImageNamed(@"首页2.png");
    [centerView addSubview:imageview2];
    [imageview2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(centerView.mas_top).with.offset(0);
        make.right.equalTo(centerView.mas_right).with.offset(0);
        make.height.offset(((SCREENـWIDTH - 6) / 2) * 32 / 107);
        make.width.offset((SCREENـWIDTH - 6) / 2);
    }];
    [self.scrollView addSubview:centerView];
    

}
#pragma mark ======   添加collection view   ======
- (void)addCollectionView{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 650 + ((SCREENـWIDTH - 6) / 2) * 32 / 107, SCREENـWIDTH, 400) collectionViewLayout:flowLayout];
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerNib:LNib(@"CollectionCell") forCellWithReuseIdentifier:@"ce"];
    [self.scrollView addSubview:self.collectionView];
}
#pragma mark ======   collection delegate datasource   ======
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.collectionArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *dict = self.collectionArray[indexPath.row];
    CollectionCell *collcell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ce" forIndexPath:indexPath];
    [collcell.imageview sd_setImageWithURL:ImageURL(NSStringFormat(@"%@",dict[@"img"])) placeholderImage:ImageNamed(@"backwork")];
    collcell.titleLabel.text = dict[@"name"];
    return collcell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    //    NSLog(@"点击点击点击");
    //    if (self.delegate && [self.delegate respondsToSelector:@selector(didCollectionView:didSelectItemIndexPath:andImageArray:)]) {
    //        [self.delegate didCollectionView:collectionView didSelectItemIndexPath:indexPath andImageArray:self.imageArray];
    //    }
}

//size for item
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake((SCREENـWIDTH - 15) / 2, 130);
}
//inset for section
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(5, 5, 5, 5);
}
//interitem
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 2;
}
//line spacing
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 2;
}

#pragma mark ======   party view delegate   ======
- (void)arrairtsClickOperation:(NSInteger)partyStatus{
    if (partyStatus == partyViewStatusInformation) {
        
        FileController *fileVC = [[FileController alloc] init];
        [self.navigationController pushViewController:fileVC animated:YES];
    } else if (partyStatus == partyViewStatusAssessment) {
        
        ExanRankingController *exanRank = [[ExanRankingController alloc] init];
        exanRank.status = 2;
        exanRank.titles = @"党员考核排行";
        [self.navigationController pushViewController:exanRank animated:YES];
    } else if (partyStatus == partyViewStatusClass) {
        SessionsAndLessonController *sessionVC = [[SessionsAndLessonController alloc] init];
        
        [self.navigationController pushViewController:sessionVC animated:YES];
    } else if (partyStatus == partyViewStatusExamination) {
        
        
        
    } else if (partyStatus == partyViewStatusPayment) {
        
    } else if (partyStatus == partyViewStatusLearn) {
//        BOOL isInstalled = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"xuexiqiangguo://"]];
//
//        if (isInstalled) {
//            NSLog(@"安装了  学习强国  APP");
////            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"xuexi://"]];
//        } else {
            NSLog(@"没有安装  学习强国  APP");
            
            self.partyBackgroundView = [[PartyBackgroundView alloc] initWithFrame:CGRectMake(0, 0, SCREENـWIDTH, SCREEN_HEIGHT)];
            self.partyBackgroundView.delegate = self;
            self.partyBackgroundView.tag = 1100;
            [[UIApplication sharedApplication].keyWindow addSubview:self.partyBackgroundView];
//        }
    } else {
        CadreReportController *cardeVC = [[CadreReportController alloc] init];
        
        [self.navigationController pushViewController:cardeVC animated:YES];
    }
    
}

- (void)buildingClickOperation:(NSInteger)buildingStatus{
    if (buildingStatus == buildingStatusDynamic) {
        
        self.tabBarController.selectedIndex = 2;
    } else if (buildingStatus == buildingStatusSpeak) {
        SecretaryController *secreataryVC = [[SecretaryController alloc] init];
        [self.navigationController pushViewController:secreataryVC animated:YES];
    } else if (buildingStatus == buildingStatusArrangement) {
        
    } else if (buildingStatus == buildingStatusShow) {
        PageController *ach = [[PageController alloc] init];
        [self.navigationController pushViewController:ach animated:YES];
    } else if (buildingStatus == buildingStatusPlease) {
        
    } else if (buildingStatus == buildingStatusBranch) {
        
        ExanRankingController *exanRank = [[ExanRankingController alloc] init];
        exanRank.status = 1;
        exanRank.titles = @"支部排行";
        [self.navigationController pushViewController:exanRank animated:YES];
    } else if (buildingStatus == buildingStatusNavigation) {
        OrganizationalNavigationController *ach = [[OrganizationalNavigationController alloc] init];
        [self.navigationController pushViewController:ach animated:YES];
    } else {
        MicroInformationController *micro = [[MicroInformationController alloc] init];
        [self.navigationController pushViewController:micro animated:YES];
    }
}

#pragma mark ======   party background view delegate   ======
- (void)downloadOperation:(UIButton *)sender{
    [[[UIApplication sharedApplication].keyWindow viewWithTag:1100] removeFromSuperview];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://apps.apple.com/cn/app/学习强国/id1426355645"]];
}
- (void)waitAMinute:(UIButton *)sender{
    [[[UIApplication sharedApplication].keyWindow viewWithTag:1100] removeFromSuperview];
}

#pragma mark ======   网络请求   ======
- (void)getCoursesMap{
//    __block NSMutableArray *mutr = [NSMutableArray array];
    [[PartyApi sharePartyApi] partyCarouseMapWithParameters:@{} andReturnObject:^(NSDictionary * _Nonnull obj) {
        NSInteger code = [obj[@"code"] integerValue];
        if (code == 200) {
            NSArray *data = obj[@"data"];
            self.coursesArray = data.mutableCopy;
            NSMutableArray *titleArr = [NSMutableArray array];
            NSMutableArray *imgarr = [NSMutableArray array];
            NSMutableArray *idArra = [NSMutableArray array];
            [data enumerateObjectsUsingBlock:^(NSDictionary * object, NSUInteger idx, BOOL * _Nonnull stop) {
                [titleArr addObject:object[@"title"]];
                [idArra addObject:object[@"id"]];
                [imgarr addObject:object[@"picture"]];
            }];
            self.SDCycleView.titlesGroup = titleArr.copy;
            self.SDCycleView.imageURLStringsGroup = imgarr.copy;
            
            [self.collectionView reloadData];
        }
    } andError:^(NSError * _Nonnull error) {
        [SVProgressHUD showErrorWithStatus:@"请求失败"];
    }];
}
//动态
- (void)getPartyList{
    [[PartyApi sharePartyApi] partyStatusParameters:@{} andReturnObject:^(NSDictionary * _Nonnull obj) {
        NSInteger code = [obj[@"code"] integerValue];
        if (code == 200) {
            NSArray *data = obj[@"data"];
            self.collectionArray = data.mutableCopy;
            [self.collectionView reloadData];
        }
    } andError:^(NSError * _Nonnull error) {
        NSLog(@"错误信息:%@",error);
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

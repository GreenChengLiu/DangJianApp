//
//  CadreDetailsController.m
//  UnderlyingArchitecture
//
//  Created by mac on 2019/7/3.
//  Copyright © 2019 liuPengCheng. All rights reserved.
//

#import "CadreDetailsController.h"
#import "PartyApi.h"
#import "CardeReportModel.h"

#import "CadreOneCell.h"
#import "CadreTwoCell.h"
#import "PendingReviewCell.h"
#import "PassedCell.h"

#import "PartyApi.h"
#import "PendingReview.h"
#import "PendingPartyingReview.h"
@interface CadreDetailsController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,PendingReviewDelegate,PendingPartyingReviewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *cadreCollectionView;
@property (nonatomic, strong) CardeReportModel *reportModel;
@property (nonatomic, strong) NSMutableArray *reportArray;

@property (nonatomic, strong) NSMutableArray *statusArray;
@property (nonatomic, strong) PendingReview *pendingView;
@property (nonatomic, strong) PendingPartyingReview *partyingView;
@property (nonatomic, assign) NSInteger approbvalStep;

@property (nonatomic, strong) NSMutableArray *levelList;
@property (nonatomic, assign) BOOL finished;
@property (nonatomic, strong) shenPiModel *shenpi;
@end

@implementation CadreDetailsController

- (NSMutableArray *)reportArray{
    if (!_reportArray) {
        _reportArray = [NSMutableArray array];
    }
    return _reportArray;
}
- (NSMutableArray *)statusArray{
    if (!_statusArray) {
        _statusArray = [NSMutableArray array];
    }
    return _statusArray;
}

- (NSMutableArray *)levelList{
    if (!_levelList) {
        _levelList = [NSMutableArray array];
    }
    return _levelList;
}
    

- (PendingReview *)pendingView{
    if (!_pendingView) {
        _pendingView = [[PendingReview alloc] initWithFrame:CGRectMake(0, 0, SCREENـWIDTH, SCREEN_HEIGHT)];
        _pendingView.tag = 1111;
        _pendingView.delegate = self;
    }
    return _pendingView;
}

- (PendingPartyingReview *)partyingView{
    if (!_partyingView) {
        _partyingView = [[PendingPartyingReview alloc] initWithFrame:CGRectMake(0, 0, SCREENـWIDTH, SCREEN_HEIGHT)];
        _partyingView.tag = 2222;
        _partyingView.delegate = self;
    }
    return _partyingView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"外出报告单";
    self.cadreCollectionView.backgroundColor = [[UIColor colorWithHex:0xe5e5e5] colorWithAlphaComponent:0.85];
    
    [self cadreRequest];
    [self cadreLevelListRequest];
    
    [self addTopView];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(backOperation:)];
}

- (void)backOperation:(UIBarButtonItem *)barbutton{
    if (self.block) {
        self.block(self.finished);
    }
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)addTopView{
    [self.cadreCollectionView registerNib:LNib(@"CadreOneCell") forCellWithReuseIdentifier:@"one"];
    [self.cadreCollectionView registerNib:LNib(@"CadreTwoCell") forCellWithReuseIdentifier:@"two"];
    [self.cadreCollectionView registerNib:LNib(@"PendingReviewCell") forCellWithReuseIdentifier:@"pen"];
    [self.cadreCollectionView registerNib:LNib(@"PassedCell") forCellWithReuseIdentifier:@"pass"];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 0) {
        return 2;
    } else {
        if (self.reportModel.status == 1) {
            return self.reportArray.count;
        } else {
            return self.reportArray.count + 1;
        }
    }
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            CadreOneCell *oneCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"one" forIndexPath:indexPath];
            [oneCell.headImage sd_setImageWithURL:ImageURL(self.headimgurl) placeholderImage:ImageNamed(@"placeholder")];
            oneCell.name.text = self.reportModel.name;
            oneCell.phone.text = self.reportModel.waichu_phone;
            oneCell.position.text = self.reportModel.bumen;
            ViewRadius(oneCell, 8);
            return oneCell;
        } else {
            CadreTwoCell *twoCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"two" forIndexPath:indexPath];
            twoCell.backgroundColor = [UIColor orangeColor];
            twoCell.causeLabel.text = self.reportModel.waichushiyou;
            twoCell.timeLabel.text = self.reportModel.waichushijian;
            twoCell.numberOfDays.text = self.reportModel.waichuqixian;
            twoCell.locationLabel.text = self.reportModel.waichudidian;
            twoCell.accompanyingPerson.text = self.reportModel.tongxingrenyuan;
            twoCell.insteadOfWorking.text = self.reportModel.other;
            
            CGSize worksize = [self boundsWithFontSize:14 text:[NSString isStringNull:self.reportModel.other] == YES ? @"" : self.reportModel.other needWidth:SCREENـWIDTH - 160 lineSpacing:3];
            if (worksize.height < 30) {
                twoCell.workingCon.constant = 40;
            } else {
                twoCell.workingCon.constant = worksize.height + 20;
            }
            
            CGSize causesize = [self boundsWithFontSize:14 text:[NSString isStringNull:self.reportModel.waichushiyou] == YES ? @"" : self.reportModel.waichushiyou needWidth:SCREENـWIDTH - 110 lineSpacing:3];
            if (causesize.height < 30) {
                twoCell.causeCon.constant = 40;
            } else {
                twoCell.causeCon.constant = causesize.height + 20;
            }
            
            ViewRadius(twoCell, 8);
            return twoCell;
        }
    } else {
        if (indexPath.row == self.reportArray.count) {
            PendingReviewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"pen" forIndexPath:indexPath];
            cell.section = indexPath.row;
            
            __weak typeof(self) weakSelf = self;
            switch (indexPath.row) {
                case 0:
                {
                    self.approbvalStep = 1;
                    self.pendingView.titleLabel.text = self.reportModel.waichushiyou;
                    [self.pendingView refreshThePendingView:YES];
                    cell.departmentLabel.text = @"所属部门负责人";
                    cell.block = ^(NSInteger sender) {
                        [[UIApplication sharedApplication].keyWindow addSubview:weakSelf.pendingView];
                    };
                }
                    break;
                case 1:
                {
                    self.approbvalStep = 2;
                    self.partyingView.cadrelevelArray = self.levelList.copy;
                    self.partyingView.titleLabel.text = self.reportModel.waichushiyou;
                    cell.departmentLabel.text = @"党委工作室";
                    cell.block = ^(NSInteger sender) {
                        [[UIApplication sharedApplication].keyWindow addSubview:weakSelf.partyingView];
                    };
                }
                    break;
                case 2:
                {
                    self.approbvalStep = 3;
                    self.pendingView.titleLabel.text = self.reportModel.waichushiyou;
                    [self.pendingView refreshThePendingView:YES];
                    cell.departmentLabel.text =  @"厂主管（包片）领导";
                    cell.block = ^(NSInteger sender) {
                        [[UIApplication sharedApplication].keyWindow addSubview:weakSelf.pendingView];
                    };
                }
                    break;
                case 3:
                {
                    self.approbvalStep = 4;
                    self.pendingView.titleLabel.text = self.reportModel.waichushiyou;
                    [self.pendingView refreshThePendingView:NO];
                    cell.departmentLabel.text = @"党委书记";
                    cell.block = ^(NSInteger sender) {
                        [[UIApplication sharedApplication].keyWindow addSubview:weakSelf.pendingView];
                    };
                }
                    break;
                case 4:
                {
                    self.approbvalStep = 5;
                    [self.pendingView refreshThePendingView:YES];
                    self.pendingView.titleLabel.text = self.reportModel.waichushiyou;
                    cell.departmentLabel.text = @"厂主要领导";
                    cell.block = ^(NSInteger sender) {
                        [[UIApplication sharedApplication].keyWindow addSubview:weakSelf.pendingView];
                    };
                }
                    break;
                default:
                    break;
            }
            
            return cell;
        } else {
            shenPiModel *model = self.reportArray[indexPath.row];
            PassedCell *passcell = [collectionView dequeueReusableCellWithReuseIdentifier:@"pass" forIndexPath:indexPath];
            NSDictionary *status = self.statusArray[indexPath.row];
            if ([status[@"shenpi_status"] integerValue] == 1) {
                passcell.reviewImage.image = ImageNamed(@"review-pas");
                passcell.reviewStatus.text = @"通过";
                passcell.reviewStatus.textColor = [UIColor colorWithHex:0x1773DB];
            } else if ([status[@"shenpi_status"] integerValue] == -1) {
                passcell.reviewImage.image = ImageNamed(@"review-refuse");
                passcell.reviewStatus.text = @"驳回";
                passcell.reviewStatus.textColor = [UIColor colorWithHex:0xBE0405];
            }
            passcell.reviewname.text = model.name;
            passcell.time.text = status[@"shenpi_time"];
            if ([NSString isStringNull:status[@"shenpi-reason"]]) {
                passcell.reviewAgreement.text = @"无";
            } else {
                passcell.reviewAgreement.text = status[@"shenpi_reaseon"];
            }
            
            switch (indexPath.row) {
                case 0:
                    passcell.department.text = @"所属部门负责人";
                    break;
                case 1:
                    passcell.department.text = @"党委工作室";
                    break;
                case 2:
                    passcell.department.text = @"厂主管（包片）领导";
                    break;
                case 3:
                    passcell.department.text = @"党委书记";
                    break;
                case 4:
                    passcell.department.text = @"厂主要领导";
                    break;
                default:
                    break;
            }
            
            return passcell;
        }
    }
}

//size for item
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return CGSizeMake(SCREENـWIDTH - 20, 80);
        } else {
            CGFloat height = 200;
            CGSize worksize = [self boundsWithFontSize:14 text:[NSString isStringNull:self.reportModel.other] == YES ? @"" : self.reportModel.other needWidth:SCREENـWIDTH - 160 lineSpacing:3];
            if (worksize.height < 30) {
                height = height;
            } else {
                height = height + worksize.height + 20;
            }
            
            
            CGSize causesize = [self boundsWithFontSize:14 text:[NSString isStringNull:self.reportModel.waichushiyou] == YES ? @"" : self.reportModel.waichushiyou needWidth:SCREENـWIDTH - 100 lineSpacing:3];
            if (causesize.height < 30) {
                height = height + 40;
            } else {
                height = height + causesize.height + 20;
            }
            return CGSizeMake(SCREENـWIDTH - 20, height);
        }
    } else {
        return CGSizeMake(SCREENـWIDTH - 20, 80);
    }
}
//inset for section
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    if (section == 0) {
        return UIEdgeInsetsMake(10, 10, 10, 10);
    } else {
        return UIEdgeInsetsMake(5, 10, 10, 10);
    }
}
//interitem
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    if (section == 0) {
        return 5;
    } else {
        return 0;
    }
}
//line spacing
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    if (section == 0) {
        return 5;
    } else {
        return 0;
    }
}
#pragma mark ======   pendingview delegate   ======
- (void)clickTheCloseButtonOperate:(UIButton *)sender{
    [[[UIApplication sharedApplication].keyWindow viewWithTag:1111] removeFromSuperview];
}

- (void)clickTheAgreementButtonOperate:(UIButton *)sender andReason:(NSString *)reason{
    [[[UIApplication sharedApplication].keyWindow viewWithTag:1111] removeFromSuperview];
    [self cadreApprovalStepRequestAndStatus:1 andReason:reason];
    NSLog(@"rease %@",reason);
}

- (void)clickTheTurnDownButtonOpearate:(UIButton *)sender andReason:(NSString *)reason{
    [[[UIApplication sharedApplication].keyWindow viewWithTag:1111] removeFromSuperview];
    [self cadreApprovalStepRequestAndStatus:-1 andReason:reason];
    NSLog(@"rease %@",reason);
}

#pragma mark ======   partying view delegate   ======
//驳回
- (void)partyClickTheTurnDownOperate:(UIButton *)sender andReason:(nonnull NSString *)reason{
    [[[UIApplication sharedApplication].keyWindow viewWithTag:2222] removeFromSuperview];
    [self cadreApprovalStepRequestAndStatus:-1 andReason:reason];
}
//同意
- (void)partyClickTheAgreeMentOperate:(UIButton *)sender andFinished:(BOOL)finish andReason:(nonnull NSString *)reason{
    [[[UIApplication sharedApplication].keyWindow viewWithTag:2222] removeFromSuperview];
    self.finished = finish;
    [self cadreApprovalStepRequestAndStatus:1 andReason:reason];
}
//关闭
- (void)partyClickTheCloseOperate:(UIButton *)sender{
    [[[UIApplication sharedApplication].keyWindow viewWithTag:2222] removeFromSuperview];
}

- (void)partySelectTheModel:(shenPiModel *)shenModel{
    self.shenpi = shenModel;
}

#pragma mark ======   干部审批网络请求   ======
- (void)cadreApprovalStepRequestAndStatus:(NSInteger)status andReason:(NSString *)reason{
    UserModel *user = [UserModel shareUserModel];
    [user getUserInfo];
    NSString *url = @"";
    NSDictionary *json;
    switch (self.approbvalStep) {
        case 1:
        {
            url = CADRE_APPROVAL_STEP_ONE;
            json = @{
                @"token" : user.token,
                @"id" : @(self.reportModel.carid),
                @"step" : @(1),
                @"status" : @(status),
                @"reason" : reason,
                @"is_finished" : @(0),
                @"next_uid" : @(0)
            };
        }
            break;
        case 2:
        {
            url = CADRE_APPROVAL_STEP_TWO;
            if (self.finished) {
                json = @{
                         @"token" : user.token,
                         @"id" : @(self.reportModel.carid),
                         @"step" : @(2),
                         @"status" : @(status),
                         @"reason" : reason,
                         @"is_finished" : @(1),
                         @"next_uid" : @(self.shenpi.shenid)
                         };
            } else {
                json = @{
                         @"token" : user.token,
                         @"id" : @(self.reportModel.carid),
                         @"step" : @(2),
                         @"status" : @(status),
                         @"reason" : reason,
                         @"is_finished" : @(0),
                         @"next_uid" : @(self.shenpi.shenid)
                         };
            }
            
        }
            
            break;
        case 3:
        {
            url = CADRE_APPROVAL_STEP_THREE;
            json = @{
                     @"token" : user.token,
                     @"id" : @(self.reportModel.carid),
                     @"step" : @(3),
                     @"status" : @(status),
                     @"reason" : reason,
                     @"is_finished" : @(0),
                     @"next_uid" : @(0)
                     };
        }
            break;
        case 4:
        {
            url = CADRE_APPROVAL_STEP_FOUR;
            json = @{
                     @"token" : user.token,
                     @"id" : @(self.reportModel.carid),
                     @"step" : @(4),
                     @"status" : @(status),
                     @"reason" : reason,
                     @"is_finished" : @(0),
                     @"next_uid" : @(0)
                     };
        }
            break;
        case 5:
        {
            url = CADRE_APPROVAL_STEP_FIVE;
            json = @{
                     @"token" : user.token,
                     @"id" : @(self.reportModel.carid),
                     @"step" : @(5),
                     @"status" : @(status),
                     @"reason" : reason,
                     @"is_finished" : @(0),
                     @"next_uid" : @(0)
                     };
        }
            break;
        default:
            break;
    }
    [[PartyApi sharePartyApi] partyAuditOperation:url andDict:json andReturnobject:^(NSDictionary * _Nonnull obj) {
        NSInteger code = [obj[@"code"] integerValue];
        if (code == 200) {
            [self cadreRequest];
        } else {
            [self showALertWithTitle:obj[@"msg"]];
        }
    } andError:^(NSError * _Nonnull error) {
        NSData *data = error.userInfo[@"com.alamofire.serialization.response.error.data"];
        NSDictionary *errorDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSLog(@"错误信息:%@",errorDict);
    }];
}

#pragma mark ======   网络请求   ======
- (void)cadreRequest{
    UserModel *user = [UserModel shareUserModel];
    [user getUserInfo];
    NSDictionary *json = @{
                           @"id":self.cadreid,
                           @"token" : user.token
                           };
    [[PartyApi sharePartyApi] partyCadreDetail:json andReturnObject:^(NSDictionary * _Nonnull obj) {
        NSInteger code = [obj[@"code"] integerValue];
        if (code == 200) {
            NSDictionary *dict = obj[@"data"];
            self.reportModel = [CardeReportModel yy_modelWithDictionary:dict];
            [self.statusArray removeAllObjects];
            [self.reportArray removeAllObjects];
            if (self.reportModel.status == 0) {
                self.finished = NO;
            } else {
                self.finished = YES;
            }
            
            if (![dict[@"shenpi1user"] isEqual:[NSNull null]]) {
                shenPiModel *shepi = [shenPiModel yy_modelWithDictionary:dict[@"shenpi1user"]];
                self.reportModel.shenpi1user = shepi;
                [self.reportArray addObject:shepi];
                NSDictionary *json = @{
                                       @"shenpi_status" : self.reportModel.shenpi1_status,
                                       @"shenpi_time" : self.reportModel.shenpi1_time,
                                       @"shenpi_reaseon" : self.reportModel.shenpi1_reason,
                                       @"shenpi_uid" : @(self.reportModel.shenpi1_uid),
                                       @"hope_uid" : NSStringFormat(@"%@",self.reportModel.hope1_uid)
                                       };
                [self.statusArray addObject:json];
            }
            if (![dict[@"shenpi2user"] isEqual:[NSNull null]]) {
                shenPiModel *shepi = [shenPiModel yy_modelWithDictionary:dict[@"shenpi2user"]];
                self.reportModel.shenpi2user = shepi;
                [self.reportArray addObject:shepi];
                NSDictionary *json = @{
                                       @"shenpi_status" : self.reportModel.shenpi2_status,
                                       @"shenpi_time" : self.reportModel.shenpi2_time,
                                       @"shenpi_reaseon" : self.reportModel.shenpi2_reason,
                                       @"shenpi_uid" : @(self.reportModel.shenpi2_uid),
                                       @"hope_uid" : NSStringFormat(@"%@",self.reportModel.hope2_uid)
                                       };
                [self.statusArray addObject:json];
            }
            if (![dict[@"shenpi3user"] isEqual:[NSNull null]]) {
                shenPiModel *shepi = [shenPiModel yy_modelWithDictionary:dict[@"shenpi3user"]];
                self.reportModel.shenpi3user = shepi;
                [self.reportArray addObject:shepi];
                NSDictionary *json = @{
                                       @"shenpi_status" : self.reportModel.shenpi3_status,
                                       @"shenpi_time" : self.reportModel.shenpi3_time,
                                       @"shenpi_reaseon" : self.reportModel.shenpi3_reason,
                                       @"shenpi_uid" : @(self.reportModel.shenpi3_uid),
                                       @"hope_uid" : NSStringFormat(@"%@",self.reportModel.hope3_uid)
                                       };
                [self.statusArray addObject:json];
            }
            if (![dict[@"shenpi4user"] isEqual:[NSNull null]]) {
                shenPiModel *shepi = [shenPiModel yy_modelWithDictionary:dict[@"shenpi4user"]];
                self.reportModel.shenpi4user = shepi;
                [self.reportArray addObject:shepi];
                NSDictionary *json = @{
                                       @"shenpi_status" : self.reportModel.shenpi4_status,
                                       @"shenpi_time" : self.reportModel.shenpi4_time,
                                       @"shenpi_reaseon" : self.reportModel.shenpi4_reason,
                                       @"shenpi_uid" : @(self.reportModel.shenpi4_uid),
                                       @"hope_uid" : NSStringFormat(@"%@",self.reportModel.hope4_uid)
                                       };
                [self.statusArray addObject:json];
            }
            if (![dict[@"shenpi5user"] isEqual:[NSNull null]]) {
                shenPiModel *shepi = [shenPiModel yy_modelWithDictionary:dict[@"shenpi5user"]];
                self.reportModel.shenpi5user = shepi;
                [self.reportArray addObject:shepi];
                NSDictionary *json = @{
                                       @"shenpi_status" : self.reportModel.shenpi5_status,
                                       @"shenpi_time" : self.reportModel.shenpi5_time,
                                       @"shenpi_reaseon" : self.reportModel.shenpi5_reason,
                                       @"shenpi_uid" : @(self.reportModel.shenpi5_uid),
                                       @"hope_uid" : NSStringFormat(@"%@",self.reportModel.hope5_uid)
                                       };
                [self.statusArray addObject:json];
            }
            [self.cadreCollectionView reloadData];
        } else {
            [self showALertWithTitle:obj[@"msg"]];
        }
    } andError:^(NSError * _Nonnull error) {
        NSLog(@"error:%@",error);
    }];
}

#pragma mark ======   干部外出审批列表   ======
- (void)cadreLevelListRequest{
    NSDictionary *json = @{
                           @"level" : @"A"
                           };
    [[PartyApi sharePartyApi] pendingRebviewRequest:json andReturnObject:^(NSDictionary * _Nonnull obj) {
        NSInteger code = [obj[@"code"] integerValue];
        if (code == 200) {
            NSArray *data = obj[@"data"];
            [data enumerateObjectsUsingBlock:^(NSDictionary * dataObj, NSUInteger idx, BOOL * _Nonnull stop) {
                shenPiModel *model = [shenPiModel yy_modelWithDictionary:dataObj];
                [self.levelList addObject:model];
            }];
            
            [self.cadreCollectionView reloadData];
        } else {
            [self showALertWithTitle:obj[@"msg"]];
        }
    } andError:^(NSError * _Nonnull error) {
        NSLog(@"错误信息: %@",error);
    }];
}

- (CGSize)boundsWithFontSize:(CGFloat)fontSize text:(NSString *)text needWidth:(CGFloat)needWidth lineSpacing:(CGFloat )lineSpacing
{
    
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:text];
    
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    
    style.lineSpacing = lineSpacing;
    
    UIFont *font = SYSTEMFONT(fontSize);
    
    [attributeString addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, text.length)];
    
    [attributeString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, text.length)];
    
    NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    
    CGRect rect = [attributeString boundingRectWithSize:CGSizeMake(needWidth, CGFLOAT_MAX) options:options context:nil];
    
    
    
    return rect.size;
    
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

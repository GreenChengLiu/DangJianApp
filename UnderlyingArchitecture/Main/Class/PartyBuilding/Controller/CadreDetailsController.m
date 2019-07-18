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
@interface CadreDetailsController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *cadreCollectionView;

@property (nonatomic, strong) CardeReportModel *reportModel;
@end

@implementation CadreDetailsController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"外出报告单";
    self.cadreCollectionView.backgroundColor = [UIColor colorWithHex:0xe5e5e5];
    
    [self cadreRequest];
    
    [self addTopView];
}

- (void)addTopView{
    [self.cadreCollectionView registerNib:LNib(@"CadreOneCell") forCellWithReuseIdentifier:@"one"];
    [self.cadreCollectionView registerNib:LNib(@"CadreTwoCell") forCellWithReuseIdentifier:@"two"];
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 2;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
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
        
        CGSize si = [self.reportModel.waichushiyou stringSizeWithContentfont:SYSTEMFONT(14) size:CGSizeMake(SCREENـWIDTH - 110, MAXFLOAT) andLine:3 andFirstLineHeadIndent:0];
        CGSize causesize = [self boundsWithFontSize:14 text:[NSString isStringNull:self.reportModel.waichushiyou] == YES ? @"" : self.reportModel.waichushiyou needWidth:SCREENـWIDTH - 110 lineSpacing:3];
        if (causesize.height < 30) {
            twoCell.causeCon.constant = 40;
        } else {
            twoCell.causeCon.constant = causesize.height + 20;
        }
        
        ViewRadius(twoCell, 8);
        return twoCell;
    }
}

//size for item
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return CGSizeMake(SCREENـWIDTH - 20, 80);
    } else {
        CGFloat height = 200;
        CGSize worksize = [self boundsWithFontSize:14 text:[NSString isStringNull:self.reportModel.other] == YES ? @"" : self.reportModel.other needWidth:SCREENـWIDTH - 160 lineSpacing:3];
        if (worksize.height < 30) {
            height = height + 40;
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
}
//inset for section
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}
//interitem
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
}
//line spacing
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
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
            
            [self.cadreCollectionView reloadData];
        } else {
            [self showALertWithTitle:obj[@"msg"]];
        }
    } andError:^(NSError * _Nonnull error) {
        NSLog(@"error:%@",error);
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

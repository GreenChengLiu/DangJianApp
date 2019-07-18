//
//  CadreTwoCell.h
//  UnderlyingArchitecture
//
//  Created by mac on 2019/7/18.
//  Copyright © 2019 liuPengCheng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CadreTwoCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *causeLabel;         //外出事由
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;          //时间
@property (weak, nonatomic) IBOutlet UILabel *numberOfDays;       //天数
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;      //地点
@property (weak, nonatomic) IBOutlet UILabel *accompanyingPerson; //陪同人员
@property (weak, nonatomic) IBOutlet UILabel *insteadOfWorking;   //代替工作

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *workingCon;  //代替工作高度
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *causeCon;    //事由高度


@end

NS_ASSUME_NONNULL_END

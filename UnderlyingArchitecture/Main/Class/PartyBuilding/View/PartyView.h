//
//  PartyView.h
//  UnderlyingArchitecture
//
//  Created by mac on 2019/7/1.
//  Copyright © 2019 liuPengCheng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, partyViewStatus) {
    partyViewStatusInformation = 0,  // 党员信息
    partyViewStatusAssessment,       //考试排行
    partyViewStatusClass,            //三会一课
    partyViewStatusExamination,      //在线考试
    partyViewStatusPayment,          //党费收缴
    partyViewStatusLearn,            //学习强国
    partyViewStatusCadre,            //干部报备
};

typedef NS_ENUM(NSInteger, buildingStatus) {
    buildingStatusDynamic = 0,       //党员动态
    buildingStatusSpeak ,            //书记有话说
    buildingStatusArrangement,       //组织有安排,
    buildingStatusShow,              //成果展示
    buildingStatusPlease,            //基层有请示
    buildingStatusBranch,            //支部排行
    buildingStatusNavigation,        //组织导航
    buildingStatusNews,              //定采微资讯
};


@protocol PartyViewDelegate <NSObject>
@optional
- (void)arrairtsClickOperation:(NSInteger)partyStatus;
- (void)buildingClickOperation:(NSInteger)buildingStatus;

@end
@interface PartyView : UIView
//个人党务 状态
@property (nonatomic, assign) partyViewStatus parytStatus;
/**
 指尖党建
 */
@property (nonatomic, assign) buildingStatus buildingStatu;

@property (nonatomic, weak) id <PartyViewDelegate> delegate;

@end


@protocol partyBackgroundViewDelegate <NSObject>
@optional
- (void)downloadOperation:(UIButton *)sender;

- (void)waitAMinute:(UIButton *)sender;

@end

@interface PartyBackgroundView : UIView

@property (nonatomic, weak) id <partyBackgroundViewDelegate> delegate;

@end



NS_ASSUME_NONNULL_END

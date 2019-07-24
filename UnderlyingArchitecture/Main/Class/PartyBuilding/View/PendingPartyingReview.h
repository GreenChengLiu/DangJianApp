//
//  PendingPartyingReview.h
//  UnderlyingArchitecture
//
//  Created by mac on 2019/7/24.
//  Copyright © 2019 liuPengCheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardeReportModel.h"
NS_ASSUME_NONNULL_BEGIN

@protocol PendingPartyingReviewDelegate <NSObject>
@optional

- (void)partyClickTheCloseOperate:(UIButton *)sender;

- (void)partyClickTheAgreeMentOperate:(UIButton *)sender andFinished:(BOOL)finish andReason:(NSString *)reason;

- (void)partyClickTheTurnDownOperate:(UIButton *)sender andReason:(NSString *)reason;

- (void)partySelectTheModel:(shenPiModel *)shenModel;
@end

@interface PendingPartyingReview : UIView
@property (nonatomic, strong) NSArray *cadrelevelArray;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *closeButton;
@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) UILabel *placeHolder;

@property (nonatomic, weak) id <PendingPartyingReviewDelegate> delegate;
@end

NS_ASSUME_NONNULL_END

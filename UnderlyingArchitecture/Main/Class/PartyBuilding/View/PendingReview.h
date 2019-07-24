//
//  PendingReview.h
//  UnderlyingArchitecture
//
//  Created by mac on 2019/7/23.
//  Copyright © 2019 liuPengCheng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol PendingReviewDelegate <NSObject>
@optional

- (void)clickTheCloseButtonOperate:(UIButton *)sender;

- (void)clickTheAgreementButtonOperate:(UIButton *)sender andReason:(NSString *)reason;
- (void)clickTheTurnDownButtonOpearate:(UIButton *)sender andReason:(NSString *)reason;
@end

@interface PendingReview : UIView <UITextViewDelegate>
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *closeButton;
@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, strong) UILabel *placeHolder;

@property (nonatomic, weak) id <PendingReviewDelegate > delegate;

- (void)refreshThePendingView:(BOOL)finished;
@end

NS_ASSUME_NONNULL_END

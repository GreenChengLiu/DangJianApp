//
//  ShareView.h
//  com.quDongChina
//
//  Created by mac on 2019/6/5.
//  Copyright © 2019 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ShareViewDelegate <NSObject>
@optional
- (void)shareWeiFriendsClick;
- (void)shareWeiCircleClick;
- (void)shareWeiCollectionClick;
- (void)shareQQFriendsClick;
- (void)shareQQSpaceClick;

- (void)shareQQOrWiChatClickWithInteger:(NSInteger)integer;

- (void)dismissShareView;
@end

@interface ShareView : UIView
@property (nonatomic, weak) id <ShareViewDelegate> shareDelegate;

@end

NS_ASSUME_NONNULL_END

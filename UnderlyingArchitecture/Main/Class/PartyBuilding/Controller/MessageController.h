//
//  MessageController.h
//  UnderlyingArchitecture
//
//  Created by liuPengCheng on 2019/7/15.
//  Copyright © 2019 liuPengCheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
NS_ASSUME_NONNULL_BEGIN
typedef void(^messageBlock)(void);

@interface MessageController : BaseViewController
@property (nonatomic, copy) messageBlock block;

@end

NS_ASSUME_NONNULL_END

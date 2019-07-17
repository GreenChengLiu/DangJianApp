//
//  AchievementDisplayController.h
//  UnderlyingArchitecture
//
//  Created by liuPengCheng on 2019/7/12.
//  Copyright © 2019 liuPengCheng. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface AchievementDisplayController : BaseViewController

@property (nonatomic, copy) NSString *categoryID;
@property (nonatomic, assign) NSInteger page;
@end

NS_ASSUME_NONNULL_END

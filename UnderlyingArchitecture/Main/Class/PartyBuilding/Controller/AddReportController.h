//
//  AddReportController.h
//  UnderlyingArchitecture
//
//  Created by mac on 2019/7/3.
//  Copyright © 2019 liuPengCheng. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^AddReportControllerBlock)(void);

@interface AddReportController : BaseViewController


@property (nonatomic, copy) AddReportControllerBlock block;
@end

NS_ASSUME_NONNULL_END

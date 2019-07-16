//
//  DynamicDetailsController.h
//  UnderlyingArchitecture
//
//  Created by mac on 2019/6/27.
//  Copyright © 2019 liuPengCheng. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface DynamicDetailsController : BaseViewController
@property (nonatomic, copy) NSString *content;  //内容栏
@property (nonatomic, copy) NSString *name; // 标题
@end

NS_ASSUME_NONNULL_END

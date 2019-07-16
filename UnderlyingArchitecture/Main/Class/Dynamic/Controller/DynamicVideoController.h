//
//  DynamicVideoController.h
//  UnderlyingArchitecture
//
//  Created by mac on 2019/6/28.
//  Copyright © 2019 liuPengCheng. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface DynamicVideoController : BaseViewController
@property (nonatomic, copy) NSString *content;  //内容栏
@property (nonatomic, copy) NSString *name; // 标题
@property (nonatomic, copy) NSString *imgurl;  //图片高度
@end

NS_ASSUME_NONNULL_END

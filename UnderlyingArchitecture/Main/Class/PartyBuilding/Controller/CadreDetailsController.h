//
//  CadreDetailsController.h
//  UnderlyingArchitecture
//
//  Created by mac on 2019/7/3.
//  Copyright © 2019 liuPengCheng. All rights reserved.
//

#import "BaseViewController.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^CadreDetailsControllerBlcok)(BOOL isFinished);

@interface CadreDetailsController : BaseViewController
@property (nonatomic, copy) NSString *cadreid;
@property (nonatomic, copy) NSString *headimgurl;

@property (nonatomic, copy) CadreDetailsControllerBlcok block;
@end

NS_ASSUME_NONNULL_END

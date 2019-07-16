//
//  UserApi.h
//  UnderlyingArchitecture
//
//  Created by mac on 2019/6/26.
//  Copyright © 2019 liuPengCheng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserApi : NSObject
+ (instancetype)shareUserApi;

/**
 登录接口

 @param json 参数
 @param success 返回值
 @param err 错误信息
 */
- (void)QDLoginWithParameter:(NSDictionary *)json andReturnObject:(void(^)(NSDictionary *obj))success andError:(void(^)(NSError *error))err;

@end

NS_ASSUME_NONNULL_END

//
//  UserApi.m
//  UnderlyingArchitecture
//
//  Created by mac on 2019/6/26.
//  Copyright © 2019 liuPengCheng. All rights reserved.
//

#import "UserApi.h"
#import "QDApi.h"
@implementation UserApi

static UserApi *api = nil;
+ (instancetype)shareUserApi{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        api = [[self alloc] init];
    });
    return api;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        api = [super allocWithZone:zone];
    });
    return api;
}
- (id)copyWithZone:(NSZone *)zone{
    return api;
}
- (id)mutableCopyWithZone:(NSZone *)zone{
    return api;
}

- (void)QDLoginWithParameter:(NSDictionary *)json andReturnObject:(void (^)(NSDictionary * _Nonnull))success andError:(void (^)(NSError * _Nonnull))err{
    [QDApi apiRequestWithRequestMethod:@"post" Url:USER_LOGIN andJson:json andBlock:^(NSDictionary * _Nonnull dict) {
        success(dict);
    } andError:^(NSError * _Nonnull error) {
        err(error);
    }];
}

@end

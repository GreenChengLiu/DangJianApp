//
//  DynamicApi.m
//  UnderlyingArchitecture
//
//  Created by mac on 2019/6/27.
//  Copyright © 2019 liuPengCheng. All rights reserved.
//

#import "DynamicApi.h"
#import "QDApi.h"
@implementation DynamicApi
static DynamicApi *api = nil;

+ (instancetype)shareDynamicApi{
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

- (void)DynamicListParameter:(NSDictionary *)json andReturnObject:(void (^)(NSDictionary * _Nonnull))success andError:(void (^)(NSError * _Nonnull))err{
    [QDApi apiRequestWithRequestMethod:@"post" Url:DYNAMIC_LIST andJson:json andBlock:^(NSDictionary * _Nonnull dict) {
        success(dict);
    } andError:^(NSError * _Nonnull error) {
        err(error);
    }];
}
@end

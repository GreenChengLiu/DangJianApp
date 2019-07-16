//
//  OrganApi.m
//  UnderlyingArchitecture
//
//  Created by mac on 2019/6/27.
//  Copyright © 2019 liuPengCheng. All rights reserved.
//

#import "OrganApi.h"
#import "QDApi.h"
@implementation OrganApi
static OrganApi *api = nil;
+ (instancetype)shareOrganApi{
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

@end

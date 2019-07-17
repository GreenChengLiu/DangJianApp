//
//  PartyApi.m
//  UnderlyingArchitecture
//
//  Created by mac on 2019/6/27.
//  Copyright © 2019 liuPengCheng. All rights reserved.
//

#import "PartyApi.h"
#import "QDApi.h"
@implementation PartyApi
static PartyApi *api = nil;
+ (instancetype)sharePartyApi{
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
#pragma mark ======   轮播图   ======
- (void)partyCarouseMapWithParameters:(NSDictionary *)json andReturnObject:(void (^)(NSDictionary * _Nonnull))success andError:(void (^)(NSError * _Nonnull))err{
    NSLog(@"请求链接 %@",PARTY_CAROUSEL_MAP);
    [QDApi apiRequestWithRequestMethod:@"post" Url:PARTY_CAROUSEL_MAP andJson:json andBlock:^(NSDictionary * _Nonnull dict) {
        success(dict);
    } andError:^(NSError * _Nonnull error) {
        err(error);
    }];
}
#pragma mark ======   党建动态   ======
- (void)partyStatusParameters:(NSDictionary *)json andReturnObject:(void (^)(NSDictionary * _Nonnull))success andError:(void (^)(NSError * _Nonnull))err{
    NSLog(@"请求链接 %@",PARTY_STATUS);
    [QDApi apiRequestWithRequestMethod:@"post" Url:PARTY_STATUS andJson:json andBlock:^(NSDictionary * _Nonnull dict) {
        success(dict);
    } andError:^(NSError * _Nonnull error) {
        err(error);
    }];
}

#pragma mark ======   排行   ======
- (void)partyExamRankingParameters:(NSDictionary *)json andReturnObject:(void (^)(NSDictionary * _Nonnull))success andError:(void (^)(NSError * _Nonnull))err{
    NSLog(@"排行url:%@",PARTY_RANKING);
    [QDApi apiRequestWithRequestMethod:@"post" Url:PARTY_RANKING andJson:json andBlock:^(NSDictionary * _Nonnull dict) {
        success(dict);
    } andError:^(NSError * _Nonnull error) {
        err(error);
    }];
}

#pragma mark ======   干部报备列表   ======
- (void)partyCadreReportListParameters:(NSDictionary *)json andReturnObject:(void (^)(NSDictionary * _Nonnull))success andError:(void (^)(NSError * _Nonnull))err{
    NSLog(@"干部报备列表url %@",PARTY_CADRE_REPORT_LIST);
    [QDApi apiRequestWithRequestMethod:@"post" Url:PARTY_CADRE_REPORT_LIST andJson:json andBlock:^(NSDictionary * _Nonnull dict) {
        success(dict);
    } andError:^(NSError * _Nonnull error) {
        err(error);
    }];
}
#pragma mark ======   干部报备外出添加   ======
- (void)partyCadreReportAddParameters:(NSDictionary *)json andReturnObject:(void (^)(NSDictionary * _Nonnull))success andError:(void (^)(NSError * _Nonnull))err{
    NSLog(@"干部报备外出添加url %@",PARTY_CADRE_REPORT_ADD);
    [QDApi apiRequestWithRequestMethod:@"post" Url:PARTY_CADRE_REPORT_ADD andJson:json andBlock:^(NSDictionary * _Nonnull dict) {
        success(dict);
    } andError:^(NSError * _Nonnull error) {
        err(error);
    }];
}
#pragma mark ======   考核列表   ======
- (void)partyAssessmentListParameters:(NSDictionary *)json andReturnObject:(void (^)(NSDictionary * _Nonnull))success andError:(void (^)(NSError * _Nonnull))err{
    NSLog(@"三会一课  考核列表 url  :%@",PARTY_ASSESSMENT_LIST);
    [QDApi apiRequestWithRequestMethod:@"post" Url:PARTY_ASSESSMENT_LIST andJson:json andBlock:^(NSDictionary * _Nonnull dict) {
        success(dict);
    } andError:^(NSError * _Nonnull error) {
        err(error);
    }];
}
- (void)achievementControllerWithParmeters:(NSDictionary *)json andReturnObject:(void (^)(NSDictionary * _Nonnull))success andError:(void (^)(NSError * _Nonnull))err{
    [QDApi apiRequestWithRequestMethod:@"post" Url:PARTY_ARTICLES andJson:json andBlock:^(NSDictionary * _Nonnull dict) {
        success(dict);
    } andError:^(NSError * _Nonnull error) {
        err(error);
    }];
}

- (void)secretaryToTalkRequestParmeters:(NSDictionary *)json andReturnObject:(void (^)(NSDictionary * _Nonnull))success andError:(void (^)(NSError * _Nonnull))err{
    [QDApi apiRequestWithRequestMethod:@"post" Url:PARTY_SECRETARY andJson:json andBlock:^(NSDictionary * _Nonnull dict) {
        success(dict);
    } andError:^(NSError * _Nonnull error) {
        err(error);
    }];
}

- (void)receivePhonesRequest:(NSDictionary *)json andReturnObject:(void (^)(NSDictionary * _Nonnull))success andError:(void (^)(NSError * _Nonnull))err{
    [QDApi apiRequestWithRequestMethod:@"post" Url:PARTY_RECEIVE andJson:json andBlock:^(NSDictionary * _Nonnull dict) {
        success(dict);
    } andError:^(NSError * _Nonnull error) {
        err(error);
    }];
}

- (void)messageAddRequest:(NSDictionary *)json andReturnObject:(void (^)(NSDictionary * _Nonnull))success andError:(void (^)(NSError * _Nonnull))err{
    [QDApi apiRequestWithRequestMethod:@"post" Url:PARTY_MESSAGE_ADD andJson:json andBlock:^(NSDictionary * _Nonnull dict) {
        success(dict);
    } andError:^(NSError * _Nonnull error) {
        err(error);
    }];
}

@end

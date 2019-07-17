//
//  PartyApi.h
//  UnderlyingArchitecture
//
//  Created by mac on 2019/6/27.
//  Copyright © 2019 liuPengCheng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PartyApi : NSObject
+ (instancetype)sharePartyApi;

/**
 轮播图请求

 @param json 无
 */
- (void)partyCarouseMapWithParameters:(NSDictionary *)json andReturnObject:(void(^)(NSDictionary *obj))success andError:(void(^)(NSError *error))err;

/**
 党建动态

 @param json 无
 */
- (void)partyStatusParameters:(NSDictionary *)json andReturnObject:(void(^)(NSDictionary *obj))success andError:(void(^)(NSError *error))err;

/**
 考核排行白

 @param json status 1->支部  2->个人  times 默认当前年  page  分页 limit 数据数  token
 @param success 成功
 @param err 失败
 */
- (void)partyExamRankingParameters:(NSDictionary *)json andReturnObject:(void(^)(NSDictionary *obj))success andError:(void(^)(NSError *error))err;

/**
 干部报备列表

 @param json token page  limit
 @param success 成功
 @param err 失败
 */
- (void)partyCadreReportListParameters:(NSDictionary *)json andReturnObject:(void(^)(NSDictionary *obj))success andError:(void(^)(NSError *error))err;

/**
 干部报备外出添加

 @param json token  / name / bumen /zhiwu / waichushiyou / waichushijian / waichuqixian / waichudidian / tongxingrenyuan / waichu_phone / other
 @param success 成功
 @param err 失败
 */
- (void)partyCadreReportAddParameters:(NSDictionary *)json andReturnObject:(void(^)(NSDictionary *obj))success andError:(void(^)(NSError *error))err;

/**
 三会一课 考核列表

 @param json token  / page  /  limit
 @param success 成功
 @param err 错误
 */
- (void)partyAssessmentListParameters:(NSDictionary *)json andReturnObject:(void(^)(NSDictionary *obj))success andError:(void(^)(NSError *error))err;
/**
 成果有展示
 
 @param json category_id:
 @param success 成功
 @param err 失败
 */
- (void)achievementControllerWithParmeters:(NSDictionary *)json andReturnObject:(void(^)(NSDictionary *obj))success andError:(void(^)(NSError *error))err;

/**
 书记有话说
 
 @param json page limit
 @param success 成功
 @param err 失败
 */
- (void)secretaryToTalkRequestParmeters:(NSDictionary *)json andReturnObject:(void(^)(NSDictionary *obj))success andError:(void(^)(NSError *error))err;

- (void)receivePhonesRequest:(NSDictionary *)json andReturnObject:(void(^)(NSDictionary *obj))success andError:(void(^)(NSError *error))err;
- (void)messageAddRequest:(NSDictionary *)json andReturnObject:(void(^)(NSDictionary *obj))success andError:(void(^)(NSError *error))err;
@end

NS_ASSUME_NONNULL_END

//
//  SecreataryModel.h
//  UnderlyingArchitecture
//
//  Created by liuPengCheng on 2019/7/15.
//  Copyright © 2019 liuPengCheng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class ReceiveModel;

@interface SecreataryModel : NSObject
@property (nonatomic, assign) NSInteger seid;// 60,
@property (nonatomic, copy) NSString *title;// "认真落实主题教育相关事宜",
@property (nonatomic, assign) NSInteger uid;// 1406,
@property (nonatomic, assign) NSInteger to_ogid;// 0,
@property (nonatomic, assign) NSInteger is_gongkai;// -1,
@property (nonatomic, copy) NSString *content;// "各支部书记要尽快按照采油厂党委主题教育落实计划，将主题教育落实到位。不清楚或者有疑惑的尽快与党委工作室沟通，确保主题活动取得实效。",
@property (nonatomic, copy) NSString *add_time;// "2019-06-19"

@end

@interface ReceiveModel : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *phone;

@property (nonatomic, assign) BOOL isSelect;
@end

NS_ASSUME_NONNULL_END

//
//  NSDictionary+AnalysisData.h
//  世纪金花
//
//  Created by damai on 16/8/31.
//  Copyright © 2016年 damai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (AnalysisData)

- (NSDictionary *)dictForKey:(NSString *)key;

- (NSDictionary *)dictForKey:(NSString *)key defaultValue:(NSDictionary *)defaultValue;

- (NSArray *)arrayForKey:(NSString *)key;

- (NSArray *)arrayForKey:(NSString *)key defaultValue:(NSArray *)defaultValue;

- (NSString *)stringForKey:(NSString *)key;

- (NSString *)stringForKey:(NSString *)key defaultValue:(NSString *)defaultValue;

- (NSInteger)integerForKey:(NSString *)key;

- (NSInteger)integerForKey:(NSString *)key defaultValue:(NSInteger)defaultValue;

- (double)doubleForKey:(NSString *)key;

- (double)doubleForKey:(NSString *)key defaultValue:(double)defaultValue;

- (BOOL)boolForKey:(NSString *)key;

- (BOOL)boolForKey:(NSString *)key defaultValue:(BOOL)defaultValue;

@end

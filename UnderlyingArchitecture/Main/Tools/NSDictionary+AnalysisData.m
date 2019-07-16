//
//  NSDictionary+AnalysisData.m
//  世纪金花
//
//  Created by damai on 16/8/31.
//  Copyright © 2016年 damai. All rights reserved.
//

#import "NSDictionary+AnalysisData.h"

@implementation NSDictionary (AnalysisData)

- (NSDictionary *)dictForKey:(NSString *)key
{
    return [self dictForKey:key defaultValue:[NSDictionary dictionary]];
}

- (NSDictionary *)dictForKey:(NSString *)key defaultValue:(NSDictionary *)defaultValue
{
    id object = [self objectForKey:key];
    if (![object isKindOfClass:[NSDictionary class]]){
        return defaultValue;
    }
    return object;
}

- (NSArray *)arrayForKey:(NSString *)key{
    return [self arrayForKey:key defaultValue:[NSArray array]];
}

- (NSArray *)arrayForKey:(NSString *)key defaultValue:(NSArray *)defaultValue{
    id object = [self objectForKey:key];
    if (![object isKindOfClass:[NSArray class]]) {
        return defaultValue;
    }
    return object;
}

- (NSString *)stringForKey:(NSString *)key{
    return [self stringForKey:key defaultValue:[NSString string]];
}

- (NSString *)stringForKey:(NSString *)key defaultValue:(NSString *)defaultValue{
    id object = [self objectForKey:key];
    if (![object isKindOfClass:[NSString class]]) {
        return defaultValue;
    }
    return object;
}

- (NSInteger)integerForKey:(NSString *)key{
    return [self integerForKey:key
                     defaultValue:0];
}

- (NSInteger)integerForKey:(NSString *)key defaultValue:(NSInteger)defaultValue{
    id value = [self objectForKey:key];
    if (value && [value respondsToSelector:@selector(integerValue)]){
        return [value integerValue];
    }
    return defaultValue;
}

- (double)doubleForKey:(NSString *)key{
    return [self doubleForKey:key defaultValue:0.0];
}

- (double)doubleForKey:(NSString *)key defaultValue:(double)defaultValue{
    id value = [self objectForKey:key];
    if (value && [value respondsToSelector:@selector(doubleValue)]){
        return [value doubleValue];
    }
    return defaultValue;
}

- (BOOL)boolForKey:(NSString *)key{
    return [self boolForKey:key defaultValue:NO];
}

- (BOOL)boolForKey:(NSString *)key defaultValue:(BOOL)defaultValue{
    id value = [self objectForKey:key];
    if (value && [value respondsToSelector:@selector(boolValue)]){
        return [value boolValue];
    }
    return defaultValue;
}


@end

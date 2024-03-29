//
//  ZYTokenManager.m
//  自定义搜索框并缓存搜索记录
//
//  Created by xiayong on 16/3/11.
//  Copyright © 2016年 bianguo. All rights reserved.
//

#import "ZYTokenManager.h"

@implementation ZYTokenManager


//缓存搜索数组
+(void)SearchText :(NSString *)seaTxt
{
    NSUserDefaults *userDefaultes = [NSUserDefaults standardUserDefaults];
    //读取数组NSArray类型的数据
    NSArray *myArray = [userDefaultes arrayForKey:@"myArray"];
    if (myArray.count > 0) {//先取出数组，判断是否有值，有值继续添加，无值创建数组
        
    }else{
        myArray = [NSArray array];
    }
    // NSArray --> NSMutableArray
    NSMutableArray *searTXT = [myArray mutableCopy];
//    [searTXT addObject:seaTxt];
    [searTXT insertObject:seaTxt atIndex:0];
//    if(searTXT.count > 9)
//    {
//        [searTXT removeObjectAtIndex:0];
//    }
    //将上述数据全部存储到NSUserDefaults中
    //        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaultes setObject:searTXT forKey:@"myArray"];
    [userDefaultes synchronize];
}

+ (void)removeTextWith:(NSString *)tag{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSArray *myArray = [userDefaults arrayForKey:@"myArray"];
    NSMutableArray *array = myArray.mutableCopy;
    [array enumerateObjectsUsingBlock:^(NSString * obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isEqualToString:tag]) {
            [array removeObjectAtIndex:idx];
            
            *stop = YES;
        }
    }];
    
    [userDefaults setObject:array forKey:@"myArray"];
    [userDefaults synchronize];
}

+(void)removeAllArray{
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:@"myArray"];
    [userDefaults synchronize];
}


@end

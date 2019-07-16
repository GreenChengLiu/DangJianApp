//
//  ZYTokenManager.h
//  自定义搜索框并缓存搜索记录
//
//  Created by xiayong on 16/3/11.
//  Copyright © 2016年 bianguo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZYTokenManager : NSObject
//缓存搜索的数组
+(void)SearchText :(NSString *)seaTxt;
/**
 清除缓存数组中的某一条数据

 @param tag 需要被清除的 文字
 */
+ (void)removeTextWith:(NSString *)tag;
//清除缓存数组
+(void)removeAllArray;
@end
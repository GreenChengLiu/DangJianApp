//
//  NSArray+judgement.h
//  com.quDongChina
//
//  Created by mac on 2019/5/31.
//  Copyright © 2019 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BrokeModel.h"
#import <CoreText/CoreText.h>
NS_ASSUME_NONNULL_BEGIN

@interface NSArray (judgement)
//针对返回的model中的image，集成数组。
//+ (NSArray *)findModelImage:(BrokeModel *)model;

//返回行数
+ (NSArray *)getLinesArrayOfStringInLabel:(NSString *)string font:(UIFont *)font andLableWidth:(CGFloat)lableWidth;
@end

NS_ASSUME_NONNULL_END

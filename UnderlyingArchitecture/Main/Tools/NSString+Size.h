//
//  NSString+Size.h
//  CustomTabbar
//
//  Created by CDchen on 2017/9/4.
//  Copyright © 2017年 Dong Chen. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>
@interface NSString (Size)

- (CGSize)stringSizeWithContentSize:(CGSize)contentSize font:(UIFont *)font;



/**
 字典转json字符串方法

 @param dict 数据字典
 @return 字符串
 */
+(NSString *)convertToJsonData:(NSDictionary *)dict;

/**
 返回可变字符内容

 @param contentString 可变字符内容
 @param line 行间距
 @param indent 首行缩进
 @param font 字体大小
 @param color 颜色
 @return 返回整理好的内容
 */
+ (NSAttributedString *)createAMutableAttributedString:(NSString *)contentString andLine:(CGFloat)line andFirstLineHeadIndent:(CGFloat)indent andfont:(UIFont *)font andColor:(UIColor *)color andTextAligenment:(NSTextAlignment)alignment;


- (CGSize)stringSizeWithContentfont:(UIFont *)font size:(CGSize)contentSize andLine:(CGFloat)line andFirstLineHeadIndent:(CGFloat)indent;

@end

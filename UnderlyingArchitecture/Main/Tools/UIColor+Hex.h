//
//  UIColor+Hex.h
//  iOSKDD
//
//  Created by DY029 on 13-8-14.
//  Copyright (c) 2013年 KuaiDianDing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)
+ (UIColor*)colorFromHexString:(NSString *)inColorString;
+ (UIColor*)colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue;
+ (UIColor*)colorWithHex:(NSInteger)hexValue;
+ (UIImage *)createImageWithColor:(UIColor *)color;
+ (UIImage *)createImageWithColor:(UIColor *)color AndSize:(CGSize )size;
@end

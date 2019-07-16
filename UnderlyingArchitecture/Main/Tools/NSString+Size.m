//
//  NSString+Size.m
//  CustomTabbar
//
//  Created by CDchen on 2017/9/4.
//  Copyright © 2017年 Dong Chen. All rights reserved.
//

#import "NSString+Size.h"

@implementation NSString (Size)

- (CGSize)stringSizeWithContentSize:(CGSize)contentSize font:(UIFont *)font
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    paragraphStyle.lineSpacing = 8;
    NSDictionary *attributes = @{NSFontAttributeName: font,NSParagraphStyleAttributeName:paragraphStyle.copy};
    CGSize size = [self boundingRectWithSize:contentSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    return size;
}

// 字典转json字符串方法

+(NSString *)convertToJsonData:(NSDictionary *)dict{
    
    NSError *error;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    
    NSString *jsonString;
    
    if (!jsonData) {
        
        NSLog(@"%@",error);
        
    }else{
        
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
        
    }
    
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    
    NSRange range = {0,jsonString.length};
    
    //去掉字符串中的空格
    
    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    
    NSRange range2 = {0,mutStr.length};
    
    //去掉字符串中的换行符
    
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    
    return mutStr;
    
}

+ (NSAttributedString *)createAMutableAttributedString:(NSString *)contentString andLine:(CGFloat)line andFirstLineHeadIndent:(CGFloat)indent andfont:(UIFont *)font andColor:(UIColor *)color andTextAligenment:(NSTextAlignment)alignment{
//    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] init];
    NSMutableParagraphStyle *style = [NSMutableParagraphStyle new];
    style.lineSpacing = line;
    style.firstLineHeadIndent = indent;
    style.alignment = alignment;
    
    NSAttributedString *attributed = [[NSAttributedString alloc] initWithString:contentString attributes:@{NSParagraphStyleAttributeName : style, NSForegroundColorAttributeName : color , NSFontAttributeName : font}];
//    [attributedString appendAttributedString:attributed];
    return attributed;
}

- (CGSize)stringSizeWithContentfont:(UIFont *)font size:(CGSize)contentSize andLine:(CGFloat)line andFirstLineHeadIndent:(CGFloat)indent{
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    paragraphStyle.lineSpacing = line;
    paragraphStyle.firstLineHeadIndent = indent;
    NSDictionary *attributes = @{NSFontAttributeName: font,NSParagraphStyleAttributeName:paragraphStyle};
    CGSize size = [self boundingRectWithSize:contentSize options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributes context:nil].size;
    return size;
}

@end

//
//  NSArray+judgement.m
//  com.quDongChina
//
//  Created by mac on 2019/5/31.
//  Copyright © 2019 mac. All rights reserved.
//

#import "NSArray+judgement.h"

@implementation NSArray (judgement)

//+ (NSArray *)findModelImage:(BrokeModel *)model{
//    NSMutableArray *imageArray = [NSMutableArray array];
//    if (![NSString isStringNull:model.image1] && ![NSString isStringNull:model.image2] && ![NSString isStringNull:model.image3] &&
//        ![NSString isStringNull:model.image4] && ![NSString isStringNull:model.image5] && ![NSString isStringNull:model.image6] &&
//        ![NSString isStringNull:model.image7] && ![NSString isStringNull:model.image8] && ![NSString isStringNull:model.image9]) {
//        [imageArray addObject:model.image1];
//        [imageArray addObject:model.image2];
//        [imageArray addObject:model.image3];
//        [imageArray addObject:model.image4];
//        [imageArray addObject:model.image5];
//        [imageArray addObject:model.image6];
//        [imageArray addObject:model.image7];
//        [imageArray addObject:model.image8];
//        [imageArray addObject:model.image9];
//    } else if (![NSString isStringNull:model.image1] && ![NSString isStringNull:model.image2] && ![NSString isStringNull:model.image3] &&
//               ![NSString isStringNull:model.image4] && ![NSString isStringNull:model.image5] && ![NSString isStringNull:model.image6] &&
//               ![NSString isStringNull:model.image7] && ![NSString isStringNull:model.image8] && [NSString isStringNull:model.image9]){
//        [imageArray addObject:model.image1];
//        [imageArray addObject:model.image2];
//        [imageArray addObject:model.image3];
//        [imageArray addObject:model.image4];
//        [imageArray addObject:model.image5];
//        [imageArray addObject:model.image6];
//        [imageArray addObject:model.image7];
//        [imageArray addObject:model.image8];
//    } else if (![NSString isStringNull:model.image1] && ![NSString isStringNull:model.image2] && ![NSString isStringNull:model.image3] &&
//               ![NSString isStringNull:model.image4] && ![NSString isStringNull:model.image5] && ![NSString isStringNull:model.image6] &&
//               ![NSString isStringNull:model.image7] && [NSString isStringNull:model.image8] && [NSString isStringNull:model.image9]) {
//        [imageArray addObject:model.image1];
//        [imageArray addObject:model.image2];
//        [imageArray addObject:model.image3];
//        [imageArray addObject:model.image4];
//        [imageArray addObject:model.image5];
//        [imageArray addObject:model.image6];
//        [imageArray addObject:model.image7];
//    } else if (![NSString isStringNull:model.image1] && ![NSString isStringNull:model.image2] && ![NSString isStringNull:model.image3] &&
//               ![NSString isStringNull:model.image4] && ![NSString isStringNull:model.image5] && ![NSString isStringNull:model.image6] &&
//               [NSString isStringNull:model.image7] && [NSString isStringNull:model.image8] && [NSString isStringNull:model.image9]) {
//        [imageArray addObject:model.image1];
//        [imageArray addObject:model.image2];
//        [imageArray addObject:model.image3];
//        [imageArray addObject:model.image4];
//        [imageArray addObject:model.image5];
//        [imageArray addObject:model.image6];
//    } else if (![NSString isStringNull:model.image1] && ![NSString isStringNull:model.image2] && ![NSString isStringNull:model.image3] &&
//               ![NSString isStringNull:model.image4] && ![NSString isStringNull:model.image5] && [NSString isStringNull:model.image6] &&
//               [NSString isStringNull:model.image7] && [NSString isStringNull:model.image8] && [NSString isStringNull:model.image9]) {
//        [imageArray addObject:model.image1];
//        [imageArray addObject:model.image2];
//        [imageArray addObject:model.image3];
//        [imageArray addObject:model.image4];
//        [imageArray addObject:model.image5];
//    } else if (![NSString isStringNull:model.image1] && ![NSString isStringNull:model.image2] && ![NSString isStringNull:model.image3] &&
//               ![NSString isStringNull:model.image4] && [NSString isStringNull:model.image5] && [NSString isStringNull:model.image6] &&
//               [NSString isStringNull:model.image7] && [NSString isStringNull:model.image8] && [NSString isStringNull:model.image9]) {
//        [imageArray addObject:model.image1];
//        [imageArray addObject:model.image2];
//        [imageArray addObject:model.image3];
//        [imageArray addObject:model.image4];
//    } else if (![NSString isStringNull:model.image1] && ![NSString isStringNull:model.image2] && ![NSString isStringNull:model.image3] &&
//               [NSString isStringNull:model.image4] && [NSString isStringNull:model.image5] && [NSString isStringNull:model.image6] &&
//               [NSString isStringNull:model.image7] && [NSString isStringNull:model.image8] && [NSString isStringNull:model.image9]) {
//        [imageArray addObject:model.image1];
//        [imageArray addObject:model.image2];
//        [imageArray addObject:model.image3];
//    } else if (![NSString isStringNull:model.image1] && ![NSString isStringNull:model.image2] && [NSString isStringNull:model.image3] &&
//               [NSString isStringNull:model.image4] && [NSString isStringNull:model.image5] && [NSString isStringNull:model.image6] &&
//               [NSString isStringNull:model.image7] && [NSString isStringNull:model.image8] && [NSString isStringNull:model.image9]) {
//        [imageArray addObject:model.image1];
//        [imageArray addObject:model.image2];
//    } else if (![NSString isStringNull:model.image1] && [NSString isStringNull:model.image2] && [NSString isStringNull:model.image3] &&
//               [NSString isStringNull:model.image4] && [NSString isStringNull:model.image5] && [NSString isStringNull:model.image6] &&
//               [NSString isStringNull:model.image7] && [NSString isStringNull:model.image8] && [NSString isStringNull:model.image9]) {
//        [imageArray addObject:model.image1];
//    }
//    return imageArray.copy;
//}

+ (NSArray *)getLinesArrayOfStringInLabel:(NSString *)string font:(UIFont *)font andLableWidth:(CGFloat)lableWidth{
    
    CTFontRef myFont = CTFontCreateWithName(( CFStringRef)([font fontName]), [font pointSize], NULL);
    NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:string];
    [attStr addAttribute:(NSString *)kCTFontAttributeName value:(__bridge  id)myFont range:NSMakeRange(0, attStr.length)];
    CFRelease(myFont);
    CTFramesetterRef frameSetter = CTFramesetterCreateWithAttributedString(( CFAttributedStringRef)attStr);
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, CGRectMake(0,0,lableWidth,100000));
    CTFrameRef frame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, 0), path, NULL);
    NSArray *lines = ( NSArray *)CTFrameGetLines(frame);
    NSMutableArray *linesArray = [[NSMutableArray alloc]init];
    for (id line in lines) {
        CTLineRef lineRef = (__bridge  CTLineRef )line;
        CFRange lineRange = CTLineGetStringRange(lineRef);
        NSRange range = NSMakeRange(lineRange.location, lineRange.length);
        NSString *lineString = [string substringWithRange:range];
        CFAttributedStringSetAttribute((CFMutableAttributedStringRef)attStr, lineRange, kCTKernAttributeName, (CFTypeRef)([NSNumber numberWithFloat:0.0]));
        CFAttributedStringSetAttribute((CFMutableAttributedStringRef)attStr, lineRange, kCTKernAttributeName, (CFTypeRef)([NSNumber numberWithInt:0.0]));
        [linesArray addObject:lineString];
    }
    
    CGPathRelease(path);
    CFRelease( frame );
    CFRelease(frameSetter);
    return (NSArray *)linesArray;
}
@end

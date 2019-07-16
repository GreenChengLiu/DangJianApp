//
//  NSString+Judgement.m
//  PandaNaughty
//
//  Created by damai on 2018/2/24.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "NSString+Judgement.h"
#import <CommonCrypto/CommonCrypto.h>

@implementation NSString (Judgement)
#pragma mark ====== << 验证是否存在表情符 >> =====
-(BOOL)hasEmoji
{
    __block BOOL returnValue = NO;
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:
     ^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
         const unichar hs = [substring characterAtIndex:0];
         if (0xd800 <= hs && hs <= 0xdbff)
         {
             if (substring.length > 1)
             {
                 const unichar ls = [substring characterAtIndex:1];
                 const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                 if (0x1d000 <= uc && uc <= 0x1f77f)
                 {
                     returnValue = YES;
                 }
             }
         }
         else
         {
             if (0x2100 <= hs && hs <= 0x27ff) {
                 returnValue = YES;
             } else if (0x2B05 <= hs && hs <= 0x2b07) {
                 returnValue = YES;
             } else if (0x2934 <= hs && hs <= 0x2935) {
                 returnValue = YES;
             } else if (0x3297 <= hs && hs <= 0x3299) {
                 returnValue = YES;
             } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50)
             {
                 returnValue = YES;
             }
             if(substring.length > 1)
             {
                 const unichar ls = [substring characterAtIndex:1];
                 if (ls == 0x20e3)
                 {
                     returnValue = YES;
                 }
             }
         }
     }];
    return returnValue;
}
#pragma mark - 邮箱校验
-(BOOL)verifyForEmail
{
    NSString *regEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    return [self baseCheckForRegEx:regEx data:self];
}

#pragma mark - 验证手机号
-(BOOL)verifyForMobilePhoneNo
{
    //    NSString *regEx = @"^1[3|4|5|7|8][0-9]\\d{8}$";
    NSString *regEx = @"^((13[0-9])|(17[0-9])|(14[0-9])|(15[^4,\\D])|(18[0,0-9])|(19[0,0-9])|(16[6,0-9]))\\d{8}$";
    return [self baseCheckForRegEx:regEx data:self];
}
#pragma mark - 验证密码
-(BOOL)verifyForPassword
{
    NSString *regEx = @"^(?![a-zA-Z]+$)(?!\\d+$)(?![\\W_]+$)\\S{8,16}$";
    return [self baseCheckForRegEx:regEx data:self];
}

#pragma mark - 验证电话号
-(BOOL)verifyForPhoneNo
{
    NSString *regEx = @"^(\\d{3,4}-)\\d{7,8}$";
    return [self baseCheckForRegEx:regEx data:self];
}

#pragma mark - 身份证号验证
- (BOOL) verifyForIdCard
{
    //   也可以用这个  @"^(\\d{14}|\\d{17})(\\d|[xX])$"
    NSString *regEx = @"(^[0-9]{15}$)|([0-9]{17}([0-9]|X)$)";
    return [self baseCheckForRegEx:regEx data:self];
}

#pragma mark - 由数字和26个英文字母组成的字符串
- (BOOL) verifyForNumberAndCase
{
    NSString *regEx = @"^[A-Za-z0-9]+$";
    return [self baseCheckForRegEx:regEx data:self];
}

#pragma mark - 小写字母
-(BOOL)verifyForLowerCase
{
    NSString *regEx = @"^[a-z]+$";
    return [self baseCheckForRegEx:regEx data:self];
}

#pragma mark - 大写字母
-(BOOL)verifyForUpperCase
{
    NSString *regEx = @"^[A-Z]+$";
    return [self baseCheckForRegEx:regEx data:self];
}
#pragma mark - 26位英文字母
-(BOOL)verifyForLowerAndUpperCase
{
    NSString *regEx = @"^[A-Za-z]+$";
    return [self baseCheckForRegEx:regEx data:self];
}

#pragma mark - 特殊字符
- (BOOL) verifyForSpecialChar
{
    NSString *regEx = @"[^%&',;=?$\x22]+";
    return [self baseCheckForRegEx:regEx data:self];
}

#pragma mark - 只能输入数字
- (BOOL) verifyForNumber
{
    NSString *regEx = @"^[0-9]*$";
    return [self baseCheckForRegEx:regEx data:self];
}

#pragma mark - 校验只能输入n位的数字
- (BOOL) verifyForNumberWithLength:(NSString *)length
{
    NSString *regEx = [NSString stringWithFormat:@"^\\d{%@}$", length];
    return [self baseCheckForRegEx:regEx data:self];
}

#pragma mark - 私有方法
/**
 *  基本的验证方法
 *
 *  @param regEx 校验格式
 *  @param data  要校验的数据
 *
 *  @return YES:成功 NO:失败
 */
-(BOOL)baseCheckForRegEx:(NSString *)regEx data:(NSString *)data
{
    
    NSPredicate *card = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regEx];
    if (([card evaluateWithObject:data])) {
        return YES;
    }
    return NO;
}

+ (NSString *)returnTheNewDeviceOfUUID{
    NSString *str = [[UIDevice currentDevice].identifierForVendor UUIDString];
    NSLog(@"该设备的设备号 %@",str);
    NSMutableString *tempStr = [NSMutableString stringWithFormat:@"%@",str];
    [tempStr replaceOccurrencesOfString:@"-" withString:@"_" options:NSLiteralSearch range:NSMakeRange(0, [tempStr length])];
    return tempStr;
    
}


+ (BOOL)isStringNull:(NSString *)text
{
    if ([text isKindOfClass:[NSNull class]] || !text || text == nil || [text isEqualToString:@"(null)"] || [text isEqualToString:@"<null>"] || [text isEqualToString:@"<nil>"] || [text isEqualToString:@""] || [text length] == 0)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}


- (NSString *)md5:(NSString *)str
{
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (unsigned)strlen(cStr), result); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
    
}
+ (BOOL)isNullToDictionary:(NSDictionary *)dict
{
    
    if (dict != nil && ![dict isKindOfClass:[NSNull class]] && dict.count != 0){
        
        return NO;
        
    }else{
        
        return YES;
    }
}

+ (BOOL)isNullToObject:(NSObject *)object{
    if (object == nil || [object isEqual:[NSNull class]]) {
        return YES;
    }else {
        return NO;
    }
}

+ (NSString*)MosaicImageUrlWithPartUrlString:(NSString *)string{
    if (string.length >0) {
        BOOL isBeginHttp = [string hasPrefix:@"http://"];
        if (isBeginHttp) {
            return string;
        }
        else{
            NSString *urlStr = [NSString stringWithFormat:@"http://admin.cspxt.net%@",string];
            NSLog(@"urlStr,%@",urlStr);
            return urlStr;
        }
    }
    return [NSString new];
}

//将汉字转为拼音 是否支持全拼可选
+ (NSString *)transformToPinyin:(NSString *)aString isQuanPin:(BOOL)quanPin
{
    //转成了可变字符串
    NSMutableString *str = [NSMutableString stringWithString:aString];
    CFStringTransform((CFMutableStringRef)str, NULL, kCFStringTransformMandarinLatin,NO);
    
    //再转换为不带声调的拼音
    CFStringTransform((CFMutableStringRef)str, NULL, kCFStringTransformStripDiacritics,NO);
    NSArray *pinyinArray = [str componentsSeparatedByString:@" "];
    NSMutableString *allString = [NSMutableString new];
    
    if (quanPin)
    {
        int count = 0;
        for (int  i = 0; i < pinyinArray.count; i++)
        {
            for(int i = 0; i < pinyinArray.count;i++)
            {
                if (i == count) {
                    [allString appendString:@"#"];
                    //区分第几个字母
                }
                [allString appendFormat:@"%@",pinyinArray[i]];
            }
            [allString appendString:@","];
            count ++;
        }
    }
    
    NSMutableString *initialStr = [NSMutableString new];
    //拼音首字母
    for (NSString *s in pinyinArray)
    {
        if (s.length > 0)
        {
            [initialStr appendString:[s substringToIndex:1]];
        }
    }
    [allString appendFormat:@"#%@",initialStr];
    [allString appendFormat:@",#%@",aString];
    return allString;
}

+ (NSMutableAttributedString *)loadHTMLAttributedTextOnLabel:(NSString *)string andFont:(CGFloat )size{
    NSString *newHtmlString= [NSString stringWithFormat:@"<head><style>img{width:%f !important;height:auto}</style></head>%@",SCREENـWIDTH,string];
    NSMutableAttributedString *attributed = [[NSMutableAttributedString alloc] initWithData:[newHtmlString dataUsingEncoding:NSUnicodeStringEncoding] options:@{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType, NSCharacterEncodingDocumentAttribute :@(NSUTF8StringEncoding)} documentAttributes:nil error:nil];
    [attributed addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:size] range: NSMakeRange(0, attributed.length)];
    return attributed;
}


- (NSString *)htmlEntityDecode:(NSString *)string
{
    string = [string stringByReplacingOccurrencesOfString:@"&quot;" withString:@"\""];
    string = [string stringByReplacingOccurrencesOfString:@"&apos;" withString:@"'"];
    string = [string stringByReplacingOccurrencesOfString:@"&lt;" withString:@"<"];
    string = [string stringByReplacingOccurrencesOfString:@"&gt;" withString:@">"];
    string = [string stringByReplacingOccurrencesOfString:@"&amp;" withString:@"&"]; // Do this last so that, e.g. @"&amp;lt;" goes to @"&lt;" not @"<"
    
    return string;
}

//去除标签的方法
-(NSString *)filterHTML:(NSString *)html
{
    NSScanner * scanner = [NSScanner scannerWithString:html];
    NSString * text = nil;
    while([scanner isAtEnd]==NO)
    {
        [scanner scanUpToString:@"<" intoString:nil];
        [scanner scanUpToString:@">" intoString:&text];
        html = [html stringByReplacingOccurrencesOfString:[NSString stringWithFormat:@"%@>",text] withString:@""];
        //去除空格
        html = [html stringByReplacingOccurrencesOfString:@" " withString:@""];
    }
    return html;
}
//提取image 字符串
+ (NSMutableArray*)AnalysisHtml:(NSString *)html{
    NSMutableArray *htmlarr =[[NSMutableArray alloc]init];
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"<img\\s[^>]*/>" options:NSRegularExpressionAllowCommentsAndWhitespace error:nil];
    NSArray *result = [regex matchesInString:html options:NSMatchingReportCompletion range:NSMakeRange(0, html.length)];
    for (NSTextCheckingResult *item in result) {
        NSString *imgHtml = [html substringWithRange:[item rangeAtIndex:0]];
        NSArray *tmpArray = nil;
        if ([imgHtml rangeOfString:@"src=\""].location != NSNotFound) {
            tmpArray = [imgHtml componentsSeparatedByString:@"src=\""];
        } else if ([imgHtml rangeOfString:@"src="].location != NSNotFound) {
            tmpArray = [imgHtml componentsSeparatedByString:@"src="];
        }
        if (tmpArray.count >= 2) {
            NSString *src = tmpArray[1];
            NSUInteger loc = [src rangeOfString:@"\""].location;
            if (loc != NSNotFound) {
                src = [src substringToIndex:loc];
//                NSLog(@"正确解析出来的SRC为：%@", src);
                if ([src hasPrefix:@"http"]) {
                    [htmlarr addObject:src];
                } else {
                    [htmlarr addObject:NSStringFormat(@"http://zhibo.qudong.com%@",src)];
                }
            }
        }
    }
    return htmlarr;
}
+ (NSArray *)filterTheImgUrlArrFromfahterHtml:(NSString *)html{
    
    /**  <(img|IMG)[^\<\>]*>找img标签的正则  **/
    NSString *ss = @"<(img|IMG)[^\\<\\>]*>";//img标签的正则表达式
    NSRegularExpression *pre = [[NSRegularExpression alloc] initWithPattern:ss options:0 error:nil];
    NSArray *arr = [pre matchesInString:html options:NSMatchingReportProgress range:NSMakeRange(0,html.length)];//这个方法匹配正则，找到符合的结果返回数组集合，返回的类型是NSTextCheckingResult下面会提到。
    NSMutableArray *mutArr = [NSMutableArray arrayWithCapacity:1];
    NSLog(@"---%@",arr);
    for (NSTextCheckingResult *match in arr) {
        NSRange matchRange = [match range];//返回的是每个imgb标签的位置
        NSString *imgDivStr = [html substringWithRange:matchRange];//根据位置找对应img标签
        imgDivStr = [imgDivStr stringByReplacingOccurrencesOfString:@" " withString:@""];//此处我为了找出图片URL过滤掉空格
        NSString *imgUrl = [[imgDivStr componentsSeparatedByString:@"src=\""] lastObject];
        imgUrl = [[imgUrl componentsSeparatedByString:@"\""] firstObject];
        if ([imgUrl hasPrefix:@"http"]) {
            [mutArr addObject:imgUrl];
        } else {
            [mutArr addObject:NSStringFormat(@"http://zhibo.qudong.com%@",imgUrl)];
        }
        
    }
    NSLog(@"%@",mutArr);
    return [NSArray arrayWithArray:mutArr];
}


//图片转base64  转 .jpg 格式压缩性强
+ (NSString*)encodeToBase64String:(UIImage *)image {
    
    return [UIImageJPEGRepresentation(image, 0.6f) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
//    return [UIImagePNGRepresentation(image) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
}

//base64 转图片
+ (UIImage *)decodeBase64ToImage:(NSString*)strEncodeData {
    NSData *data = [[NSData alloc]initWithBase64EncodedString:strEncodeData options:NSDataBase64DecodingIgnoreUnknownCharacters];
    return [UIImage imageWithData:data];
}

+ (NSString *)changeToString:(NSString *)content{
    NSRegularExpression *regularExpretion=[NSRegularExpression regularExpressionWithPattern:@"<[^>]*>|\n"
                                                                                    options:0
                                                                                      error:nil];
    content = [regularExpretion stringByReplacingMatchesInString:content options:NSMatchingReportProgress range:NSMakeRange(0, content.length) withTemplate:@"-"];         //  替换所有html和换行匹配元素为"-"
    regularExpretion = [NSRegularExpression regularExpressionWithPattern:@"-{1,}" options:0 error:nil] ;
    content = [regularExpretion stringByReplacingMatchesInString:content options:NSMatchingReportProgress range:NSMakeRange(0, content.length) withTemplate:@"-"];          //  把多个"-"匹配为一个"-"
    //  根据"-"分割到数组
    NSArray *arr=[NSArray array];
    content = [NSString stringWithString:content];
    arr =  [content componentsSeparatedByString:@"-"];
    NSMutableArray *marr=[NSMutableArray arrayWithArray:arr];
    [marr removeObject:@""];
    NSMutableString *string = [[NSMutableString alloc] init];
    for (int i = 0; i < arr.count; i++) {
        [string appendString:[NSString stringWithFormat:@"%@",arr[i]]];
    }
    return  string;
}

//判断url是否以http开头或者以.com结

- (NSString *)subStringFrom:(NSString *)startString to:(NSString *)endString{
    NSRange startRange = [self rangeOfString:startString];
    NSRange endRange = [self rangeOfString:endString];
    NSRange range = NSMakeRange(startRange.location + startRange.length, endRange.location - startRange.location - startRange.length);
    return  [self substringWithRange:range];
}


//时间戳变为格式时间
+ (NSString *)ConvertStrToTime:(NSString *)timeStr withStatus:(NSInteger)status{
    
    long long time=[timeStr longLongValue];
    //    如果服务器返回的是13位字符串，需要除以1000，否则显示不正确(13位其实代表的是毫秒，需要除以1000)
    //    long long time=[timeStr longLongValue] / 1000;
    
    NSDate *date = [[NSDate alloc]initWithTimeIntervalSince1970:time];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    if (status == 0) {
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    } else {
        [formatter setDateFormat:@"yyyy-MM-dd"];
    }
    NSString*timeString=[formatter stringFromDate:date];
    
    return timeString;
    
}
//将时间转换为时间戳
+ (NSString *)dateToTimestamp:(NSDate *)date {
    
    NSTimeInterval stamp = [date timeIntervalSince1970];
    
    return [NSString stringWithFormat:@"%.0f", stamp];
}

//将时间字符串转换为时间
+ (NSDate *)timeStrToDate:(NSString *)timeStr {
    
    NSDate *date = [[self dateFormatWith:@"YYYY-MM-dd"] dateFromString:timeStr];
    
    //解决8小时时差问题
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: date];
    NSDate *localeDate = [date dateByAddingTimeInterval: interval];
    
    return localeDate;
}

//获取日期格式化器
+(NSDateFormatter *)dateFormatWith:(NSString *)formatStr {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:formatStr];//@"YYYY-MM-dd HH:mm:ss"
    //设置时区
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [formatter setTimeZone:timeZone];
    
    return formatter;
}
@end

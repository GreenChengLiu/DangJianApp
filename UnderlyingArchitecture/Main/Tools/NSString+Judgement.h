//
//  NSString+Judgement.h
//  PandaNaughty
//
//  Created by damai on 2018/2/24.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Judgement)

/**
 是否存在表情符

 @return YES:有,NO:没有
 */
-(BOOL) hasEmoji;
/**
 *  邮箱验证
 *
 *  @return YES:正确  NO:失败
 */
- (BOOL) verifyForEmail;

/**
 *  手机号验证
 *
 *  @return YES:正确  NO:失败
 */
- (BOOL)verifyForMobilePhoneNo;

/**
 *  电话号验证
 *
 *  @return 结果
 */
- (BOOL)verifyForPhoneNo;

/**
 验证密码
 
 @return  YES:正确  NO:失败
 */
- (BOOL)verifyForPassword;

/**
 *  身份证号验证(15位 或 18位)
 *
 *  @return YES:正确  NO:失败
 */
-(BOOL)verifyForIdCard;


/**
 *  由数字和26个英文字母组成的字符串
 *
 *  @return 结果
 */
- (BOOL) verifyForNumberAndCase;


/**
 *  校验只能输入26位小写字母
 *  @return 结果
 */
- (BOOL) verifyForLowerCase;

/**
 *  校验只能输入26位大写字母
 *
 *  @return 结果
 */
- (BOOL) verifyForUpperCase;

/**
 *  校验只能输入由26个小写和大写英文字母组成的字符串
 *
 *  @return 结果
 */
- (BOOL) verifyForLowerAndUpperCase;

/**
 *  是否含有特殊字符(%&’,;=?$\等)
 *  @return 结果
 */
- (BOOL) verifyForSpecialChar;


/**
 *  校验只能输入数字
 *
 *  @return 结果
 */
- (BOOL) verifyForNumber;

/**
 *  校验只能输入n位的数字
 *
 *  @return 结果
 */
- (BOOL) verifyForNumberWithLength:(NSString *)length;

/**
 返回设备号

 @return 设备号
 */
+ (NSString *)returnTheNewDeviceOfUUID;


/**
 判断字符串是否为空
 */
+ (BOOL)isStringNull:(NSString *)text;

/**
 MD5加密
 @return 返回加密文件
 */
- (NSString *)md5:(NSString *)str;

/**
 字典判空
 */
+ (BOOL)isNullToDictionary:(NSDictionary *)dict;

+ (BOOL)isNullToObject:(NSObject *)object;
/**
 图片拼接

 @param string URL
 @return URL
 */
+ (NSString*)MosaicImageUrlWithPartUrlString:(NSString *)string;
/**
 将汉字转为拼音 是否支持全拼可选
 */
+ (NSString *)transformToPinyin:(NSString *)aString isQuanPin:(BOOL)quanPin;

/**
 加载html 文字

 @param string html 文字
 @return 调整后的 attributedString
 */
+ (NSMutableAttributedString *)loadHTMLAttributedTextOnLabel:(NSString *)string  andFont:(CGFloat )size;


/**
 提取标签中的img链接
 */
+ (NSMutableArray*)AnalysisHtml:(NSString *)html;
/**
 提取标签中的img链接
 */
+ (NSArray *)filterTheImgUrlArrFromfahterHtml:(NSString *)html;
/**
 图片转base64  加密

 @param image 图片
 @return 返回加密后的文件
 */
+ (NSString*)encodeToBase64String:(UIImage*)image;
/**
 base64 数据转图片

 @param strEncodeData base64
 @return 图片
 */
+ (UIImage *)decodeBase64ToImage:(NSString*)strEncodeData;

/**
 正则提取文本
 */
+ (NSString *)changeToString:(NSString *)content;

/**
 截取字符串

 @param startString 开始
 @param endString 结束
 @return 截取后
 */
- (NSString *)subStringFrom:(NSString *)startString to:(NSString *)endString;

/**
 时间戳返回时间

 @param timeStr 时间戳
 @return 返回时间
 */
+ (NSString *)ConvertStrToTime:(NSString *)timeStr withStatus:(NSInteger)status;
/**
 日期转时间戳
 */
+ (NSString *)dateToTimestamp:(NSDate *)date;
/**
 将时间字符串转换为时间
 */
+ (NSDate *)timeStrToDate:(NSString *)timeStr ;
@end

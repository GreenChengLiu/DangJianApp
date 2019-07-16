//
//  Header.h
//  lian
//  Created by damai on 2017/6/2.
//  Copyright © 2017年 damai. All rights reserved.

#ifndef Header_h
#define Header_h
#import "UIColor+Hex.h"

//拼接字符串
#define NSStringFormat(format,...) [NSString stringWithFormat:format,##__VA_ARGS__]
//propery 属性快速声明
#define PropertyString(s)@property(nonatomic,copy)NSString * s            //字符串
#define PropertyNSInteger(s)@property(nonatomic, assign)NSInteger s           //ingeger
#define PropertyFloat(s)@property(nonatomic, assign)float s
#define PropertyLongLong(s)@property(nonatomic, assign)long long s
#define PropertyNSDictionary(s)@property(nonatomic, strong)NSDictionary * s     //字典
#define PropertyNSMutableDictionary(s)@property(nonatomic, strong)NSMutableDictionary *s;//可变字典
#define PropertyNSArray(s)@property(nonatomic, strong)NSArray *s              //数组
#define PropertyNSMutableArray(s)@property(nonatomic, strong)NSMutableArray *s //可变数组
#define PropertyUICollectionView(s) @property(nonatomic, strong)UICollectionView *s//collectionView

//UI图,
#define PropertyUIButton(b)@property(nonatomic, strong)UIButton *b

//字体
#define BOLDSYSTEMFONT(FONTSIZE) [UIFont boldSystemFontOfSize:FONTSIZE]
#define SYSTEMFONT(FONTSIZE) [UIFont systemFontOfSize:FONTSIZE]
#define FONT(NAME, FONTSIZE) [UIFont fontWithName:(NAME) size:(FONTSIZE)]

//获取系统对象
#define kApplication [UIApplication sharedApplication]

#define kAppWindow [UIApplication sharedApplication].delegate.window
#define kAppDelegate [AppDelegate sharedAppDelegate]
#define KRootViewController [UIAplication sharedApplication].delegate.window.rootViewController
//NSUserDefaults实例化
#define kUserDefaults [NSUserDefaults standardUserDefaults]
#define KNotificationCenter [NSNotificationCenter defaultCenter]
/**对象存储*/
#define SET_OBJECT_USERDEFAULTS(object,key) \
({                                                                                                                                             \
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];                                                                          \
    [defaults setObject:object forKey:key];                                                                                                    \
    [defaults synchronize];                                                                                                                    \
})

#define GET_OBJECT_USERDEFAULTS(key)  [[NSUserDefaults standardUserDefaults] objectForKey:key]
/* 字号存储 */
#define SET_FLOAT_USERDEFAULTS(float,key)\
({\
     NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];\
     [defaults setFloat:float forKey:key];\
     [defaults synchronize];\
})
#define GET_FLOAT_USERDEFAULTS(key) [[NSUserDefaults standardUserDefaults] floatForKey:key]

/* 布尔值存储 */
#define SET_BOOL_USERDEFAULTS(bool,key)\
({\
NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];\
[defaults setBool:bool forKey:key];\
[defaults synchronize];\
})
#define GET_BOOL_USERDEFAULTS(key) [[NSUserDefaults standardUserDefaults] boolForKey:key]

/* 整形存储 */
#define SET_Integer_USERDEFAULTS(integer,key)\
({\
NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];\
[defaults setInteger:integer forKey:key];\
[defaults synchronize];\
})

#define GET_Integer_USERDEFAULTS(key) [[NSUserDefaults standardUserDefaults] integerForKey:key]

//获取屏幕宽高
//#define screenWidth [UIScreen mainScreen].bounds.size.width
//#define screenHight [UIScreen mainScreen].bounds.size.height

// 颜色 每个项目不一样，自己定义或者干掉
#define Color_NAV [UIColor colorWithHex:0xf9f9f9]
//灰色从深到浅
#define Color_22Gray [UIColor colorWithHex:0x222222]//51,51,51
#define Color_33Gray [UIColor colorWithHex:0x333333]//51,51,51
#define Color_55Gray [UIColor colorWithHex:0x555555]//51,51,51
#define Color_77Gray [UIColor colorWithHex:0x777777]//51,51,51
#define Color_66Gray [UIColor colorWithHex:0x666666]//102,102,102
#define Color_88Gray [UIColor colorWithHex:0x888888]//153,153,153
#define Color_99Gray [UIColor colorWithHex:0x999999]//153,153,153
#define Color_BEGray [UIColor colorWithHex:0xBEBEBE]//190,190,190
#define Color_MainGray [UIColor colorWithHex:0xEEEEEE]//238,238,238
#define Color_F1Gray [UIColor colorWithHex:0xF1F1F1]//241,241,241
#define Color_White [UIColor colorWithHex:0xFFFFFF]//241,241,241
#define Color_DDGray [UIColor colorWithHex:0xDDDDDD]
#define Color_mainBlue [UIColor colorWithHex:0x28AAEE]
#define Color_BlueText [UIColor colorWithHex:0x00B9FF]
#define Color_GreenText [UIColor colorWithHex:0x44C341]


/**
 圆角和加边框

 @param View 当前视图
 @param Radius 圆角
 @param Width 宽度
 @param Color 颜色
 @return 返回
 */
#define ViewBorderRadius(View,Radius,Width,Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

#define ViewRadius(View,Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\

/*
 [self.listenView.layer setShadowOpacity:];
 [self.listenView.layer setShadowColor:<#(CGColorRef _Nullable)#>];
 [self.listenView.layer setShadowRadius:<#(CGFloat)#>];
 [self.listenView.layer setShadowOffset:<#(CGSize)#>];
 */
#define ViewBorderShadow(View,Opacity,Radius,size,Color)\
\
[View.layer setShadowOpacity:(Opacity)];\
[View.layer setShadowRadius:(Radius)];\
[View.layer setShadowOffset:(size)];\
[View.layer setShadowColor:[Color CGColor].CGColor]

/**
 快速创建颜色
 */
#define RGBAColor(r,g,b,a) [UIColor colorWithRed:(r/255.0) green:(g/255.0) blue:(b/255.0) alpha:a]
//打印当前方法名

#define ITTDPRINTMETHODNAME()ITTDPRINT(@"%s",__PRETTY_FUNCTION__)
//定义UIImage对象 (两种方法)
#define IMAGE(A) [UIImage imageWithContentsOfFile:[NSBundle mainBundle] pathForResource:A ofType:nil]
#define ImageNamed(__pointer) [UIImage imageNamed:__pointer] 
#define ImageURL(name) [NSURL URLWithString:name]
#define URLSTR(name) [NSURL URLWithString:name];

//宽高宏定义
#define SCREENـWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

//Navigation高度
#define STATUS_BAR_FRAME [UIApplication sharedApplication].statusBarFrame.size.height
#define NavigationViewHeightContration (STATUS_BAR_FRAME > 20.0 ? 88 : 64)
#define NavigationHeightContration (SCREEN_HEIGHT == 812.0 ? 24 : 0)
#define TabBarHeight (STATUS_BAR_FRAME > 20.0 ? 83 : 49)
#define NEGATIVE (STATUS_BAR_FRAME > 20.0 ? -44 : -20)

//G-C-D
#define BACK(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0),block)
#define MAIN(block) dispatch_async(dispatch_get_main_queue(),block)
//nib
#define LNib(nibName) [UINib nibWithNibName:nibName bundle:nil]

#define KHistorySearchPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"PYSearchhistories.plist"]
/* 线程 */
#define dispatch_sync_main_safe(block)\
if ([NSThread isMainThread]) {\
block();\
} else {\
dispatch_sync(dispatch_get_main_queue(), block);\
}

#define dispatch_async_main_safe(block)\
if ([NSThread isMainThread]) {\
block();\
} else {\
dispatch_async(dispatch_get_main_queue(), block);\
}

#define IOS8            ([[[UIDevice currentDevice] systemVersion] doubleValue] >= 8.0)

#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)


#define Chatroom_Message_Font [UIFont boldSystemFontOfSize:14] // 聊天室聊天文字字体
#define UISreenWidthScale   SCREENWIDTH / 320


// 判断是否是ipad
#define isPad ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
// 判断iPhone4系列
#define kiPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
// 判断iPhone5系列
#define kiPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
// 判断iPhone6系列
#define IS_IPHONE_6_ADD ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
//判断iphone6+系列
#define IS_IPHONE_PLUS ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
// 判断iPhoneX
#define IS_IPHONE_X ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
// 判断iPHoneXr
#define IS_IPHONE_Xr ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
// 判断iPhoneXs
#define IS_IPHONE_Xs ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
// 判断iPhoneXs Max
#define IS_IPHONE_Xs_Max ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) && !isPad : NO)
#endif /* Header_h */

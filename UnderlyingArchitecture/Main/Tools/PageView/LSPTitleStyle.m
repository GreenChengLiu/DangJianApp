//
//  XTitleStyle.m
//  PageViewDemo
//  https://github.com/MrLSPBoy/PageViewController
//  Created by Object on 17/7/11.
//  Copyright © 2017年 Object. All rights reserved.
//

#import "LSPTitleStyle.h"

@implementation LSPTitleStyle

- (instancetype)init{
    if (self = [super init]) {
        
        self.isTitleViewScrollEnable = YES;
        self.isContentViewScrollEnable = YES;
//        self.normalColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:1.0];
//        self.selectedColor = [UIColor orangeColor];
        self.normalColor = [UIColor colorWithHex:0x333333];
        self.selectedColor = [UIColor colorWithHex:0x29A9FF];
        self.font = [UIFont systemFontOfSize:14.0];
        self.titleMargin = 0.0;
        self.isShowBottomLine = YES;
//        self.bottomLineColor = [UIColor orangeColor];
        self.bottomLineColor = [UIColor colorWithHex:0x29A9FF];
        self.bottomLineH = 2.0;
        self.isNeedScale = NO;
        self.scaleRange = 1.2;
        self.isShowCover = NO;
        self.coverBgColor = [UIColor yellowColor];
        self.coverMargin = 0.0;
        self.coverH = 25.0;
        self.coverRadius = 5;
        self.bottomLineW = 30;
    }
    return self;
}

@end

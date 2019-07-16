//
//  XContentView.h
//  PageViewDemo
//  https://github.com/MrLSPBoy/PageViewController
//  Created by Object on 17/7/11.
//  Copyright © 2017年 Object. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LPCTitleStyle.h"
@class LPCContentView;

@protocol LPCContentViewDelegate <NSObject>

- (void)contentViewWith:(LPCContentView *)contentView progress:(CGFloat)progress sourceIndex:(CGFloat)sourceIndex targetIndex:(CGFloat)targetIndex;

- (void)contentViewEndScrollWithContentView:(LPCContentView *)contentView;

- (void)scrollViewDidEndDeceleratingWithIndex:(NSInteger)index;

@end

@interface LPCContentView : UIView

/**
 创建ContentView

 @param frame ContentView的Frame
 @param childVcs 所有子控制器数组
 @param parentViewController 父控制器
 @param style 标题样式
 @return ContentView
 */
- (LPCContentView *)initWithFrame:(CGRect)frame childVcs:(NSArray <UIViewController *>*)childVcs parentViewController:(UIViewController *)parentViewController style:(LPCTitleStyle *)style;

/**
 点击标题之后通过代理 滚动视图

 @param currentIndex 滚动到第几个
 */
- (void)setCurrentIndex:(NSInteger)currentIndex;


@property(nonatomic, weak) id<LPCContentViewDelegate> delegate;

@end

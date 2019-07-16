//
//  XTitleView.h
//  PageViewDemo
//  https://github.com/MrLSPBoy/PageViewController
//  Created by Object on 17/7/11.
//  Copyright © 2017年 Object. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LPCTitleStyle.h"
@class LPCTitleView;
@protocol LPCTitleViewDelegate <NSObject>

- (void)titleViewWithTitleView:(LPCTitleView *)titleView selectedIndex:(NSInteger)selectedIndex;

@end


@interface LPCTitleView : UIView

- (LPCTitleView *)initWithFrame:(CGRect)frame titles:(NSArray <NSString *>*)titles style:(LPCTitleStyle *)style;

- (void)setTitleWithProgress:(CGFloat)progress sourceIndex:(NSInteger)sourceIndex targetIndex:(NSInteger)targetIndex;

- (void)contentViewDidEndScroll;

- (void)setSelectTitleIndex:(NSInteger)index;

@property(nonatomic, weak) id<LPCTitleViewDelegate> delegate;


@end

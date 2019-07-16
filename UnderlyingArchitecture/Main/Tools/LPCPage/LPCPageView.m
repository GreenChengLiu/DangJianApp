//
//  XPageView.m
//  PageViewDemo
//  https://github.com/MrLSPBoy/PageViewController
//  Created by Object on 17/7/11.
//  Copyright © 2017年 Object. All rights reserved.
//

#import "LPCPageView.h"

@interface LPCPageView ()<LPCTitleViewDelegate,LPCContentViewDelegate>

/**
 标题数组
 */
@property(nonatomic, strong) NSArray <NSString *>*titles;
/**
 标题类型
 */
@property(nonatomic, strong) LPCTitleStyle *style;
/**
 子控制器数组
 */
@property(nonatomic, strong) NSArray <UIViewController *>*childVcs;
/**
 父控制器
 */
@property(nonatomic, weak) UIViewController *parentVc;
/**
 标题视图
 */
@property(nonatomic, strong) LPCTitleView *titleView;
/**
 内容视图
 */
@property(nonatomic, strong) LPCContentView *contentView;

@end

@implementation LPCPageView

- (LPCPageView *)initWithFrame:(CGRect)frame titles:(NSArray<NSString *> *)titles style:(LPCTitleStyle *)style childVcs:(NSArray<UIViewController *> *)childVcs parentVc:(UIViewController *)parentVc{
    
    if (self = [super initWithFrame:frame]) {
        
        NSAssert(titles.count == childVcs.count, @"标题&控制器个数不同,请检测!!!");
        
        self.style = style ? style : [[LPCTitleStyle alloc] init];
        self.titles = titles;
        self.childVcs = childVcs;
        self.parentVc = parentVc;
        
        parentVc.automaticallyAdjustsScrollViewInsets = NO;
        
        [self setupUI];
    }
    return self;
}

- (void)setupUI{
    
    CGFloat titleH = 44;
    CGRect titleFrame = CGRectMake(0, 0, self.frame.size.width, titleH);
    self.titleView = [[LPCTitleView alloc] initWithFrame:titleFrame titles:self.titles style:self.style];
    self.titleView.delegate = self;
    [self addSubview:self.titleView];
    
    
    CGRect contentFrame = CGRectMake(0, titleH, self.frame.size.width, self.frame.size.height - titleH);
    self.contentView = [[LPCContentView alloc] initWithFrame:contentFrame childVcs:self.childVcs parentViewController:self.parentVc style:self.style];
    self.contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.contentView.delegate = self;
    [self addSubview:self.contentView];
    
}

#pragma mark - XTitleViewDelegate
- (void)titleViewWithTitleView:(LPCTitleView *)titleView selectedIndex:(NSInteger)selectedIndex{
    [self.contentView setCurrentIndex:selectedIndex];
    
    if ([self.delegate respondsToSelector:@selector(pageViewScollEndView:WithIndex:)]) {
        [self.delegate pageViewScollEndView:self WithIndex:selectedIndex];
    }
}

#pragma mark - XContentViewDelegate
- (void)contentViewWith:(LPCContentView *)contentView progress:(CGFloat)progress sourceIndex:(CGFloat)sourceIndex targetIndex:(CGFloat)targetIndex{
    [self.titleView setTitleWithProgress:progress sourceIndex:sourceIndex targetIndex:targetIndex];
}
- (void)contentViewEndScrollWithContentView:(LPCContentView *)contentView{
    [self.titleView contentViewDidEndScroll];
}
- (void)scrollViewDidEndDeceleratingWithIndex:(NSInteger)index
{
    if ([self.delegate respondsToSelector:@selector(pageViewScollEndView:WithIndex:)]) {
        [self.delegate pageViewScollEndView:self WithIndex:index];
    }
}

- (void)setToIndex:(NSInteger)index
{
    if (index < self.titles.count)
    {
        [self.titleView setSelectTitleIndex:index];
    }
    
}

@end

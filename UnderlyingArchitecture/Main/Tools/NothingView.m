//
//  NothingView.m
//  com.quDongChina
//
//  Created by mac on 2019/6/14.
//  Copyright © 2019 mac. All rights reserved.
//

#import "NothingView.h"

@implementation NothingView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self initAddChildView];
    }
    return self;
}
- (void)initAddChildView{
    UIImageView *nothing = [[UIImageView alloc] init];
    nothing.image = ImageNamed(@"nothing");
    [self addSubview:nothing];
    [nothing mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(self.mas_top).with.offset(20);
        make.width.height.offset(64);
    }];
    
    UILabel *label = [[UILabel alloc] init];
    [self addSubview:label];
    label.text = @"暂无评论";
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(nothing.mas_bottom).with.offset(10);
        make.height.offset(20);
        make.centerX.equalTo(nothing.mas_centerX);
    }];
    label.font = SYSTEMFONT(15);
    label.textColor = [UIColor colorWithHex:0x555555];
}

@end

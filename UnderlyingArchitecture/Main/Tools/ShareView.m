//
//  ShareView.m
//  com.quDongChina
//
//  Created by mac on 2019/6/5.
//  Copyright © 2019 mac. All rights reserved.
//

#import "ShareView.h"

@implementation ShareView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

*/

- (void)drawRect:(CGRect)rect {
    // Drawing code
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self initAddChildView];
    }
    return self;
}

- (void)initAddChildView{
    UIImageView *wei_collection= [[UIImageView alloc] init];
    [self addSubview:wei_collection];
    wei_collection.userInteractionEnabled = YES;
    wei_collection.image = ImageNamed(@"share-wei-collection");
    [wei_collection mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).with.offset(10);
        make.centerX.equalTo(self.mas_centerX);
        make.width.offset(58);
        make.height.offset(58);
    }];
    UITapGestureRecognizer *collTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(weiCollection:)];
    [wei_collection addGestureRecognizer:collTap];
    
    UILabel *collection = [[UILabel alloc] init];
    [self addSubview:collection];
    collection.text = @"微信收藏";
    collection.font = SYSTEMFONT(13);
    collection.textColor = [UIColor colorWithHex:0x222222];
    [collection mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.top.equalTo(wei_collection.mas_bottom).with.offset(8);
    }];
    
    UIImageView *wei_friends = [[UIImageView alloc] init];
    [self addSubview:wei_friends];
    wei_friends.userInteractionEnabled = YES;
    wei_friends.image = ImageNamed(@"share-wei-friends");
    [wei_friends mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).with.offset(10);
        make.left.equalTo(self.mas_left).with.offset(50);
        make.width.offset(58);
        make.height.offset(58);
    }];
    
    UITapGestureRecognizer *friendsTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(weiFriends:)];
    [wei_friends addGestureRecognizer:friendsTap];
    
    UILabel *friends = [[UILabel alloc] init];
    [self addSubview:friends];
    friends.text = @"微信朋友";
    friends.font = SYSTEMFONT(13);
    friends.textColor = [UIColor colorWithHex:0x222222];
    [friends mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(wei_friends.mas_centerX);
        make.top.equalTo(wei_friends.mas_bottom).with.offset(8);
    }];
    
    
    UIImageView *wei_circle = [[UIImageView alloc] init];
    [self addSubview:wei_circle];
    wei_circle.userInteractionEnabled = YES;
    wei_circle.image = ImageNamed(@"share-wei-circle");
    [wei_circle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).with.offset(10);
        make.right.equalTo(self.mas_right).with.offset(-50);
        make.width.offset(58);
        make.height.offset(58);
    }];
    UITapGestureRecognizer *circleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(weiCircle:)];
    [wei_circle addGestureRecognizer:circleTap];
    
    UILabel *circle = [[UILabel alloc] init];
    [self addSubview:circle];
    circle.text = @"朋友圈";
    circle.font = SYSTEMFONT(13);
    circle.textColor = [UIColor colorWithHex:0x222222];
    [circle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(wei_circle.mas_centerX);
        make.top.equalTo(wei_friends.mas_bottom).with.offset(8);
    }];
    
    UIImageView *qq_friends = [[UIImageView alloc] init];
    [self addSubview:qq_friends];
    qq_friends.userInteractionEnabled = YES;
    qq_friends.image = ImageNamed(@"share-qq-friends");
    [qq_friends mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(wei_friends.mas_bottom).with.offset(28);
        make.left.equalTo(self.mas_left).with.offset(50);
        make.width.offset(58);
        make.height.offset(58);
    }];
    UITapGestureRecognizer *qqFriendsTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(qqFriends:)];
    [qq_friends addGestureRecognizer:qqFriendsTap];
    
    UILabel *qqFriends = [[UILabel alloc] init];
    [self addSubview:qqFriends];
    qqFriends.text = @"QQ朋友";
    qqFriends.font = SYSTEMFONT(13);
    qqFriends.textColor = [UIColor colorWithHex:0x222222];
    [qqFriends mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(qq_friends.mas_centerX);
        make.top.equalTo(qq_friends.mas_bottom).with.offset(8);
    }];
    
    UIImageView *qq_space = [[UIImageView alloc] init];
    [self addSubview:qq_space];
    qq_space.userInteractionEnabled = YES;
    qq_space.image = ImageNamed(@"share-qq-space");
    [qq_space mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(wei_collection.mas_bottom).with.offset(28);
        make.centerX.equalTo(self.mas_centerX);
        make.width.offset(58);
        make.height.offset(58);
    }];
    UITapGestureRecognizer *spaceTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(qqSpace:)];
    [qq_space addGestureRecognizer:spaceTap];
    
    UILabel *space = [[UILabel alloc] init];
    [self addSubview:space];
    space.text = @"QQ空间";
    space.font = SYSTEMFONT(13);
    space.textColor = [UIColor colorWithHex:0x222222];
    [space mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(qq_space.mas_centerX);
        make.top.equalTo(qq_space.mas_bottom).with.offset(8);
    }];
    
    UIButton *button = [[UIButton alloc] init];
    [self addSubview:button];
    [button setTitle:@"取消" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithHex:0x555555] forState:UIControlStateNormal];
    button.titleLabel.font = SYSTEMFONT(14);
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.mas_bottom).with.offset(-30);
        make.width.offset(SCREENـWIDTH);
        make.height.offset(30);
        make.left.equalTo(self.mas_left).with.offset(0);
    }];
    [button addTarget:self action:@selector(dismissOperation:) forControlEvents:UIControlEventTouchUpInside];
}


#pragma mark 图片点击方法
- (void)weiCollection:(UITapGestureRecognizer *)gesture{
    if (self.shareDelegate && [self.shareDelegate respondsToSelector:@selector(shareQQOrWiChatClickWithInteger:)]) {
        [self.shareDelegate shareQQOrWiChatClickWithInteger:2];
    }
}
- (void)weiFriends:(UITapGestureRecognizer *)gesture{
    if (self.shareDelegate && [self.shareDelegate respondsToSelector:@selector(shareQQOrWiChatClickWithInteger:)]) {
        [self.shareDelegate shareQQOrWiChatClickWithInteger:1];
    }
}
- (void)weiCircle:(UITapGestureRecognizer *)gesture{
    if (self.shareDelegate && [self.shareDelegate respondsToSelector:@selector(shareQQOrWiChatClickWithInteger:)]) {
        [self.shareDelegate shareQQOrWiChatClickWithInteger:3];
    }
}
- (void)qqFriends:(UITapGestureRecognizer *)gesture{
    if (self.shareDelegate && [self.shareDelegate respondsToSelector:@selector(shareQQOrWiChatClickWithInteger:)]) {
        [self.shareDelegate shareQQOrWiChatClickWithInteger:4];
    }
}
- (void)qqSpace:(UITapGestureRecognizer *)gesture{
    if (self.shareDelegate && [self.shareDelegate respondsToSelector:@selector(shareQQOrWiChatClickWithInteger:)]) {
        [self.shareDelegate shareQQOrWiChatClickWithInteger:5];
    }
}

- (void)dismissOperation:(UIButton *)sender{
    if (self.shareDelegate && [self.shareDelegate respondsToSelector:@selector(dismissShareView)]) {
        [self.shareDelegate dismissShareView];
    }
}

@end

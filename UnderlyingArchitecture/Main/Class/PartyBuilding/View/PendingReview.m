//
//  PendingReview.m
//  UnderlyingArchitecture
//
//  Created by mac on 2019/7/23.
//  Copyright © 2019 liuPengCheng. All rights reserved.
//

#import "PendingReview.h"

@interface PendingReview ()
@property (nonatomic, strong) UIImageView *yesImg;
@property (nonatomic, strong) UIButton *yesbutton;
@property (nonatomic, strong) UILabel *yeslabel;
@property (nonatomic, strong) UILabel *downLabel;

@property (nonatomic, assign) BOOL finished;
@property (nonatomic, strong) UIView *baseView;
@end

@implementation PendingReview

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
        self.backgroundColor = [[UIColor blackColor]  colorWithAlphaComponent:0.3];
        [self addSubviews];
    }
    return self;
}

- (void)addSubviews{
    self.baseView = [[UIView alloc] init];
    [self addSubview: self.baseView ];
    self.baseView .backgroundColor = [UIColor whiteColor];
    [self.baseView  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.centerY.equalTo(self.mas_centerY);
        make.width.offset(300);
        make.height.offset(250);
    }];
    ViewRadius(self.baseView , 5);
    UIView *topView = [[UIView alloc] init];
    [self.baseView  addSubview:topView];
    
    topView.backgroundColor = [UIColor colorWithHex:0x1773DB];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.baseView .mas_top).with.offset(0);
        make.height.offset(40);
        make.left.equalTo(self.baseView .mas_left).with.offset(0);
        make.right.equalTo(self.baseView .mas_right).with.offset(0);
    }];
    
    self.closeButton = [[UIButton alloc] init];
    [self.closeButton setImage:ImageNamed(@"close") forState:UIControlStateNormal];
    [topView addSubview:self.closeButton];
    [self.closeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(topView.mas_top).with.offset(0);
        make.bottom.equalTo(topView.mas_bottom).with.offset(0);
        make.width.offset(40);
        make.right.equalTo(topView.mas_right).with.offset(0);
    }];
    [self.closeButton addTarget:self action:@selector(closeOperation:) forControlEvents:UIControlEventTouchUpInside];
    
    self.titleLabel = [[UILabel alloc] init];
    [topView addSubview:self.titleLabel];
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.font = SYSTEMFONT(14);
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(topView.mas_top).with.offset(0);
        make.left.equalTo(topView.mas_left).with.offset(42);
        make.right.equalTo(topView.mas_right).with.offset(-42);
        make.bottom.equalTo(topView.mas_bottom).with.offset(0);
    }];
    
    self.textView = [[UITextView alloc] init];
    self.textView.font = SYSTEMFONT(14);
    self.textView.delegate = self;
    [self.baseView  addSubview:self.textView];
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(topView.mas_bottom).with.offset(20);
        make.height.offset(100);
        make.left.equalTo(self.baseView .mas_left).with.offset(20);
        make.right.equalTo(self.baseView .mas_right).with.offset(-20);
    }];
    ViewBorderRadius(self.textView, 8, 1, [UIColor colorWithHex:0xececec]);
    
    UIButton *deterButton = [[UIButton alloc] init];
    [self.baseView  addSubview:deterButton];
    ViewRadius(deterButton, 8);
    deterButton.backgroundColor = [UIColor colorWithHex:0x1773DB];
    [deterButton setTitle:@"同意" forState:UIControlStateNormal];
    [deterButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [deterButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.baseView .mas_bottom).with.offset(-15);
        make.width.offset(100);
        make.height.offset(30);
        make.right.offset(-15);
    }];
    [deterButton addTarget:self action:@selector(agreementOperaton:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *dismissButton = [[UIButton alloc] init];
    [self.baseView  addSubview:dismissButton];
    ViewRadius(dismissButton, 8);
    dismissButton.backgroundColor = [UIColor colorWithHex:0xbe0405];
    [dismissButton setTitle:@"驳回" forState:UIControlStateNormal];
    [dismissButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [dismissButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.baseView .mas_bottom).with.offset(-15);
        make.width.offset(100);
        make.height.offset(30);
        make.left.offset(15);
    }];
    
     [dismissButton addTarget:self action:@selector(dismissOperate:) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.placeHolder = [[UILabel alloc] init];
    self.placeHolder.font = SYSTEMFONT(13);
    self.placeHolder.text = @"请输入意见....";
    self.placeHolder.textColor = [UIColor colorWithHex:0x888888];
    
    [self.baseView  addSubview:self.placeHolder];
    [self.placeHolder mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.textView.mas_top).with.offset(5);
        make.left.equalTo(self.textView.mas_left).with.offset(10);
        make.height.offset(15);
    }];
    
    self.downLabel = [[UILabel alloc] init];
    self.downLabel.text = @"是否手动结束";
    self.downLabel.font = SYSTEMFONT(12);
    [self.baseView addSubview:self.downLabel];
    [self.downLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.baseView.mas_left).with.offset(22);
        make.top.equalTo(self.textView.mas_bottom).with.offset(15);
    }];
    
    self.yesImg = [[UIImageView alloc] init];
    self.yesImg.image = ImageNamed(@"se");
    [self.baseView addSubview:self.yesImg];
    [self.yesImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.downLabel.mas_right).with.offset(15);
        make.centerY.equalTo(self.downLabel.mas_centerY);
        make.width.offset(20);
        make.height.offset(20);
    }];
    
    self.finished = YES;
    
    self.yeslabel = [[UILabel alloc] init];
    self.yeslabel.text = @"是";
    self.yeslabel.textColor = [UIColor colorWithHex:0xbe0405];
    [self.baseView addSubview:self.yeslabel];
    self.yeslabel.font = SYSTEMFONT(13);
    [self.yeslabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.yesImg.mas_right).with.offset(8);
        make.centerY.equalTo(self.downLabel.mas_centerY);
        make.width.offset(20);
        make.height.offset(20);
    }];
    
    self.yesbutton = [[UIButton alloc] init];
    [self.baseView addSubview:self.yesbutton];
    [self.yesbutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.yesImg.mas_left).with.offset(0);
        make.centerY.equalTo(self.downLabel.mas_centerY);
        make.right.equalTo(self.yeslabel.mas_right).with.offset(0);
        make.height.offset(20);
    }];
//    [self.yesbutton addTarget:self action:@selector(yesOperation:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)closeOperation:(UIButton *)sender{
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickTheCloseButtonOperate:)]) {
        [self.delegate clickTheCloseButtonOperate:sender];
    }
}

- (void)agreementOperaton:(UIButton *)sender{
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickTheAgreementButtonOperate:andReason:)]) {
        [self.delegate clickTheAgreementButtonOperate:sender andReason:self.textView.text];
    }
}

- (void)dismissOperate:(UIButton *)sender{
    if (self.delegate && [self.delegate respondsToSelector:@selector(clickTheTurnDownButtonOpearate:andReason:)]) {
        [self.delegate clickTheTurnDownButtonOpearate:sender andReason:self.textView.text];
    }
}

#pragma mark ======   textview delegate   ======
- (void)textViewDidChange:(UITextView *)textView{
    if (textView == self.textView) {
        if (textView.text.length > 0) {
            self.placeHolder.text = @"";
        } else {
            self.placeHolder.text = @"请输入意见....";
        }
    }
}

- (void)refreshThePendingView:(BOOL)finished{
    if (finished) {
//        CGRect baseRect = self.baseView.frame;
//        baseRect.size.height = 230;
        self.baseView.frame = CGRectMake(SCREENـWIDTH / 2 - 150, SCREEN_HEIGHT / 2 - 115, 300, 230);
        
        self.downLabel.hidden = YES;
        self.yesImg.hidden = YES;
        self.yeslabel.hidden = YES;
        self.yesbutton.hidden = YES;
    } else {
//        CGRect baseRect = self.baseView.frame;
//        baseRect.size.height = 250;
        self.baseView.frame = CGRectMake(SCREENـWIDTH / 2 - 150, SCREEN_HEIGHT / - 125, 300, 250);
        
        self.downLabel.hidden = NO;
        self.yesImg.hidden = NO;
        self.yeslabel.hidden = NO;
        self.yesbutton.hidden = NO;
    }
}
@end

//
//  PartyView.m
//  UnderlyingArchitecture
//
//  Created by mac on 2019/7/1.
//  Copyright © 2019 liuPengCheng. All rights reserved.
//

#import "PartyView.h"

@implementation PartyView

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
        [self createSubview];
    }
    return self;
}

- (void)createSubview{
    UIView *topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENـWIDTH, 30)];
    [self addSubview:topView];
    UIImageView *imageview1 = [[UIImageView alloc] init];
    [self addSubview:imageview1];
    imageview1.image = ImageNamed(@"se-two");
    [imageview1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(topView.mas_centerY);
        make.left.equalTo(self.mas_left).with.offset(15);
        make.width.offset(17);
        make.height.offset(16);
    }];
    
    UILabel *topLabel = [[UILabel alloc] init];
    topLabel.text = @"个人党务";
    topLabel.font = SYSTEMFONT(16);
    [self addSubview:topLabel];
    topLabel.textColor = [UIColor colorWithHex:0xbe0405];
    [topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(topView.mas_centerY);
        make.left.equalTo(imageview1.mas_right).with.offset(10);
    }];
    NSArray *arrairs = @[@"党务1",@"党务2",@"党务3",@"党务4",@"党务5",@"党务6",@"党务7"];
    NSArray *arrairsLabel = @[@"党员信息",@"考核排行",@"三会一课",@"在线考试",@"党费收缴",@"学习强国",@"干部报备"];
    
    
    
    UIView *arraitsView = [[UIView alloc] init];
    [self addSubview:arraitsView];
//    arraitsView.backgroundColor = [UIColor orangeColor];
    [arraitsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(topView.mas_bottom).with.offset(0);
        make.left.equalTo(self.mas_left).with.offset(0);
        make.width.offset(SCREENـWIDTH);
        make.height.offset(170);
    }];
    CGFloat X = 0;
    CGFloat Y = 0;
    for (int i = 0; i < arrairs.count; i++) {
        UIImageView *arrairsImage = [[UIImageView alloc] init];
        arrairsImage.frame = CGRectMake((SCREENـWIDTH - 200) / 5 + X, Y + 5, 50, 50);
        arrairsImage.image = ImageNamed(arrairs[i]);
        [arraitsView addSubview:arrairsImage];
        
        UILabel *arrLabel = [[UILabel alloc] init];
        [arraitsView addSubview:arrLabel];
        arrLabel.text = arrairsLabel[i];
        arrLabel.font = SYSTEMFONT(12);
        arrLabel.textColor = [UIColor colorWithHex:0x777777];
        [arrLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(arrairsImage.mas_centerX);
            make.top.equalTo(arrairsImage.mas_bottom).with.offset(8);
        }];
        
        UIButton *attButton = [[UIButton alloc] init];
        [arraitsView addSubview:attButton];
        attButton.tag = 100 + i;
        [attButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(arrairsImage.mas_top).with.offset(0);
            make.left.equalTo(arrairsImage.mas_left).with.offset(0);
            make.right.equalTo(arrairsImage.mas_right).with.offset(0);
            make.bottom.equalTo(arrLabel.mas_bottom).with.offset(0);
        }];
        [attButton addTarget:self action:@selector(arraritsButtonOperation:) forControlEvents:UIControlEventTouchUpInside];
        
        X += (SCREENـWIDTH - 200) / 5 + 50;
        if (X >= SCREENـWIDTH - ((SCREENـWIDTH - 200) / 5 + 50)) {
            X = 0;
            Y = 87;
        }
    }
    
    UIView *lineview = [[UIView alloc] init];
    [self addSubview:lineview];
    lineview.backgroundColor = [UIColor colorWithHex:0xececec];
    [lineview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(arraitsView.mas_bottom).with.offset(0);
        make.left.equalTo(arraitsView.mas_left).with.offset(0);
        make.width.offset(SCREENـWIDTH);
        make.height.offset(2);
    }];
    
    UIView *parthTopView = [[UIView alloc] init];
    [self addSubview:parthTopView];
    [parthTopView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineview.mas_bottom).with.offset(0);
        make.left.equalTo(lineview.mas_left).with.offset(0);
        make.width.offset(SCREENـWIDTH);
        make.height.offset(30);
    }];
    
    UIImageView *imageview2 = [[UIImageView alloc] init];
    imageview2.image = ImageNamed(@"se-two");
    [parthTopView addSubview:imageview2];
    [imageview2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(parthTopView.mas_centerY);
        make.left.equalTo(parthTopView.mas_left).with.offset(15);
        make.width.offset(17);
        make.height.offset(16);
    }];
    UILabel *parLabel = [[UILabel alloc] init];
    parLabel.text = @"指尖党建";
    parLabel.textColor = [UIColor colorWithHex:0xbe0405];
    parLabel.font = SYSTEMFONT(16);
    [parthTopView addSubview:parLabel];
    [parLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(parthTopView.mas_centerY);
        make.left.equalTo(imageview2.mas_right).with.offset(10);
    }];
    
    UIView *partysImageView = [[UIView alloc] init];
    [self addSubview:partysImageView];
    [partysImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(parthTopView.mas_bottom).with.offset(0);
        make.left.equalTo(self.mas_left).with.offset(0);
        make.width.offset(SCREENـWIDTH);
        make.height.offset(180);
    }];
    
    NSArray *partys = @[@"党1",@"党2",@"党3",@"党4",@"党5",@"党6",@"党7",@"党8"];
    NSArray *partysTitle = @[@"党建动态",@"书记有话说",@"组织有安排",@"成果有展示",@"基层有请示",@"支部排行",@"组织导航",@"定采微资讯"];
    CGFloat partyX = 0;
    CGFloat partyY = 0;
    for (int i = 0; i < partys.count; i++) {
        UIImageView *arrairsImage = [[UIImageView alloc] init];
        arrairsImage.frame = CGRectMake((SCREENـWIDTH - 200) / 5 + partyX, partyY + 5, 50, 50);
        arrairsImage.image = ImageNamed(partys[i]);
        [partysImageView addSubview:arrairsImage];
        
        UILabel *arrLabel = [[UILabel alloc] init];
        [partysImageView addSubview:arrLabel];
        arrLabel.text = partysTitle[i];
        arrLabel.font = SYSTEMFONT(12);
        arrLabel.textColor = [UIColor colorWithHex:0x777777];
        [arrLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(arrairsImage.mas_centerX);
            make.top.equalTo(arrairsImage.mas_bottom).with.offset(8);
        }];
        
        UIButton *attButton = [[UIButton alloc] init];
        [partysImageView addSubview:attButton];
        attButton.tag = 200 + i;
        [attButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(arrairsImage.mas_top).with.offset(0);
            make.left.equalTo(arrairsImage.mas_left).with.offset(0);
            make.right.equalTo(arrairsImage.mas_right).with.offset(0);
            make.bottom.equalTo(arrLabel.mas_bottom).with.offset(0);
        }];
        [attButton addTarget:self action:@selector(partyButtonOperation:) forControlEvents:UIControlEventTouchUpInside];
        
        partyX += (SCREENـWIDTH - 200) / 5 + 50;
        if (partyX >= SCREENـWIDTH - ((SCREENـWIDTH - 200) / 5 + 50)) {
            partyX = 0;
            partyY = 87;
        }
    }
    
}

#pragma mark ======   党务按钮操作   ======
- (void)arraritsButtonOperation:(UIButton *)button{
    NSInteger tag = button.tag - 100;
    if (self.delegate && [self.delegate respondsToSelector:@selector(arrairtsClickOperation:)]) {
        [self.delegate arrairtsClickOperation:tag];
    }
    
}
- (void)partyButtonOperation:(UIButton *)button{
    NSInteger tag = button.tag - 200;
    if (self.delegate && [self.delegate respondsToSelector:@selector(buildingClickOperation:)]) {
        [self.delegate buildingClickOperation:tag];
    }
}


@end



@implementation PartyBackgroundView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
        [self createSubview];
    }
    return self;
}

- (void)createSubview{
    UIView *view = [[UIView alloc] init];
    [self addSubview:view];
    view.backgroundColor = [UIColor whiteColor];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.centerX.equalTo(self.mas_centerX);
        make.height.offset(170);
        make.width.offset(300);
    }];
    ViewRadius(view, 8);
    
    UIButton *downLoad = [[UIButton alloc] init];
    [view addSubview:downLoad];
    [downLoad setTitle:@"现在下载" forState:UIControlStateNormal];
    [downLoad setTitleColor:[UIColor colorWithHex:0x222222] forState:UIControlStateNormal];
    [downLoad mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view.mas_left).with.offset(0);
        make.height.offset(50);
        make.width.offset(150);
        make.bottom.equalTo(view.mas_bottom).with.offset(0);
    }];
    [downLoad addTarget:self action:@selector(downloadClick:) forControlEvents:UIControlEventTouchUpInside];
    ViewBorderRadius(downLoad, 0, 1, [UIColor colorWithHex:0xececec]);
    
    UIButton *wait  = [[UIButton alloc] init];
    [wait setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [wait setTitle:@"稍候再说" forState:UIControlStateNormal];
    wait.backgroundColor = [UIColor colorWithHex:0x1773DB];
    [view addSubview:wait];
    [wait mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(view.mas_right).with.offset(0);
        make.height.offset(50);
        make.width.offset(150);
        make.bottom.equalTo(view.mas_bottom).with.offset(0);
    }];
    [wait addTarget:self action:@selector(waitClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *learn = [[UIImageView alloc] init];
    [view addSubview:learn];
    learn.image = ImageNamed(@"党务6");
    [learn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(view.mas_left).with.offset(20);
        make.height.offset(70);
        make.width.offset(70);
        make.top.equalTo(view.mas_top).with.offset(25);
    }];
    
    UIView *titleView = [[UIView alloc] init];
    [view addSubview:titleView];
    [titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(view.mas_top).with.offset(0);
        make.right.equalTo(view.mas_right).with.offset(0);
        make.left.equalTo(learn.mas_right).with.offset(15);
        make.height.offset(120);
    }];
    
    UILabel *title = [[UILabel alloc] init];
    title.text = @"抱歉";
    title.font = SYSTEMFONT(22);
    title.textColor = [UIColor colorWithHex:0xbe0405];
    [titleView addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(titleView.mas_centerX);
        make.top.equalTo(titleView.mas_top).with.offset(25);
    }];
    
    UILabel *label1 = [[UILabel alloc] init];
    label1.textColor = [UIColor colorWithHex:0x555555];
    label1.text = @"你还没有安装“学习强国”";
    label1.font = SYSTEMFONT(15);
    [titleView addSubview:label1];
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(titleView.mas_centerX);
        make.top.equalTo(title.mas_bottom).with.offset(8);
    }];
    UILabel *label2 = [[UILabel alloc] init];
    label2.textColor = [UIColor colorWithHex:0x555555];
    label2.text = @"是否前去下载“学习强国”";
    label2.font = SYSTEMFONT(15);
    [titleView addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(titleView.mas_centerX);
        make.top.equalTo(label1.mas_bottom).with.offset(8);
    }];
    
}

- (void)downloadClick:(UIButton *)sender{
    if (self.delegate && [self.delegate respondsToSelector:@selector(downloadOperation:)]) {
        [self.delegate downloadOperation:sender];
    }
}


- (void)waitClick:(UIButton *)sender{
    if (self.delegate && [self.delegate respondsToSelector:@selector(waitAMinute:)]) {
        [self.delegate waitAMinute:sender];
    }
}
@end

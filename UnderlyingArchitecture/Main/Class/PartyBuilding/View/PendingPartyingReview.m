//
//  PendingPartyingReview.m
//  UnderlyingArchitecture
//
//  Created by mac on 2019/7/24.
//  Copyright © 2019 liuPengCheng. All rights reserved.
//

#import "PendingPartyingReview.h"
#import "PendingCell.h"
@interface PendingPartyingReview () <UITextViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UIView *baseView;
@property (nonatomic, strong) UITableView *cadreTableView;

@property (nonatomic, strong) UIButton *yesbutton;
@property (nonatomic, strong) UIButton *noButton;
@property (nonatomic, strong) UILabel *yeslabel;
@property (nonatomic, strong) UILabel *noLabel;
@property (nonatomic, strong) UIImageView *yesImg;
@property (nonatomic, strong) UIImageView *noImg;

@property (nonatomic, assign) BOOL select;
@property (nonatomic, strong) NSIndexPath *selectPath;
@end

@implementation PendingPartyingReview

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
    self.baseView.frame = CGRectMake(SCREENـWIDTH / 2 - 150, SCREEN_HEIGHT / 2 - 225, 300, 450);
    [self addSubview:self.baseView];
    self.baseView.backgroundColor = [UIColor whiteColor];
    ViewRadius(self.baseView, 5);
    
    UIView *topView = [[UIView alloc] init];
    [self.baseView addSubview:topView];
    topView.backgroundColor = [UIColor colorWithHex:0x1773DB];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.baseView.mas_top).with.offset(0);
        make.height.offset(40);
        make.left.equalTo(self.baseView.mas_left).with.offset(0);
        make.right.equalTo(self.baseView.mas_right).with.offset(0);
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
    [self.baseView addSubview:self.textView];
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(topView.mas_bottom).with.offset(15);
        make.height.offset(80);
        make.left.equalTo(self.baseView.mas_left).with.offset(20);
        make.right.equalTo(self.baseView.mas_right).with.offset(-20);
    }];
    ViewBorderRadius(self.textView, 8, 1, [UIColor colorWithHex:0xececec]);
    
    self.placeHolder = [[UILabel alloc] init];
    self.placeHolder.font = SYSTEMFONT(13);
    self.placeHolder.text = @"请输入意见....";
    self.placeHolder.textColor = [UIColor colorWithHex:0x888888];
    [self.baseView addSubview:self.placeHolder];
    [self.placeHolder mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.textView.mas_top).with.offset(5);
        make.left.equalTo(self.textView.mas_left).with.offset(10);
        make.height.offset(15);
    }];
    
    UILabel *downLabel = [[UILabel alloc] init];
    downLabel.text = @"是否手动结束";
    downLabel.font = SYSTEMFONT(12);
    [self.baseView addSubview:downLabel];
    [downLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.baseView.mas_left).with.offset(22);
        make.top.equalTo(self.textView.mas_bottom).with.offset(15);
    }];
    
    self.yesImg = [[UIImageView alloc] init];
    self.yesImg.image = ImageNamed(@"unse");
    [self.baseView addSubview:self.yesImg];
    [self.yesImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(downLabel.mas_right).with.offset(15);
        make.centerY.equalTo(downLabel.mas_centerY);
        make.width.offset(20);
        make.height.offset(20);
    }];
    
    self.select = NO;
    
    self.yeslabel = [[UILabel alloc] init];
    self.yeslabel.text = @"是";
    self.yeslabel.textColor = [UIColor colorWithHex:0x333333];
    [self.baseView addSubview:self.yeslabel];
    self.yeslabel.font = SYSTEMFONT(13);
    [self.yeslabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.yesImg.mas_right).with.offset(8);
        make.centerY.equalTo(downLabel.mas_centerY);
        make.width.offset(20);
        make.height.offset(20);
    }];
    
    self.yesbutton = [[UIButton alloc] init];
    [self.baseView addSubview:self.yesbutton];
    [self.yesbutton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.yesImg.mas_left).with.offset(0);
        make.centerY.equalTo(downLabel.mas_centerY);
        make.right.equalTo(self.yeslabel.mas_right).with.offset(0);
        make.height.offset(20);
    }];
    [self.yesbutton addTarget:self action:@selector(yesOperation:) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.noImg = [[UIImageView alloc] init];
    self.noImg.image = ImageNamed(@"se");
    [self.baseView addSubview:self.noImg];
    [self.noImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.yeslabel.mas_right).with.offset(15);
        make.centerY.equalTo(downLabel.mas_centerY);
        make.width.offset(20);
        make.height.offset(20);
    }];
    
    self.noLabel = [[UILabel alloc] init];
    self.noLabel.text = @"否";
    self.noLabel.textColor = [UIColor colorWithHex:0xbe0405];
    [self.baseView addSubview:self.noLabel];
    self.noLabel.font = SYSTEMFONT(13);
    [self.noLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.noImg.mas_right).with.offset(8);
        make.centerY.equalTo(downLabel.mas_centerY);
        make.width.offset(20);
        make.height.offset(20);
    }];
    
    self.noButton = [[UIButton alloc] init];
    [self.baseView addSubview:self.noButton];
    [self.noButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.noImg.mas_left).with.offset(0);
        make.centerY.equalTo(downLabel.mas_centerY);
        make.right.equalTo(self.noLabel.mas_right).with.offset(0);
        make.height.offset(20);
    }];
    [self.noButton addTarget:self action:@selector(noOperation:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *deterButton = [[UIButton alloc] init];
    [self.baseView addSubview:deterButton];
    ViewRadius(deterButton, 8);
    deterButton.backgroundColor = [UIColor colorWithHex:0x1773DB];
    [deterButton setTitle:@"同意" forState:UIControlStateNormal];
    [deterButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [deterButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.baseView.mas_bottom).with.offset(-10);
        make.width.offset(100);
        make.height.offset(30);
        make.right.offset(-15);
    }];
    [deterButton addTarget:self action:@selector(agreementOperaton:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *dismissButton = [[UIButton alloc] init];
    [self.baseView addSubview:dismissButton];
    ViewRadius(dismissButton, 8);
    dismissButton.backgroundColor = [UIColor colorWithHex:0xbe0405];
    [dismissButton setTitle:@"驳回" forState:UIControlStateNormal];
    [dismissButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [dismissButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.baseView.mas_bottom).with.offset(-10);
        make.width.offset(100);
        make.height.offset(30);
        make.left.offset(15);
    }];
    
    [dismissButton addTarget:self action:@selector(dismissOperate:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *nextLabel = [[UILabel alloc] init];
    [self.baseView addSubview:nextLabel];
    nextLabel.text = @"选择下一步审批人:";
    nextLabel.font = SYSTEMFONT(14);
    [nextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(downLabel.mas_bottom).with.offset(15);
        make.left.equalTo(self.baseView.mas_left).with.offset(22);
    }];
    
    self.cadreTableView = [[UITableView alloc] init];
    [self.baseView addSubview:self.cadreTableView];
    [self.cadreTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.baseView.mas_left).with.offset(20);
        make.right.equalTo(self.baseView.mas_right).with.offset(-20);
        make.top.equalTo(nextLabel.mas_bottom).with.offset(6);
        make.bottom.equalTo(deterButton.mas_top).with.offset(-10);
    }];
    ViewBorderRadius(self.cadreTableView, 5, 0.8, [UIColor colorWithHex:0x999999]);
    self.cadreTableView.delegate = self;
    self.cadreTableView.dataSource = self;
    [self.cadreTableView registerNib:LNib(@"PendingCell") forCellReuseIdentifier:@"pen"];
    
    self.cadreTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLineEtched;
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

- (void)closeOperation:(UIButton *)sender{
    if (self.delegate && [self.delegate respondsToSelector:@selector(partyClickTheCloseOperate:)]) {
        [self.delegate partyClickTheCloseOperate:sender];
    }
}

- (void)agreementOperaton:(UIButton *)sender{
    if (self.delegate && [self.delegate respondsToSelector:@selector(partyClickTheAgreeMentOperate:andFinished:andReason:)]) {
        [self.delegate partyClickTheAgreeMentOperate:sender andFinished:self.select andReason:self.textView.text];
    }
}

- (void)dismissOperate:(UIButton *)sender{
    if (self.delegate && [self.delegate respondsToSelector:@selector(partyClickTheTurnDownOperate:andReason:)]) {
        [self.delegate partyClickTheTurnDownOperate:sender andReason:self.textView.text];
    }
}

- (void)yesOperation:(UIButton *)sender{
    self.select = YES;
    self.yesImg.image = ImageNamed(@"se");
    self.yeslabel.textColor = [UIColor colorWithHex:0xbe0405];
    self.noImg.image = ImageNamed(@"unse");
    self.noLabel.textColor = [UIColor colorWithHex:0x333333];
    self.cadreTableView.hidden = YES;
    CGRect rect = self.cadreTableView.frame;
    NSLog(@"tableview的位置%@",NSStringFromCGRect(rect));
    rect.size.height = 0;
    self.cadreTableView.frame = rect;
    
    CGRect baseRect = self.baseView.frame;
    baseRect.origin.y = SCREEN_HEIGHT / 2 - 115;
    baseRect.size.height = 230;
    self.baseView.frame = baseRect;
 
    
}
- (void)noOperation:(UIButton *)sender{
    self.select = NO;
    self.yesImg.image = ImageNamed(@"unse");
    self.yeslabel.textColor = [UIColor colorWithHex:0x333333];
    self.noLabel.textColor =[UIColor colorWithHex:0xbe0405];
    self.noImg.image = ImageNamed(@"se");
    self.cadreTableView.hidden = NO;
    
    CGRect rect = self.cadreTableView.frame;
    NSLog(@"tableview的位置%@",NSStringFromCGRect(rect));
    rect.size.height = 197.5;
    self.cadreTableView.frame = rect;
    
    CGRect baseRect = self.baseView.frame;
    baseRect.origin.y = SCREEN_HEIGHT / 2 - 225;
    baseRect.size.height = 450;
    self.baseView.frame = baseRect;
    
    
}

- (void)setCadrelevelArray:(NSArray *)cadrelevelArray{
    _cadrelevelArray = cadrelevelArray;
    [self.cadreTableView reloadData];
}

#pragma mark ======   tableview delegate datasource   ======
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.cadrelevelArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    shenPiModel *model = self.cadrelevelArray[indexPath.row];
    PendingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"pen" forIndexPath:indexPath];
    cell.name.text = model.name;
    cell.name.numberOfLines = 0;
    cell.department.numberOfLines = 0;
    if ([NSString isStringNull:model.dangneizhiwu]) {
        cell.department.text = @"党内职务:未完善";
    } else {
        cell.department.text = model.dangneizhiwu;
    }
    
    if (self.selectPath == indexPath) {
        cell.backView.backgroundColor = [UIColor colorWithHex:0x1773DB];
    } else {
        cell.backView.backgroundColor = [UIColor whiteColor];
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    shenPiModel *shenpiModel = self.cadrelevelArray[indexPath.row];
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    int newRow = (int)indexPath.row;
    int oldRow = (int)(self.selectPath != nil) ? (int)self.selectPath.row : -1;
    if (newRow != oldRow) {
        PendingCell *newcell = [tableView cellForRowAtIndexPath:indexPath];
        newcell.backView.backgroundColor = [UIColor colorWithHex:0x1773DB];
        
        PendingCell *oldcell = [tableView cellForRowAtIndexPath:self.selectPath];
        oldcell.backView.backgroundColor = [UIColor whiteColor];
        self.selectPath = [indexPath copy];
    }
    if (self.delegate && [self.delegate respondsToSelector:@selector(partySelectTheModel:)]) {
        [self.delegate partySelectTheModel:shenpiModel];
    }
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
//    PendingCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    cell.backView.backgroundColor = [UIColor whiteColor];
}
@end

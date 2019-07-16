//
//  AssessmentCell.m
//  UnderlyingArchitecture
//
//  Created by mac on 2019/7/8.
//  Copyright © 2019 liuPengCheng. All rights reserved.
//

#import "AssessmentCell.h"

@implementation AssessmentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)refreshTheModel:(AssessmentModel *)model{
    
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = 5;
    NSAttributedString *attributed = [[NSAttributedString alloc] initWithString:NSStringFormat(@"%@",model.title) attributes:@{NSForegroundColorAttributeName : [UIColor colorWithHex:0x333333], NSFontAttributeName : SYSTEMFONT(16), NSParagraphStyleAttributeName : style}];
    self.contentLabel.attributedText = attributed;
    
    if (model.status == 1) {
        _assessmentLabel.text = @"未通过";
        _assessmentLabel.textColor = [UIColor colorWithHex:0x7777777];
    } else if (model.status == 2) {
        _assessmentLabel.text = @"已通过";
        _assessmentLabel.textColor = COLOR_CLASS6;
    } else if (model.status == 3) {
        _assessmentLabel.text = @"待审核";
        _assessmentLabel.textColor = [UIColor colorWithHex:0x7777777];
    }
    
    self.statusLabel.text = model.type.name;
    if ([model.type.name isEqualToString:@"党员大会"]) {
        self.statusLabel.textColor = COLOR_CLASS1;
        self.statusImage.image = ImageNamed(@"class1");
        
    } else if ([model.type.name isEqualToString:@"党课"]) {
        self.statusLabel.textColor = COLOR_CLASS6;
        self.statusImage.image = ImageNamed(@"class7");
        
    } else if ([model.type.name isEqualToString:@"党小组会"]) {
        self.statusLabel.textColor = COLOR_CLASS4;
        self.statusImage.image = ImageNamed(@"class5");
        
    } else if ([model.type.name isEqualToString:@"学习心得"] || [model.type.name isEqualToString:@"年度计划"]) {
        self.statusLabel.textColor = COLOR_CLASS2;
        self.statusImage.image = ImageNamed(@"class2");
        
    } else if ([model.type.name isEqualToString:@"支委会"]) {
        self.statusLabel.textColor = COLOR_CLASS5;
        self.statusImage.image = ImageNamed(@"class6");
        
    } else if ([model.type.name isEqualToString:@"组织生活会"] || [model.type.name isEqualToString:@"固定活动日"] || [model.type.name isEqualToString:@"党费收缴"]) {
        self.statusLabel.textColor = COLOR_CLASS6;
        self.statusImage.image = ImageNamed(@"class9");
        
    }
}

@end

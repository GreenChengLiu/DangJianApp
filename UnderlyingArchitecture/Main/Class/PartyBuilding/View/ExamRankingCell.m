//
//  ExamRankingCell.m
//  UnderlyingArchitecture
//
//  Created by mac on 2019/7/2.
//  Copyright © 2019 liuPengCheng. All rights reserved.
//

#import "ExamRankingCell.h"

@implementation ExamRankingCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end

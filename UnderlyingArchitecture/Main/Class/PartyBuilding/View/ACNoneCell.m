//
//  ACNoneCell.m
//  UnderlyingArchitecture
//
//  Created by liuPengCheng on 2019/7/12.
//  Copyright © 2019 liuPengCheng. All rights reserved.
//

#import "ACNoneCell.h"

@implementation ACNoneCell

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

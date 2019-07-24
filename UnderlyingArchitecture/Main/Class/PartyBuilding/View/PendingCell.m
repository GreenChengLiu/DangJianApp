//
//  PendingCell.m
//  UnderlyingArchitecture
//
//  Created by mac on 2019/7/24.
//  Copyright © 2019 liuPengCheng. All rights reserved.
//

#import "PendingCell.h"

@implementation PendingCell

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

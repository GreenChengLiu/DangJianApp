//
//  HomeNoImgCell.m
//  com.quDongChina
//
//  Created by mac on 2019/5/29.
//  Copyright © 2019 mac. All rights reserved.
//

#import "HomeNoImgCell.h"

@implementation HomeNoImgCell

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

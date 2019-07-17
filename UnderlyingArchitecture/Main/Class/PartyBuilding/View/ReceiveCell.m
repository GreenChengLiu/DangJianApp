//
//  ReceiveCell.m
//  UnderlyingArchitecture
//
//  Created by liuPengCheng on 2019/7/15.
//  Copyright © 2019 liuPengCheng. All rights reserved.
//

#import "ReceiveCell.h"

@implementation ReceiveCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)selectedOpertion:(UIButton *)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(selectClick:and:)]) {
        [self.delegate selectClick:sender and:self.rowTag];
    }
}



@end

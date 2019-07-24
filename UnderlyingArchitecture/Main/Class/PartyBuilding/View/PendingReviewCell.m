//
//  PendingReviewCell.m
//  UnderlyingArchitecture
//
//  Created by mac on 2019/7/23.
//  Copyright © 2019 liuPengCheng. All rights reserved.
//

#import "PendingReviewCell.h"

@implementation PendingReviewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (IBAction)pendingReviewOperatioin:(UIButton *)sender {
    if (self.block) {
        self.block(self.section);
    }
}


@end

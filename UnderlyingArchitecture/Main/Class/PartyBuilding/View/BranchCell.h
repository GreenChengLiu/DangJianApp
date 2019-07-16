//
//  BranchCell.h
//  UnderlyingArchitecture
//
//  Created by mac on 2019/7/2.
//  Copyright © 2019 liuPengCheng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BranchCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *rankNum;
@property (weak, nonatomic) IBOutlet UIImageView *rankImage;
@property (weak, nonatomic) IBOutlet UILabel *stt;
@property (weak, nonatomic) IBOutlet UILabel *branck;


@end

NS_ASSUME_NONNULL_END

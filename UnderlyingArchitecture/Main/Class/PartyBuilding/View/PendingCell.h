//
//  PendingCell.h
//  UnderlyingArchitecture
//
//  Created by mac on 2019/7/24.
//  Copyright © 2019 liuPengCheng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PendingCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *department;

@property (weak, nonatomic) IBOutlet UIView *backView;
@end

NS_ASSUME_NONNULL_END

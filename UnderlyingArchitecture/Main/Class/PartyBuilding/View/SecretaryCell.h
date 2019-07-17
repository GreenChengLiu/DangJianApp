//
//  SecretaryCell.h
//  UnderlyingArchitecture
//
//  Created by liuPengCheng on 2019/7/15.
//  Copyright © 2019 liuPengCheng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SecretaryCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *content;

@property (weak, nonatomic) IBOutlet UILabel *time;
@end

NS_ASSUME_NONNULL_END

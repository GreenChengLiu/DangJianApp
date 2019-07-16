//
//  CadreReportCell.h
//  UnderlyingArchitecture
//
//  Created by mac on 2019/7/3.
//  Copyright © 2019 liuPengCheng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CadreReportCell : UITableViewCell
//1377DE
//6DD486
@property (weak, nonatomic) IBOutlet UIImageView *headimg;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *approval;


@end

NS_ASSUME_NONNULL_END

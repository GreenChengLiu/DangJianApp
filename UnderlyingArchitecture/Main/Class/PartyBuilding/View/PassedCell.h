//
//  PassedCell.h
//  UnderlyingArchitecture
//
//  Created by mac on 2019/7/23.
//  Copyright © 2019 liuPengCheng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PassedCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *reviewname;
@property (weak, nonatomic) IBOutlet UILabel *department;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UILabel *reviewAgreement;
@property (weak, nonatomic) IBOutlet UILabel *reviewStatus;
@property (weak, nonatomic) IBOutlet UIImageView *reviewImage;

@end

NS_ASSUME_NONNULL_END

//
//  PendingReviewCell.h
//  UnderlyingArchitecture
//
//  Created by mac on 2019/7/23.
//  Copyright © 2019 liuPengCheng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^PendingReviewBlock)(NSInteger sender);

@interface PendingReviewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIButton *reviewButton;
@property (weak, nonatomic) IBOutlet UILabel *departmentLabel;

@property (nonatomic, copy) PendingReviewBlock block;
@property (nonatomic, assign) NSInteger section;

@end

NS_ASSUME_NONNULL_END

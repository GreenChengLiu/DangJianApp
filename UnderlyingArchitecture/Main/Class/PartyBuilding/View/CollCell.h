//
//  CollCell.h
//  UnderlyingArchitecture
//
//  Created by liuPengCheng on 2019/7/1.
//  Copyright © 2019 liuPengCheng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CollCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *title;

@end

NS_ASSUME_NONNULL_END

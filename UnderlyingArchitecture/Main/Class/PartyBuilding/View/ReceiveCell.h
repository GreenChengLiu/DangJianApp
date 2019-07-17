//
//  ReceiveCell.h
//  UnderlyingArchitecture
//
//  Created by liuPengCheng on 2019/7/15.
//  Copyright © 2019 liuPengCheng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol ReceiveCellDelegate <NSObject>
@optional
- (void)selectClick:(UIButton *)button and:(NSInteger)rowTag;

@end

@interface ReceiveCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *phone;
@property (weak, nonatomic) IBOutlet UIButton *selectButton;
@property (nonatomic, assign) NSInteger rowTag;

@property (nonatomic, weak) id <ReceiveCellDelegate> delegate;
@end

NS_ASSUME_NONNULL_END

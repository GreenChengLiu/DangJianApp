//
//  ExamRankingCell.h
//  UnderlyingArchitecture
//
//  Created by mac on 2019/7/2.
//  Copyright © 2019 liuPengCheng. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ExamRankingCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *numberRank;   //排行
@property (weak, nonatomic) IBOutlet UIImageView *headImg;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *age;
@property (weak, nonatomic) IBOutlet UILabel *stt;
@property (weak, nonatomic) IBOutlet UIImageView *rankImage;


@end

NS_ASSUME_NONNULL_END

//
//  AssessmentCell.h
//  UnderlyingArchitecture
//
//  Created by mac on 2019/7/8.
//  Copyright © 2019 liuPengCheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PartyModel.h"

#define COLOR_CLASS1 [UIColor colorWithHex:0xFA8F07]
#define COLOR_CLASS2 [UIColor colorWithHex:0xFA2906]
#define COLOR_CLASS3 [UIColor colorWithHex:0x1DCFD1]
#define COLOR_CLASS4 [UIColor colorWithHex:0xE672FF]
#define COLOR_CLASS5 [UIColor colorWithHex:0x45D066]
#define COLOR_CLASS6 [UIColor colorWithHex:0x5B84FB]
#define COLOR_CLASS7 [UIColor colorWithHex:0xFB4F63]

NS_ASSUME_NONNULL_BEGIN
@interface AssessmentCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *assessmentLabel;   //审核状态
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;      //内容
@property (weak, nonatomic) IBOutlet UIImageView *statusImage;   //状态栏
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;       //状态内容.

//class1 FA8F07  class2 FA2906  class3 1DCFD1 class4 1DCFD1.... class5 E672FF
//class6 45D066  class7 5B84FB  class8 E672FF..... classs9 FB4F63 class10 5B84FB.....

- (void)refreshTheModel:(AssessmentModel *)model;

@end

NS_ASSUME_NONNULL_END

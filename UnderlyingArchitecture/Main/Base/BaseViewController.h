//
//  BaseViewController.h
//  com.quDongChina
//
//  Created by mac on 2019/5/24.
//  Copyright © 2019 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

- (void)showWithStatus:(NSString *)status withDelay:(NSTimeInterval)delay;

- (void)showALertWithTitle:(NSString *)title;
@end

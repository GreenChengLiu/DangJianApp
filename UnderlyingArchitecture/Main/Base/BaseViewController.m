//
//  BaseViewController.m
//  com.quDongChina
//
//  Created by mac on 2019/5/24.
//  Copyright © 2019 mac. All rights reserved.
//

#import "BaseViewController.h"
#import "MBProgressHUD.h"
@interface BaseViewController ()<UIGestureRecognizerDelegate>

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;
    self.navigationController.interactivePopGestureRecognizer.enabled  = TRUE;
}

- (void)showWithStatus:(NSString *)status withDelay:(NSTimeInterval)delay{
    [SVProgressHUD showWithStatus:status];
    [SVProgressHUD dismissWithDelay:delay];
}
- (void)showALertWithTitle:(NSString *)title{
    MBProgressHUD *hud =[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode =MBProgressHUDModeText;
    hud.label.text = title;
    
    [hud hideAnimated:YES afterDelay:1];
}
-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    NSLog(@" gestureRecognizerShouldBegin : %@ \n %@",gestureRecognizer,[gestureRecognizer class]);
    
    BOOL rlt = FALSE;
    // 手势
    if(gestureRecognizer == self.navigationController.interactivePopGestureRecognizer){
        // 控制器堆栈
        if(self.navigationController.viewControllers.count >= 2){
            rlt = TRUE;
        }
    }
    return rlt;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

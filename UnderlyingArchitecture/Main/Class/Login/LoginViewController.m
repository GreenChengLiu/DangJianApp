//
//  LoginViewController.m
//  UnderlyingArchitecture
//
//  Created by mac on 2019/6/25.
//  Copyright © 2019 liuPengCheng. All rights reserved.
//

#import "LoginViewController.h"
/**  model  **/

#import "UserApi.h"
/**  app delegate  **/
#import "AppDelegate.h"
@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topConstraint;
@property (weak, nonatomic) IBOutlet UIView *loginView;
@property (weak, nonatomic) IBOutlet UIView *passwordView;

@property (weak, nonatomic) IBOutlet UITextField *accounNumber;
@property (weak, nonatomic) IBOutlet UITextField *password;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    self.topConstraint.constant = NEGATIVE;
    self.navigationController.navigationBar.hidden = YES;
    self.loginView.backgroundColor = [[UIColor colorWithHex:0xececec] colorWithAlphaComponent:0.6];
    self.passwordView.backgroundColor = [[UIColor colorWithHex:0xececec] colorWithAlphaComponent:0.6];
    
}
- (IBAction)loginOperation:(UIButton *)sender {
    if (self.accounNumber.text.length > 0) {
        if (self.password.text.length > 0) {
            [self.view endEditing:YES];
            NSDictionary *json = @{
                                   @"username":self.accounNumber.text,
                                   @"password":[self.password.text md5:self.password.text]
                                   };
            [SVProgressHUD showWithStatus:@"正在登录"];
            [[UserApi shareUserApi] QDLoginWithParameter:json andReturnObject:^(NSDictionary * _Nonnull obj) {
                NSLog(@"%@",obj);
                NSInteger code = [obj[@"code"] integerValue];
                if (code == 200) {
                    NSDictionary *data = obj[@"data"];
                    [[UserModel shareUserModel] saveTheUserInfo:data];
                    [[UserModel shareUserModel] saveLoginStatus:YES];
                    [SVProgressHUD showSuccessWithStatus:@"登录成功"];
                    
                    int64_t deleayInSeconds = 0.4;
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(deleayInSeconds * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

                        AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
                        [delegate addChirdViewControllers];
                    });
                }
            } andError:^(NSError * _Nonnull error) {
                NSLog(@"错误信息:%@",error);
                [SVProgressHUD showErrorWithStatus:@"登录失败"];
            }];
        } else {
            [self showALertWithTitle:@"请输入密码"];
        }
    } else {
        [self showALertWithTitle:@"请输入账号"];
    }
}

- (IBAction)touristLogin:(UIButton *)sender {
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [delegate addChirdViewControllers];
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

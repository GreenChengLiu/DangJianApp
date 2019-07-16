//
//  QDNavigationViewController.m
//  com.quDongChina
//
//  Created by mac on 2019/5/24.
//  Copyright © 2019 mac. All rights reserved.
//

#import "QDNavigationViewController.h"
#import "UIView+AddGradualLayer.h"
@interface QDNavigationViewController ()

@end

@implementation QDNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
//    [self.navigationBar setShadowImage:[[UIImage alloc] init]];
//    [self.navigationBar setTintColor:[UIColor whiteColor]];
//    [self.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor],NSForegroundColorAttributeName, nil]];
//    [self.navigationBar setBarTintColor:[UIColor clearColor]];
//    UIView *background = [[UIView alloc] initWithFrame:CGRectMake(0, NEGATIVE, SCREENـWIDTH, NavigationViewHeightContration)];
//    [background addGradualLayerWithColors:[NSArray arrayWithObjects:(id)[UIColor colorWithHex:0xE32E2A].CGColor, (id)[UIColor colorWithHex:0xE32E2A].CGColor , nil]];
//    [self.navigationBar insertSubview:background atIndex:0];
    self.navigationBar.barTintColor = [UIColor colorWithHex:0xbe0405];
    self.navigationBar.tintColor = [UIColor whiteColor];
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
}


- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.childViewControllers.count > 0) {
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleDone target:self action:@selector(back)];
        
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

- (void)back{
    [self popViewControllerAnimated:YES];
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

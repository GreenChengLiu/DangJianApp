//
//  QDTabController.m
//  com.quDongChina
//
//  Created by mac on 2019/5/24.
//  Copyright © 2019 mac. All rights reserved.
//

#import "QDTabController.h"
#import "QDNavigationViewController.h"

@interface QDTabController ()

@end

@implementation QDTabController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSArray *idter = @[@"first",@"second",@"third",@"four"];
    NSArray *seimg = @[@"se-first",@"se-two",@"se-third",@"se-four"];
    NSArray *unse = @[@"first",@"two",@"third",@"four"];
    NSArray *tabitemArray = @[@"指尖党建",@"组织架构",@"党建动态",@"个人中心"];
    for (int i = 0; i < idter.count; i++) {
        QDNavigationViewController *baseVC = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:idter[i]];
//        baseVC.navigationItem.title = tabitemArray[i];
        baseVC.tabBarItem.image = [ImageNamed(unse[i]) imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        baseVC.tabBarItem.selectedImage = [ImageNamed(seimg[i]) imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        baseVC.tabBarItem.title = tabitemArray[i];
        
        [baseVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithHex:0x333333], NSFontAttributeName : [UIFont systemFontOfSize:11]} forState:UIControlStateNormal];
        [baseVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithHex:0xE32E2A], NSFontAttributeName : [UIFont systemFontOfSize:11]} forState:UIControlStateSelected];
//        [controllersArray addObject:baseVC];
        [self addChildViewController:baseVC];
    }
}

/**
 *  添加一个子控制器
 *
 *  @param childVc       子控制器
 *  @param title         标题
 *  @param image         图片
 *  @param selectedImage 选中的图片
 */
- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage{
    
    // 设置子控制器的文字(可以设置tabBar和navigationBar的文字)
    childVc.title = title;
    
    // 设置子控制器的tabBarItem图片
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    // 禁用图片渲染
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //设置文字的样式
    [childVc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithHex:0x666666] ,NSFontAttributeName:[UIFont systemFontOfSize:13]} forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor colorWithHex:0x00b9ff] ,NSFontAttributeName:[UIFont systemFontOfSize:13]} forState:UIControlStateSelected];
    // childVc.view.backgroundColor = RandomColor; // 这句代码会自动加载主页，消息，发现，我四个控制器的view，但是view要在我们用的时候去提前加载
    
    // 为子控制器包装导航控制器
    QDNavigationViewController *navigationVc = [[QDNavigationViewController alloc] initWithRootViewController:childVc];
    // 添加子控制器
    [self addChildViewController:navigationVc];
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

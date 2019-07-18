//
//  WelcomeViewController.m
//  UnderlyingArchitecture
//
//  Created by mac on 2019/6/26.
//  Copyright © 2019 liuPengCheng. All rights reserved.
//

#import "WelcomeViewController.h"
#import "AppDelegate.h"
@interface WelcomeViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topCon;

@end

@implementation WelcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBar.hidden = YES;
    
    self.topCon.constant = -NEGATIVE;
    self.scrollView.contentSize = CGSizeMake(SCREENـWIDTH * 4, 0);
    NSArray *array = @[@"定采欢迎页1.jpg",@"定采欢迎页2.jpg",@"定采欢迎页3.jpg",@"定采欢迎页4.jpg"];
    self.scrollView.pagingEnabled = YES;
    for (int i = 0; i < 4; i++) {
        UIImageView *imageView =[[UIImageView alloc] initWithFrame:CGRectMake(SCREENـWIDTH * i , 0, SCREENـWIDTH, SCREEN_HEIGHT)];
        imageView.contentMode = UIViewContentModeScaleToFill;
        imageView.image =[UIImage imageNamed:array[i]];
        imageView.userInteractionEnabled = YES;
        [_scrollView addSubview:imageView];
        if (i == 3) {
            UITapGestureRecognizer *tap =[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handle_threeImageView)];
            [imageView addGestureRecognizer:tap];
        }
    }
}

- (void)handle_threeImageView{
    AppDelegate *delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [delegate setLoginViewController];
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

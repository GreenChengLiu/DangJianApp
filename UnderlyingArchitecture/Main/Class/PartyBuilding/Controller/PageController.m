//
//  PageController.m
//  UnderlyingArchitecture
//
//  Created by liuPengCheng on 2019/7/12.
//  Copyright © 2019 liuPengCheng. All rights reserved.
//

#import "PageController.h"
#import "AchievementDisplayController.h"
#import "LPCPageView.h"
@interface PageController ()<LPCPageViewDelegate>

@end

@implementation PageController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"成果有展示";
    NSArray *array = @[@"支部荣誉",@"党委相关展示"];
    NSArray *cateid = @[@"65",@"66"];
    NSMutableArray *childVcArray = [NSMutableArray array];
    for (int i = 0; i < array.count; i++) {
        AchievementDisplayController *ach = [[AchievementDisplayController alloc] init];
        ach.categoryID = cateid[i];
        if (i == 0) {
            ach.page = 1;
        } else {
            ach.page = 2;
        }
        [childVcArray addObject:ach];
    }
    LPCPageView *pageView = [[LPCPageView alloc] initWithFrame:CGRectMake(0, NavigationViewHeightContration, SCREENـWIDTH, SCREEN_HEIGHT - NavigationViewHeightContration) titles:array style:nil childVcs:childVcArray.copy parentVc:self];
    
    [pageView setToIndex:0];
    pageView.delegate = self;
    pageView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:pageView];
}


#pragma mark - LSPPageViewDelegate
- (void)pageViewScollEndView:(LPCPageView *)pageView WithIndex:(NSInteger)index
{
    NSLog(@"第%zd个",index);
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

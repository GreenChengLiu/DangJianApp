//
//  OrganizationalNavigationController.m
//  UnderlyingArchitecture
//
//  Created by liuPengCheng on 2019/7/12.
//  Copyright © 2019 liuPengCheng. All rights reserved.
//

#import "OrganizationalNavigationController.h"
//地图
//#import <BaiduMapAPI_Base/BMKBaseComponent.h>
//#import <BaiduMapAPI_Map/BMKMapComponent.h>

@interface OrganizationalNavigationController ()
//@property (nonatomic, strong) BMKMapView *mapView;
@end

@implementation OrganizationalNavigationController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [self.mapView viewWillAppear];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
//    [self.mapView viewWillDisappear];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"组织导航";
    
//    self.mapView = [[BMKMapView alloc] initWithFrame:CGRectMake(0, 0, SCREENـWIDTH, SCREEN_HEIGHT)];
//    self.mapView.delegate = self;
//    [self.view addSubview:self.mapView];
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

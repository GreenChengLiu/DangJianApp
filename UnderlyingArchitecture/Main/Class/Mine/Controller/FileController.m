//
//  FileController.m
//  UnderlyingArchitecture
//
//  Created by mac on 2019/7/2.
//  Copyright © 2019 liuPengCheng. All rights reserved.
//

#import "FileController.h"
/**  tools  **/
#import "UIView+AddGradualLayer.h"
@interface FileController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;    //姓名
@property (weak, nonatomic) IBOutlet UILabel *nationality;  //民族
@property (weak, nonatomic) IBOutlet UILabel *age;          //年龄
@property (weak, nonatomic) IBOutlet UILabel *phone;       //电话
@property (weak, nonatomic) IBOutlet UILabel *emial;       //邮箱
@property (weak, nonatomic) IBOutlet UILabel *jobPosition; //工作岗位
@property (weak, nonatomic) IBOutlet UILabel *typesLabel;  //党员类型
@property (weak, nonatomic) IBOutlet UILabel *branch;      //党内职务
@property (weak, nonatomic) IBOutlet UILabel *branchLabel; //所在支部
@property (weak, nonatomic) IBOutlet UIView *fileView;

@end

@implementation FileController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"党员档案";
    NSLog(@"%@",[@"123456" md5:@"123456"]);
    [self refreshView];
    
    [self.fileView viewShadowPathWithColor:[UIColor colorWithHex:0xececec] shadowOpacity:0.5 shadowRadius:5 shadowPathType:LeShadowPathAround shadowPathWidth:6];
    
}

- (void)refreshView{
    UserModel *user = [UserModel shareUserModel];
    [user getUserInfo];
    if ([NSString isStringNull:user.name]) {
        self.nameLabel.text = @"无";
    } else {
        self.nameLabel.text = user.name;
    }
    
    if ([NSString isStringNull:user.nationality]) {
        self.nationality.text = @"无";
    } else {
        self.nationality.text = user.nationality;
    }
    
    if ([NSString isStringNull:user.age]) {
        self.age.text = @"无";
    } else {
        self.age.text = user.age;
    }
    if ([NSString isStringNull:user.phone]) {
        self.phone.text = @"无";
    } else {
        self.phone.text = user.phone;
    }
    
    if ([NSString isStringNull:user.email]) {
        self.emial.text = @"无";
    } else {
        self.emial.text = user.email;
    }
    if ([NSString isStringNull:user.job]) {
        self.jobPosition.text = @"无";
    } else {
        self.jobPosition.text = user.job;
    }
    
    if ([NSString isStringNull:user.status]) {
        self.typesLabel.text = @"无";
    } else {
        self.typesLabel.text = user.status;
    }
    if ([NSString isStringNull:user.dangneizhiwu]) {
        self.branch.text = @"无";
    } else {
        self.branch.text = user.dangneizhiwu;
    }
    if ([NSString isStringNull:user.og_name]) {
        self.branchLabel.text = @"无";
    } else {
        self.branchLabel.text = user.og_name;
    }
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

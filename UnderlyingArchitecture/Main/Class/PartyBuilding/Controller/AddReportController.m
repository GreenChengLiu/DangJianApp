//
//  AddReportController.m
//  UnderlyingArchitecture
//
//  Created by mac on 2019/7/3.
//  Copyright © 2019 liuPengCheng. All rights reserved.
//

#import "AddReportController.h"
#import "PartyApi.h"
#import "UITextView+CMInputView.h"
#import "CGXPickerView.h"
@interface AddReportController () <UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *reportScrollView;
@property (strong, nonatomic) IBOutlet UIView *reportView;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField; //姓名
@property (weak, nonatomic) IBOutlet UITextView *departTextView; //部门
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *departViewHeight;
@property (weak, nonatomic) IBOutlet UITextField *position;      //职务
@property (weak, nonatomic) IBOutlet UITextView *OutBusiness;    //外出事由
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *outConstraint;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;         //外出时间
@property (nonatomic , strong) CGXPickerViewManager *manager;
@property (weak, nonatomic) IBOutlet UITextField *termTextField; //外出期限
@property (weak, nonatomic) IBOutlet UITextField *location;      //外出地点
@property (weak, nonatomic) IBOutlet UITextField *peerPersonnel; //同行人员
@property (weak, nonatomic) IBOutlet UITextField *contact;       //联系人
@property (weak, nonatomic) IBOutlet UITextView *substitute;     //代班人员




@end

@implementation AddReportController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"外出报告单";
    
    CGRect rect = self.reportView.frame;
    rect.size.width = SCREENـWIDTH;
    self.reportView.frame = rect;
    [self.reportScrollView addSubview:self.reportView];
    self.reportScrollView.contentSize = CGSizeMake(0, rect.size.height);
    [self set];
    
    UserModel *user =[UserModel shareUserModel];
    [user getUserInfo];
    self.nameTextField.text = user.name;
}
- (void)set{
    self.departTextView.delegate = self;
    self.departTextView.cm_placeholder = @"请输入部门";
    self.departTextView.cm_maxNumberOfLines = 4;
    
    self.OutBusiness.delegate = self;
    self.OutBusiness.cm_placeholder = @"请输入外出事由";
    self.OutBusiness.cm_maxNumberOfLines = 4;
    self.substitute.cm_placeholder = @"请输入外出期间代本人主持工作人员及联系电话";
    
    self.manager = [[CGXPickerViewManager alloc] init];
    self.manager.pickerTitleSelectColor = [UIColor colorWithHex:0x333333];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    NSString *textString = @"Text";
    
    if (textView == self.departTextView) {
        CGSize fontsize = [textString sizeWithAttributes:@{NSFontAttributeName : textView.font}];
        
        NSString *newText = [textView.text stringByReplacingCharactersInRange:range withString:text];
        CGSize tallerSize = CGSizeMake(textView.frame.size.width - 10, textView.frame.size.height * 2);
        CGSize newSize = [newText boundingRectWithSize:tallerSize
                                               options:NSStringDrawingUsesLineFragmentOrigin
                                            attributes:@{NSFontAttributeName : textView.font}
                                               context:nil].size;
        NSInteger newLineNum = newSize.height / fontsize.height;
        if ([text isEqualToString:@"\n"]) {
            newLineNum += 1;
        }
        NSInteger textViewHeight = GET_Integer_USERDEFAULTS(@"textViewHeight");
        if (newLineNum > 1) {
            self.departViewHeight.constant = textViewHeight + 10;
        } else {
            self.departViewHeight.constant = 40;
        }
        NSLog(@"departTextView 第%ld行",newLineNum);
    } else if (textView == self.OutBusiness) {
        CGSize fontsize = [textString sizeWithAttributes:@{NSFontAttributeName : textView.font}];
        
        NSString *newText = [textView.text stringByReplacingCharactersInRange:range withString:text];
        CGSize tallerSize = CGSizeMake(textView.frame.size.width - 10, textView.frame.size.height * 2);
        CGSize newSize = [newText boundingRectWithSize:tallerSize
                                               options:NSStringDrawingUsesLineFragmentOrigin
                                            attributes:@{NSFontAttributeName : textView.font}
                                               context:nil].size;
        NSInteger newLineNum = newSize.height / fontsize.height;
        if ([text isEqualToString:@"\n"]) {
            newLineNum += 1;
        }
        NSInteger textViewHeight = GET_Integer_USERDEFAULTS(@"textViewHeight");
        if (newLineNum > 1) {
            self.outConstraint.constant = textViewHeight + 10;
        } else {
            self.outConstraint.constant = 40;
        }
        NSLog(@"outBuiness 第%ld行",newLineNum);
    }
    return YES;
}
- (IBAction)selectTimeOperation:(UIButton *)sender {
    [CGXPickerView showDatePickerWithTitle:@"外出时间" DateType:UIDatePickerModeDate DefaultSelValue:nil MinDateStr:@"1900-01-01 00:00:00" MaxDateStr:@"2100-12-31 00:00:00" IsAutoSelect:YES Manager:nil ResultBlock:^(NSString *selectValue) {
        self.timeLabel.text = selectValue;
    }];
}
//提交
- (IBAction)submitOperation:(UIButton *)sender {
    UserModel *user = [UserModel shareUserModel];
    [user getUserInfo];
    if (self.nameTextField.text.length > 0) {
        if (self.departTextView.text.length > 0) {
            if (self.position.text.length > 0) {
                if (self.OutBusiness.text.length > 0) {
                    if (self.timeLabel.text.length > 0) {
                        if (self.termTextField.text.length > 0) {
                            if (self.location.text.length > 0) {
                                if (self.peerPersonnel.text.length > 0) {
                                    if (self.contact.text.length > 0) {
                                        if (self.substitute.text.length > 0) {
                                            NSDictionary *json = @{
                                                                   @"token":user.token,
                                                                   @"name" : self.nameTextField.text,
                                                                   @"bumen" : self.departTextView.text,
                                                                   @"zhiwu" : self.position.text,
                                                                   @"waichushiyou" : self.OutBusiness.text,
                                                                   @"waichushijian" : [NSString dateToTimestamp:[NSString timeStrToDate:self.timeLabel.text]],
                                                                   @"waichuqixian" : self.termTextField.text,
                                                                   @"waichudidian" : self.location.text,
                                                                   @"tongxinrenyuan" : self.peerPersonnel.text,
                                                                   @"waichu_phone" : self.contact.text,
                                                                   @"other" : self.substitute.text
                                                                   };
                                            
                                            NSLog(@"%@",json);
                                            
                                            [[PartyApi sharePartyApi] partyCadreReportAddParameters:json andReturnObject:^(NSDictionary * _Nonnull obj) {
                                                NSInteger code = [obj[@"code"] integerValue];
                                                if (code == 200) {
                                                    
                                                    [SVProgressHUD showSuccessWithStatus:@"请求成功"];
                                                    [self.navigationController popViewControllerAnimated:YES];
                                                } else {
                                                    [self showALertWithTitle:obj[@"msg"]];
                                                }
                                            } andError:^(NSError * _Nonnull error) {
                                                NSLog(@"%@",error);
                                                [SVProgressHUD showErrorWithStatus:@"失败"];
                                            }];
                                        } else {
                                            [self showALertWithTitle:@"请输入代本人主持工作的人员及电话"];
                                        }
                                    } else {
                                        [self showALertWithTitle:@"请输入联系人及电话"];
                                    }
                                } else {
                                    [self showALertWithTitle:@"请输入同行人员"];
                                }
                            } else {
                                [self showALertWithTitle:@"请输入外出地点"];
                            }
                        } else {
                            [self showALertWithTitle:@"请输入外出期限"];
                        }
                    } else {
                        [self showALertWithTitle:@"请选择时间"];
                    }
                } else {
                    [self showALertWithTitle:@"请输入外出事由"];
                }
            } else {
                [self showALertWithTitle:@"请输入职务"];
            }
        } else {
            [self showALertWithTitle:@"请输入部门"];
        }
    } else {
        [self showALertWithTitle:@"请输入姓名"];
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

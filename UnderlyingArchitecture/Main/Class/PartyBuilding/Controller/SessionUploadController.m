//
//  SessionUploadController.m
//  UnderlyingArchitecture
//
//  Created by mac on 2019/7/9.
//  Copyright © 2019 liuPengCheng. All rights reserved.
//

#import "SessionUploadController.h"
#import "UITextView+CMInputView.h"
@interface SessionUploadController ()<UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIView *uploadView;
@property (weak, nonatomic) IBOutlet UITextView *mettingTextView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *mettingheight;

@end

@implementation SessionUploadController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"三会一课上传";
    self.scrollView.contentSize = CGSizeMake(0, 740);
    
    [self setMeeting];
}
- (void)setMeeting{
    self.mettingTextView.delegate = self;
    self.mettingTextView.cm_placeholder = @"请输入会议内容";
    self.mettingTextView.cm_maxNumberOfLines = 3;
    
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    NSString *textString = @"Text";
    if (textView == self.mettingTextView) {
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
            self.mettingheight.constant = textViewHeight + 40;
        } else {
            self.mettingheight.constant = 40;
        }
    }
    
    
    return YES;
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

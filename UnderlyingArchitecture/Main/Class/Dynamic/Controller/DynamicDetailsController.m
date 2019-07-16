//
//  DynamicDetailsController.m
//  UnderlyingArchitecture
//
//  Created by mac on 2019/6/27.
//  Copyright © 2019 liuPengCheng. All rights reserved.
//

#import "DynamicDetailsController.h"
#import <WebKit/WebKit.h>
@interface DynamicDetailsController () <UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *webView;

@end

@implementation DynamicDetailsController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib..
    [self addWebView];
    
}
- (void)addWebView{
    self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, NavigationViewHeightContration, SCREENـWIDTH, SCREEN_HEIGHT - NavigationViewHeightContration)];
    if ([self.content rangeOfString:@"img"].location != NSNotFound) {
        self.content = [self.content stringByReplacingOccurrencesOfString:@"src=\"" withString:@"src=\"http://www.dbcycdjpt.com"];
        NSLog(@"subStr:%@",self.content);
    }
    // 标签替换
    NSString *originalStr = [self.content stringByReplacingOccurrencesOfString:@"src" withString:@"data-original"];
    
    //获取temp文件的路径
    NSString *tempPath = [[NSBundle mainBundle]pathForResource:@"temp" ofType:@"html"];
    
    //加载temp内容为字符串
    NSString *tempHtml = [NSString stringWithContentsOfFile:tempPath encoding:NSUTF8StringEncoding error:nil];
    
    //替换temp内的占位符{{Content_holder}}为需要加载的HTML代码
    tempHtml = [tempHtml stringByReplacingOccurrencesOfString:@"{{Content_holder}}" withString:originalStr];
    
    //Temp目录下的js文件在根路径，因此需要在加载HTMLString时指定根路径
    NSString *basePath = [[NSBundle mainBundle] bundlePath];
    NSURL *baseURL = [NSURL fileURLWithPath:basePath];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
             [self.webView loadHTMLString:tempHtml baseURL:baseURL];
        });
    });
    self.webView.delegate = self;
    [self.view addSubview:self.webView];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    
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

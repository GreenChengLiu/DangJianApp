//
//  MicroInformationController.m
//  UnderlyingArchitecture
//
//  Created by liuPengCheng on 2019/7/15.
//  Copyright © 2019 liuPengCheng. All rights reserved.
//

#import "MicroInformationController.h"
#import <WebKit/WebKit.h>

@interface MicroInformationController ()<WKUIDelegate,WKNavigationDelegate>
@property (nonatomic, strong) WKWebView *webView;

@property (nonatomic, copy) NSString *url;
@end

@implementation MicroInformationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"定采微资讯";
    self.url = @"http://mp.weixin.qq.com/mp/homepage?__biz=MzA3MjUxMzg4Ng==&hid=1&sn=a8dd93016ce6b61ef80bc5a2c3ff941c#wechat_redirect";
    self.url = [_url stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    config.preferences = [[WKPreferences alloc] init];
    config.preferences.minimumFontSize = 10;
    config.preferences.javaScriptEnabled = YES;
    config.preferences.javaScriptCanOpenWindowsAutomatically = NO;
    NSMutableString *javascript = [NSMutableString string];
    [javascript appendString:@"document.documentElement.style.webkitUserSelect='none';"];//禁止选择
    [javascript appendString:@"document.documentElement.style.webkitTouchCallout='none';"];//禁止长按
    WKUserScript *noneSelectScript = [[WKUserScript alloc] initWithSource:javascript injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:YES];
    self.webView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.webView.configuration.userContentController addUserScript:noneSelectScript];
    self.webView.allowsBackForwardNavigationGestures = NO;
    self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, NavigationViewHeightContration, SCREENـWIDTH, SCREEN_HEIGHT) configuration:config];
    
    [self.view addSubview:self.webView];
    self.webView.UIDelegate = self;
    self.webView.navigationDelegate = self;
    
    [self.webView addObserver:self forKeyPath:@"estimatedProgress"options:NSKeyValueObservingOptionNew context:NULL];
    [self showWebViewWithUrl:_url];
}
/**
 展示web
 
 @param url <#url description#>
 */
-(void)showWebViewWithUrl:(id)url
{
    NSURL * link;
    if ([url isKindOfClass:[NSString class]])
    {
        link = [[NSURL alloc] initWithString:url];
    }else if ([url isKindOfClass:[NSURL class]])
    {
        link = url;
    }else
    {
#ifdef DEBUG
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"错误链接" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alert show];
        return;
#endif
        
    }
    NSURLRequest * request = [[NSURLRequest alloc] initWithURL:link];
    [self.webView loadRequest:request];
}
#pragma mark ====== << wkWebViewDelegate >> =====
//系统阻止了不安全的连接
- (WKWebView *)webView:(WKWebView *)webView createWebViewWithConfiguration:(WKWebViewConfiguration *)configuration forNavigationAction:(WKNavigationAction *)navigationAction windowFeatures:(WKWindowFeatures *)windowFeatures
{
    
    if (!navigationAction.targetFrame.isMainFrame)
    {
        [webView loadRequest:navigationAction.request];
    }
    
    return nil;
}
#pragma mark -- WKNavigationDelegate

// 页面开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation
{
    
}

// 当内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation
{
    
}

// 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
    
    
}

// 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation
{
    
}


// 接收到服务器跳转请求之后调用
- (void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(WKNavigation *)navigation {
    
}
//
// 在收到响应后，决定是否跳转
- (void)webView:(WKWebView *)webView decidePolicyForNavigationResponse:(WKNavigationResponse *)navigationResponse decisionHandler:(void (^)(WKNavigationResponsePolicy))decisionHandler
{
    decisionHandler(WKNavigationResponsePolicyAllow);
}

// 在发送请求之前，决定是否跳转
// 如果不添加这个，那么wkwebview跳转不了AppStore
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    
    decisionHandler(WKNavigationActionPolicyAllow);
    
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    
    if ([keyPath isEqualToString:@"estimatedProgress"]) {

        if (object ==self.webView) {

//            [self.progressView setAlpha:1.0f];
//
//            [self.progressView setProgress:self.webView.estimatedProgress animated:YES];


            if(self.webView.estimatedProgress >=1.0f) {

//                [UIView animateWithDuration:0.3 delay:0.3 options:UIViewAnimationOptionCurveEaseOut animations:^{

//                    [self.progressView setAlpha:0.0f];

//                } completion:^(BOOL finished) {

//                    [self.progressView setProgress:0.0f animated:NO];

//                }];
            }
        }

        else
        {

            [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        }
    }
}
//- (UIProgressView *)progressView
//{
//    if(!_progressView)
//    {
//        _progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 64 , screenWidth, 3)];
//        self.progressView.tintColor = COLOR_WITH_HEX(0xFF7326);
//        self.progressView.trackTintColor = [UIColor clearColor];
//        [self.view addSubview:_progressView];
//    }
//    return _progressView;
//}

// 取消进度条监听
- (void)dealloc
{
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
    [self.webView setNavigationDelegate:nil];
    [self.webView setUIDelegate:nil];
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

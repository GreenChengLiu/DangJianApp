//
//  DynamicVideoController.m
//  UnderlyingArchitecture
//
//  Created by mac on 2019/6/28.
//  Copyright © 2019 liuPengCheng. All rights reserved.
//

#import "DynamicVideoController.h"
#import <AVFoundation/AVFoundation.h>
#import "SPVideoPlayer.h"
#import "NSString+Size.h"
@interface DynamicVideoController () <SPVideoPlayerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *titleName;

@property (nonatomic, strong) UIView *playerFatherView;
@property (nonatomic, strong) SPVideoPlayerView *playerView;
@property (nonatomic, strong) SPVideoItem *videoItem;

@end

@implementation DynamicVideoController

- (UIView *)playerFatherView{
    if (!_playerFatherView) {
        self.playerFatherView = [[UIView alloc] init];
        self.playerFatherView.backgroundColor = [UIColor blackColor];
        CGSize size = [self.name stringSizeWithContentSize:CGSizeMake(SCREENـWIDTH - 30, MAXFLOAT) font:FONT(@"Helvetica-Bold", 24)];
        if (STATUS_BAR_FRAME > 20.0) {
            if (IS_IPHONE_X == YES) {
                self.playerFatherView.frame = CGRectMake(0, NavigationViewHeightContration + size.height + 50, SCREENـWIDTH, (SCREEN_HEIGHT * 98) / SCREENـWIDTH);
            } else {
                self.playerFatherView.frame = CGRectMake(0, NavigationViewHeightContration + size.height + 50, SCREENـWIDTH, (SCREEN_HEIGHT * 106) / SCREENـWIDTH);
            }
        } else {
            if (IS_IPHONE_PLUS == YES) {
                self.playerFatherView.frame = CGRectMake(0, NavigationViewHeightContration + size.height + 50, SCREENـWIDTH, (SCREEN_HEIGHT * 131) / SCREENـWIDTH);
            } else {
                self.playerFatherView.frame = CGRectMake(0, NavigationViewHeightContration + size.height + 50, SCREENـWIDTH, (SCREEN_HEIGHT * 118) / SCREENـWIDTH);
            }
        }
    }
    return _playerFatherView;
}
- (SPVideoItem *)videoItem{
    if (!_videoItem) {
        _videoItem = [[SPVideoItem alloc] init];
        _videoItem.title = @"视频标题";
        _videoItem.placeholderImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.imgurl]]];
        _videoItem.fatherView  = self.playerFatherView;
        NSString *videourl = [self.content subStringFrom:@"src=\"" to:@"da"];
        videourl = [videourl stringByReplacingOccurrencesOfString:@"\"" withString:@""];
        videourl = NSStringFormat(@"http://www.dbcycdjpt.com%@",videourl);
        NSLog(@"content:{%@} \n 剪切后:%@",self.content,videourl);
        self.videoItem.videoURL = [NSURL URLWithString:@"http://www.dbcycdjpt.com/public/uploads/ueditor/php/upload/video/20190625/1561467815286607.mp4"];
    }
    return _videoItem;
}
- (SPVideoPlayerView *)playerView{
    if (!_playerView) {
        _playerView = [[SPVideoPlayerView alloc] init];
        [_playerView configureControlView:nil videoItem:self.videoItem];
        _playerView.delegate = self;
        _playerView.hasDownload = YES;
        _playerView.requirePreviewView = YES;
    }
    return _playerView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = 8;
    NSAttributedString *strAtt = [[NSAttributedString alloc] initWithString:self.name attributes:@{NSForegroundColorAttributeName : [UIColor blackColor],NSFontAttributeName : FONT(@"Helvetica-Bold", 24),NSParagraphStyleAttributeName : style}];
    self.titleName.attributedText = strAtt;
    [self.view addSubview:self.playerFatherView];
    [self.playerView startPlay];
}

#pragma mark ======   添加播放页面   ======
- (void)addPlayerFatherViewUrl:(NSString *)url{
    //@"https://v2019.qudong.com/2bbb7d28733b4aa38c05227713374562/4433a0de4e32424c82134781f89d69f7-11c23b99eb0199a342b648c9a3865699-fd.mp4"
    
    
}

#pragma mark ====== << SPVideoPlayerDelegate >> =====
- (void)sp_playerBackAction{
    [self.navigationController popViewControllerAnimated:YES];
}


//支持哪些屏幕方向
- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskAll;
}
// 默认的屏幕方向（当前ViewController必须是通过模态出来的UIViewController（模态带导航的无效）方式展现出来的，才会调用这个方法）
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationPortrait;
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

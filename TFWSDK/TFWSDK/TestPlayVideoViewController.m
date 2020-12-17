//
//  TestPlayVideoViewController.m
//  Framework_ClassFiles
//
//  Created by Willian on 2019/9/26.
//  Copyright © 2019 Willian. All rights reserved.
//

#import "TestPlayVideoViewController.h"

#import <MediaPlayer/MediaPlayer.h>

#define kDeviceWidth  ([UIScreen mainScreen].bounds.size.width)

@interface TestPlayVideoViewController ()

@property(nonatomic, strong) MPMoviePlayerController *playerController;

@end

@implementation TestPlayVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //第二步：获取视频路径，创建播放器
    //本地视频路径
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"TFWSDK" ofType:@"bundle"];
    NSString *videoPath = [[NSBundle bundleWithPath:bundlePath] pathForResource:@"ts_board" ofType:@"mp4"];
    NSURL *localVideoUrl = [NSURL fileURLWithPath:videoPath];
    
    //网络视频路径
//    NSString *webVideoPath = @"http://api.junqingguanchashi.net/yunpan/bd/c.php?vid=/junqing/1115.mp4";
//    NSURL *webVideoUrl = [NSURL URLWithString:webVideoPath];
    
    self.playerController = [[MPMoviePlayerController alloc] initWithContentURL:localVideoUrl];
    
    
    //pod spec lint Framework_ClassFiles.podspec --verbose --use-libraries --allow-warnings --skip-import-validation
    //pod trunk push Framework_ClassFiles.podspec --verbose --use-libraries --allow-warnings --skip-import-validation

    
    //关于通知的使用(还有很多通知可以监听，可查看SDK)
    NSNotificationCenter *notificaionCenter = [NSNotificationCenter defaultCenter];
    //监听播放器状态的变化
    [notificaionCenter addObserver:self
                          selector:@selector(playerStateChanged:)
                              name:MPMoviePlayerPlaybackStateDidChangeNotification
                            object:nil];
    //监听播放完成
    [notificaionCenter addObserver:self
                          selector:@selector(playerFinished) name:MPMoviePlayerPlaybackDidFinishNotification
                            object:nil];
    //监听切换到全屏
    [notificaionCenter addObserver:self
                          selector:@selector(palyerChangeFullScreen) name:MPMoviePlayerDidEnterFullscreenNotification
                            object:nil];
    //监听截屏操作完成
    [notificaionCenter addObserver:self
                          selector:@selector(playerCaptureFinished:) name:MPMoviePlayerThumbnailImageRequestDidFinishNotification
                            object:nil];
    
    //第三步：设置Frame将播放器View添加到视图控制器View上
    self.playerController.view.frame = CGRectMake(0, 10, kDeviceWidth, 300);
    [self.view addSubview: self.playerController.view];
    
    
    //第四步：设置播放器属性
    //设置控制面板风格:无，嵌入，全屏，默认
    self.playerController.controlStyle = MPMovieControlStyleDefault;
    //设置是否自动播放(默认为YES）
    self.playerController.shouldAutoplay = YES;
    //设置播放器显示模式，类似于图片的处理，设置Fill有可能造成部分区域被裁剪
    self.playerController.scalingMode = MPMovieScalingModeAspectFit;
    //设置重复模式
    self.playerController.repeatMode = MPMovieRepeatModeOne;
    
    //第五步：播放视频
    //播放前的准备，会中断当前正在活跃的音频会话
    [self.playerController  prepareToPlay];
    
    //播放视频，设置了自动播放之后可以不调用此方法
    //[ self.playerController  play];
}

#pragma mark - 监听通知的响应方法
//播放状态变化，注意播放完成时的状态是暂停
- (void)playerStateChanged:(NSNotification *)notificaion{
    switch (self.playerController.playbackState) {
            case MPMoviePlaybackStateStopped:{
                NSLog(@"播放停止");
                break;
            }
            case MPMoviePlaybackStatePlaying:{
                NSLog(@"播放器正在播放");
                break;
            }
            case MPMoviePlaybackStatePaused:{
                NSLog(@"播放器暂停");
                break;
            }
            case MPMoviePlaybackStateInterrupted:{
                NSLog(@"播放器中断");
                break;
            }
            case MPMoviePlaybackStateSeekingForward:{
                NSLog(@"播放器快进");
                break;
            }
            case MPMoviePlaybackStateSeekingBackward:{
                NSLog(@"播放器快退");
                break;
            }
        default:
            break;
    }
}

//视频播放结束
- (void)playerFinished{
    NSLog(@"playerFinished：播放结束");
}

//播放器切换到了全屏
- (void)palyerChangeFullScreen{
    NSLog(@"palyerChangeFullScreen：播放器进入全屏");
}

//播放器截屏结束
- (void)playerCaptureFinished:(NSNotification *)notification{
    //获取并显示截图
    UIImage *image=notification.userInfo[MPMoviePlayerThumbnailImageKey];
    //self.captureImgView.image = image;
}

//第六步：在退出界面的时候，关闭播放器，移除通知
- (void)dealloc{
    //当前视图控制器pop之后并不会关闭播放，需要手动关闭
    [self.playerController stop];
    self.playerController = nil;
    
    //移除播放器相关的通知
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end

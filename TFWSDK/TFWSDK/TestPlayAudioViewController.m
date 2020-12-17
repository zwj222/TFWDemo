//
//  TestPlayAudioViewController.m
//  Framework_ClassFiles
//
//  Created by Willian on 2019/9/26.
//  Copyright © 2019 Willian. All rights reserved.
//

#import "TestPlayAudioViewController.h"

#import <AVFoundation/AVFoundation.h>

@interface TestPlayAudioViewController ()

@property (nonatomic, strong) AVAudioPlayer *audioPlayer;

@end

@implementation TestPlayAudioViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"TFWSDK" ofType:@"bundle"];
    // 1.加载本地的音乐文件
    NSURL *audioUrl = [[NSBundle bundleWithPath:bundlePath] URLForResource:@"music" withExtension:@"mp3"];
    // 2. 创建音乐播放对象
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:audioUrl error:nil];
    
    // 3.准备播放 (音乐播放的内存空间的开辟等功能)  不写这行代码直接播放也会默认调用prepareToPlay
    [self.audioPlayer prepareToPlay];
    
    [self.audioPlayer play];
}


@end

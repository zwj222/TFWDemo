//
//  ViewController.m
//  TFWDemo
//
//  Created by Willian on 2020/12/16.
//  Copyright © 2020 Willian. All rights reserved.
//

#import "ViewController.h"

#import <TFWSDK/TFWSDK.h>

#import <Masonry/Masonry.h>

@interface ViewController ()

@property (nonatomic, strong) TFWSDK_Dog *dog;
@property (nonatomic, strong) TestClassFilesClass *testClass;

@property (nonatomic, strong) UIView *centerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor cyanColor];
    
    self.testClass = [[TestClassFilesClass alloc] init];
    self.testClass.className = @"outerClassName";
    self.testClass.classdDesc = @"outerClassDesc";
    
    
    self.dog = [[TFWSDK_Dog alloc] init];
    
    self.centerView = [[UIView alloc] init];
    self.centerView.backgroundColor = [UIColor redColor];
    self.centerView.userInteractionEnabled = YES;
    [self.centerView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dealTap)]];
    [self.view addSubview:self.centerView];
    
    [self.centerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).offset(84);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    
    //调用一下方法
    [self.dog eat];
    //展示一下数据
    [self.testClass showDetailDesc];
    
    UIImageView *imageView1 = [TFWSDK_Image threeThousandWorld1];
    [self.view addSubview:imageView1];
    
    [imageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.centerView.mas_bottom).offset(20);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    
    UIImageView *imageView2 = [TFWSDK_Image threeThousandWorld2];
    imageView2.frame = CGRectMake(0, 600, 204, 204);
    [self.view addSubview:imageView2];
}

- (void)dealTap{
//    [self showPage1];

    [self showPage2];
}

- (void)showPage1{
    TestViewController *testVC = [[TestViewController alloc] init];
    [self.navigationController pushViewController:testVC animated:YES];
}

- (void)showPage2{
    //加载Framework包里的xib控制器
    TestXibViewController *vc = [[TestXibViewController alloc] initWithNibName:@"TestXibViewController" bundle:[NSBundle mainBundle]];
//    vc.view.backgroundColor = [UIColor orangeColor];
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)showPage3{
    TestPlayAudioViewController *vc1 = [[TestPlayAudioViewController alloc] init];
    vc1.view.backgroundColor = [UIColor cyanColor];
    [self presentViewController:vc1 animated:YES completion:nil];
}

- (void)showPage4{
    TestPlayVideoViewController *vc2 = [[TestPlayVideoViewController alloc] init];
    vc2.view.backgroundColor = [UIColor orangeColor];
    [self presentViewController:vc2 animated:YES completion:nil];
}




@end

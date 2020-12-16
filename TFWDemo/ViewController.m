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

@property (nonatomic, strong) UIView *centerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor cyanColor];
    
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
    
}

- (void)dealTap{
    //调用一下方法
    [self.dog eat];
    
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



@end

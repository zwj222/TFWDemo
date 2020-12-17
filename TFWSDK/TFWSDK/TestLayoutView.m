//
//  TestLayoutView.m
//  Framework_ClassFiles
//
//  Created by Willian on 2019/9/25.
//  Copyright © 2019 Willian. All rights reserved.
//

#import "TestLayoutView.h"

#import <Masonry/Masonry.h>

@interface TestLayoutView ()

@property (nonatomic, strong) UIView *view1;

@property (nonatomic, strong) UIView *view2;

@property (nonatomic, strong) UIImageView *imageView1;
@property (nonatomic, strong) UIImageView *imageView2;

@property (nonatomic, strong) UILabel *messageLab;

@end

@implementation TestLayoutView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpUi];
    }
    return self;
}

- (void)setUpUi
{
    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"TFWSDK" ofType:@"bundle"];
    
    self.view1 = [[UIView alloc] init];
    self.view1.backgroundColor = [UIColor orangeColor];
    [self addSubview:self.view1];
    
    __weak typeof (self) weakSelf = self;
    [self.view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(weakSelf);
        make.height.equalTo(weakSelf).multipliedBy(0.2);
    }];
    
    self.view2 = [[UIView alloc] init];
    self.view2.backgroundColor = [UIColor cyanColor];
    [self addSubview:self.view2];
    [self.view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view1.mas_bottom);
        make.left.right.equalTo(weakSelf);
        make.height.equalTo(weakSelf).multipliedBy(0.2);
    }];

    
    self.imageView1 = [[UIImageView alloc] init];
    NSString *image1Path = [[NSBundle bundleWithPath:bundlePath] pathForResource:@"love" ofType:@"jpg"];
    self.imageView1.image = [UIImage imageWithContentsOfFile:image1Path];
    [self addSubview:self.imageView1];
    [self.imageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.view2.mas_bottom);
        make.left.right.equalTo(weakSelf);
        make.height.equalTo(weakSelf).multipliedBy(0.2);
    }];
    
    
    
    self.imageView2 = [[UIImageView alloc] init];
    NSString *image2Path = [[NSBundle bundleWithPath:bundlePath] pathForResource:@"what" ofType:@"jpeg"];
    self.imageView2.image = [UIImage imageWithContentsOfFile:image2Path];
    [self addSubview:self.imageView2];
    [self.imageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.imageView1.mas_bottom);
        make.left.right.equalTo(weakSelf);
        make.height.equalTo(weakSelf).multipliedBy(0.2);
    }];
    
    
    
    //读取plist文件内容  //读取手动创建的plist文件的属性的值。
    NSString *plistFilePath = [[NSBundle bundleWithPath:bundlePath] pathForResource:@"RemakeFrameworkPlist" ofType:@"plist"];
    NSMutableDictionary *usersDic = [[NSMutableDictionary alloc] initWithContentsOfFile:plistFilePath];
    NSString *name = [usersDic valueForKey:@"name"];
    NSString *password = [usersDic valueForKey:@"password"];
    
    UILabel *plistShowLab = [[UILabel alloc] init];
    self.messageLab = plistShowLab;
    plistShowLab.textAlignment = NSTextAlignmentCenter;
    plistShowLab.text = [NSString stringWithFormat:@"%@---%@",name,password];
    [self addSubview:plistShowLab];
    [plistShowLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(weakSelf);
        make.height.equalTo(weakSelf).multipliedBy(0.2);
    }];
}

@end

//
//  TestViewController.m
//  Framework_ClassFiles
//
//  Created by Willian on 2019/9/25.
//  Copyright © 2019 Willian. All rights reserved.
//

#import "TestViewController.h"

#import <SVProgressHUD/SVProgressHUD.h>

#import "TestLayoutView.h"

@interface TestViewController ()

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    TestLayoutView *tmpView = [[TestLayoutView alloc] initWithFrame:CGRectMake(120, 120, 200, 200)];
    [self.view addSubview:tmpView];
    
    [SVProgressHUD showWithStatus:@"Loading"];
    [SVProgressHUD dismissWithDelay:1.5];
}


@end

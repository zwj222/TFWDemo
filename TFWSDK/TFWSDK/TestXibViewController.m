//
//  TestXibViewController.m
//  Framework_ClassFiles
//
//  Created by Willian on 2019/9/26.
//  Copyright © 2019 Willian. All rights reserved.
//

#import "TestXibViewController.h"

@interface TestXibViewController ()

@end

@implementation TestXibViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.view.backgroundColor = [UIColor redColor];
}



@end

//
//  TFWSDK_Image.m
//  TFWSDK
//
//  Created by Willian on 2020/12/16.
//  Copyright © 2020 Willian. All rights reserved.
//

#import "TFWSDK_Image.h"

@implementation TFWSDK_Image

+ (UIImageView *)threeThousandWorld1{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20, 414, 414)];
    imageView.image = [UIImage imageNamed:@"TFWSDK.bundle/5860d9cb6302d.jpg"];
    return imageView;
}

+ (UIImageView *)threeThousandWorld2{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 100, 414, 414)];
    NSBundle *bundle = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"TFWSDK" ofType:@"bundle"]];
    imageView.image = [UIImage imageWithContentsOfFile:[bundle pathForResource:@"5860d9cb6302d" ofType:@"jpg"]];
    return imageView;
}

@end

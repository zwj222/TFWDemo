//
//  TestClassFilesHideHearderClass.m
//  Framework_ClassFiles
//
//  Created by Willian on 2019/9/24.
//  Copyright © 2019 Willian. All rights reserved.
//

#import "TestClassFilesHideHearderClass.h"

@implementation TestClassFilesHideHearderClass

- (NSString *)detailDesc{
    return [NSString stringWithFormat:@"%@--%@",self.className,self.classdDesc];
}

- (void)showDetailDesc{
    NSLog(@"%@--%@",self.className,self.classdDesc);
}

@end

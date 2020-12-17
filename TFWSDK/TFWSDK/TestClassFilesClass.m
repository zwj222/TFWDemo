//
//  TestClassFilesClass.m
//  Framework_ClassFiles
//
//  Created by Willian on 2019/9/24.
//  Copyright © 2019 Willian. All rights reserved.
//

#import "TestClassFilesClass.h"

#import "TestClassFilesHideHearderClass.h"

@interface TestClassFilesClass ()

@property (nonatomic, strong) TestClassFilesHideHearderClass *innerClass;

@end

@implementation TestClassFilesClass

- (instancetype)init{
    self = [super init];
    if (self) {
        self.innerClass = [[TestClassFilesHideHearderClass alloc] init];
        self.innerClass.className = @"TestClassFilesHideHearderClassName";
        self.innerClass.classdDesc = @"TestClassFilesHideHearderClassDesc";
    }
    return self;
}

- (NSString *)detailDesc{
    return [NSString stringWithFormat:@"%@--%@ %@--%@",self.className,self.classdDesc,self.innerClass.className,self.innerClass.classdDesc];
}

- (void)showDetailDesc{
    
    NSLog(@"%@--%@ %@--%@",self.className,self.classdDesc,self.innerClass.className,self.innerClass.classdDesc);
}

@end

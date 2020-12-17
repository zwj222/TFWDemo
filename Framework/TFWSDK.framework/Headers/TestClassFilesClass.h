//
//  TestClassFilesClass.h
//  Framework_ClassFiles
//
//  Created by Willian on 2019/9/24.
//  Copyright © 2019 Willian. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TestClassFilesClass : NSObject

@property (nonatomic, copy) NSString *className;
@property (nonatomic, copy) NSString *classdDesc;

@property (nonatomic, copy) NSString *detailDesc;

- (void)showDetailDesc;

@end

NS_ASSUME_NONNULL_END

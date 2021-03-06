//
//  ZENConfiguration.h
//  wd
//
//  Created by Christoffer Winterkvist on 11/2/14.
//  Copyright (c) 2014 zenangst. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZENWarpDirectory.h"

@interface ZENConfiguration : NSObject <ZENWarpDirectoryDelegate>

@property (nonatomic, copy) NSString *path;

- (instancetype)initWithConfigurationPath:(NSString *)path;

@end

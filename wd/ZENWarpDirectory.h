//
//  WarpDirectory.h
//  wd
//
//  Created by Christoffer Winterkvist on 11/2/14.
//  Copyright (c) 2014 zenangst. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZENWarpDirectory : NSObject

- (void)add:(NSString *)string;
- (void)remove:(NSString *)string;
- (void)list;
- (void)clean;
- (void)version;
- (void)config;

@end
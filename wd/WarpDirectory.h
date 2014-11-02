//
//  WarpDirectory.h
//  wd
//
//  Created by Christoffer Winterkvist on 11/2/14.
//  Copyright (c) 2014 zenangst. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WarpDirectory : NSObject

- (void)add:(NSString *)string;
- (void)remove:(NSString *)string;
- (void)list;

@end

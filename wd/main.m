//
//  main.m
//  wd
//
//  Created by Christoffer Winterkvist on 11/2/14.
//  Copyright (c) 2014 zenangst. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZENWarpDirectoryApplication.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *arguments = [[NSProcessInfo processInfo] arguments];
        ZENWarpDirectoryApplication *application;
        application = [ZENWarpDirectoryApplication new];
        [application processArguments:arguments];
    }
    return 0;
}

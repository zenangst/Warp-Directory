//
//  ZENArgumentsHandler.m
//  wd
//
//  Created by Christoffer Winterkvist on 11/2/14.
//  Copyright (c) 2014 zenangst. All rights reserved.
//

#import "ZENWarpDirectoryApplication.h"
#import "ZENWarpDirectory.h"

@interface ZENWarpDirectoryApplication ()
@property (nonatomic, retain) ZENWarpDirectory *warpDirectory;
@end

@implementation ZENWarpDirectoryApplication

- (instancetype)initWithArguments:(NSArray *)arguments
{
    self = [super init];
    if (!self) return nil;

    [self processArguments:arguments];

    return self;
}

- (void)processArguments:(NSArray *)arguments
{
    if (arguments.count < 1) return;

    IMP implementation;

    SEL simpleSelector = NSSelectorFromString(arguments[1]);
    if ([self.warpDirectory respondsToSelector:simpleSelector]) {
        implementation = [self.warpDirectory methodForSelector:simpleSelector];
        void (*func)(id, SEL) = (void *)implementation;
        func(self.warpDirectory, simpleSelector);
        return;
    }

    NSString *alternateSelector = [NSString stringWithFormat:@"%@:", arguments[1]];
    SEL selectorWithArgument = NSSelectorFromString(alternateSelector);
    if ([self.warpDirectory respondsToSelector:selectorWithArgument]) {
        implementation = [self.warpDirectory methodForSelector:selectorWithArgument];
        void (*func)(id, SEL, NSString *) = (void *)implementation;
        func(self.warpDirectory, selectorWithArgument, arguments[2]);
    }
}

- (ZENWarpDirectory *)warpDirectory
{
    _warpDirectory = (_warpDirectory) ?: [ZENWarpDirectory new];

    return _warpDirectory;
}

@end

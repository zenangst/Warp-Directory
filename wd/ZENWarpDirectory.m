//
//  WarpDirectory.m
//  wd
//
//  Created by Christoffer Winterkvist on 11/2/14.
//  Copyright (c) 2014 zenangst. All rights reserved.
//

#import "ZENWarpDirectory.h"

@interface ZENWarpDirectory ()

@property (nonatomic, strong) NSString *workingDirectory;
@property (nonatomic, strong) NSString *homeDirectory;

@end

@implementation ZENWarpDirectory

- (instancetype)init
{
    self = [super init];
    if (!self) return nil;

    NSDictionary *environmentals = [[NSProcessInfo processInfo] environment];
    self.workingDirectory = (environmentals[@"PWD"])  ?: nil;
    self.homeDirectory    = (environmentals[@"HOME"]) ?: nil;

    return self;
}

- (void)add:(NSString *)string
{
    if ([self.delegate respondsToSelector:@selector(didAddPath:withName:)]) {
        [self.delegate didAddPath:self.workingDirectory withName:string];
    }
}

- (void)remove:(NSString *)string
{
    if ([self.delegate respondsToSelector:@selector(didRemovePath:withName:)]) {
        [self.delegate didRemovePath:self.workingDirectory withName:string];
    }
}

- (void)list
{

}

- (void)clean
{

}

- (void)version
{

}

- (void)config
{

}

@end

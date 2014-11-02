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
    NSLog(@"%@:%@", string, self.workingDirectory);

    if ([self.delegate respondsToSelector:@selector(didAddPath:withName:)]) {
        [self.delegate didAddPath:string withName:self.workingDirectory];
    }
}

- (void)remove:(NSString *)string
{
    NSLog(@"%@:%@", string, self.workingDirectory);

    if ([self.delegate respondsToSelector:@selector(didRemovePath:withName:)]) {
        [self.delegate didRemovePath:string withName:self.workingDirectory];
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

//
//  wd_tests.m
//  wd-tests
//
//  Created by Christoffer Winterkvist on 11/2/14.
//  Copyright (c) 2014 zenangst. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <XCTest/XCTest.h>
#import "ZENWarpDirectoryApplication.h"

@interface wd_tests : XCTestCase

@property (nonatomic, strong) ZENWarpDirectoryApplication *application;

@end

@implementation wd_tests

- (void)setUp {
    [super setUp];
    self.application = [ZENWarpDirectoryApplication new];
}

- (void)tearDown {

    [super tearDown];
}

@end

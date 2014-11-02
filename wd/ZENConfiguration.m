//
//  ZENConfiguration.m
//  wd
//
//  Created by Christoffer Winterkvist on 11/2/14.
//  Copyright (c) 2014 zenangst. All rights reserved.
//

#import "ZENConfiguration.h"

@interface ZENConfiguration ()

@property (nonatomic, strong) NSMutableDictionary *directories;

@end

@implementation ZENConfiguration

- (instancetype)initWithConfigurationPath:(NSString *)path
{
    self = [self init];
    if (!self) return nil;

    [self parseRuntimeConfiguration:path];

    return self;
}

- (void)parseRuntimeConfiguration:(NSString *)path
{
    if (![[NSFileManager defaultManager] fileExistsAtPath:path]) return;

    NSError *error = nil;
    NSString *contents = [[NSString alloc] initWithContentsOfFile:path
                                                         encoding:NSUTF8StringEncoding
                                                            error:&error];

    if (error) {
        NSLog(@"error: %@", [error localizedDescription]);
        return;
    }

    NSArray *lines = [contents componentsSeparatedByString:@"\n"];
    NSString *name;
    NSString *directory;
    NSMutableDictionary *directories = [NSMutableDictionary new];

    for (NSString *line in lines) {
        NSArray *parts = [line componentsSeparatedByString:@":"];
        if (parts.count < 2) continue;

        name = parts.firstObject;
        directory = parts.lastObject;

        [directories setObject:directory forKey:name];
    }

    self.directories = directories;
}

- (void)setPath:(NSString *)path
{
    _path = path;
    [self parseRuntimeConfiguration:path];
}

- (void)save
{
    NSMutableString *configurationString = [NSMutableString new];
    NSArray *keys = [self.directories allKeys];
    NSString *entry;
    NSString *path;

    for (NSString *key in keys) {
        path = self.directories[key];
        if (!path) continue;

        entry = [NSString stringWithFormat:@"%@:%@\n", key, path];
        [configurationString appendString:entry];
    }

    NSError *error = nil;
    [configurationString writeToFile:self.path
                          atomically:YES
                            encoding:NSUTF8StringEncoding
                               error:&error];

    if (error) {
        NSLog(@"%@", [error localizedDescription]);
    }

}

- (void)didAddPath:(NSString *)path withName:(NSString *)name
{
    [self.directories setObject:path forKey:name];
    [self save];
}

- (void)didRemovePath:(NSString *)path withName:(NSString *)name
{
    [self.directories removeObjectForKey:name];
    [self save];
}

@end

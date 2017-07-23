//
//  NSMutableArray+WRCrashProject.m
//  WRCrashProjectTest
//
//  Created by wangrui on 2017/7/22.
//  Copyright © 2017年 wangrui. All rights reserved.
//

#import "NSObject+WRCrashProject.h"

@implementation NSMutableArray (WRCrashProject)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzle];
    });
}

+ (void)swizzle
{
    [self swizzleSEL:@selector(objectAtIndex:)];
}

- (id)wr_objectAtIndex:(NSUInteger)index
{
    if (index < self.count) {
        return [self wr_objectAtIndex:index];
    }
    else {
        NSLog(@"NSMutableArray: 数组越界了");
        return nil;
    }
}

@end

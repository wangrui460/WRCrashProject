//
//  NSArray+WRCrashProject.m
//  WRCrashProjectTest
//
//  Created by wangrui on 2017/7/22.
//  Copyright © 2017年 wangrui. All rights reserved.
//

#import "NSObject+WRCrashProject.h"
#import <objc/runtime.h>

@implementation NSArray (WRCrashProject)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzle];
    });
}

+ (void)swizzle
{
    [objc_getClass("__NSArray0") swizzleSEL:@selector(objectAtIndex:) withSEL:@selector(__NSArray0_objectAtIndex:)];
    [objc_getClass("__NSArrayI") swizzleSEL:@selector(objectAtIndex:) withSEL:@selector(__NSArrayI_objectAtIndex:)];
    [objc_getClass("__NSArrayM") swizzleSEL:@selector(objectAtIndex:) withSEL:@selector(__NSArrayM_objectAtIndex:)];
}

- (id)__NSArray0_objectAtIndex:(NSUInteger)index
{
    WRCrashProjectLog(@"数组为空");
    return nil;
}

- (id)__NSArrayI_objectAtIndex:(NSUInteger)index
{
    if (index < self.count) {
        return [self __NSArrayI_objectAtIndex:index];
    }
    else {
        WRCrashProjectLog(@"数组越界了");
        return nil;
    }
}

- (id)__NSArrayM_objectAtIndex:(NSUInteger)index
{
    if (index < self.count) {
        return [self __NSArrayM_objectAtIndex:index];
    }
    else {
        WRCrashProjectLog(@"数组越界了");
        return nil;
    }
}

@end

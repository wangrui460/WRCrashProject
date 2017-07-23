//
//  NSArray+WRCrashProject.m
//  WRCrashProjectTest
//
//  Created by wangrui on 2017/7/22.
//  Copyright © 2017年 wangrui. All rights reserved.
//

#import "NSArray+WRCrashProject.h"
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
//    id object = [self new];
//    [object swizzleSystemMethodWithSel:@selector(objectAtIndex:)];
    
    
    [objc_getClass("__NSArrayI") swizzleSystemMethodWithSel:@selector(objectAtIndex:) to:@selector(wr_objectAtIndex:)];
    [objc_getClass("__NSArrayM") swizzleSystemMethodWithSel:@selector(objectAtIndex:) to:@selector(wr2_objectAtIndex:)];
    
    
//    [objc_getClass("__NSArrayI") swizzleMethod:@selector(objectAtIndex:) withMethod:@selector(swizzleObjectAtIndexI:) error:nil];//交换不可变数组
//    [objc_getClass("__NSArrayM") swizzleMethod:@selector(objectAtIndex:) withMethod:@selector(swizzleObjectAtIndexM:) error:nil];//交换不可变数组
}

- (id)wr_objectAtIndex:(NSUInteger)index
{
    if (index < self.count) {
        return [self wr_objectAtIndex:index];
    }
    else {
        NSLog(@"数组越界了");
        return nil;
    }
}

- (id)wr2_objectAtIndex:(NSUInteger)index
{
    if (index < self.count) {
        return [self wr2_objectAtIndex:index];
    }
    else {
        NSLog(@"数组越界了");
        return nil;
    }
}

@end

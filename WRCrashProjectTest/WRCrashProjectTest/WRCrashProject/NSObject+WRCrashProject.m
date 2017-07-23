//
//  NSObject+WRCrashProject.m
//  WRCrashProjectTest
//
//  Created by wangrui on 2017/7/22.
//  Copyright © 2017年 wangrui. All rights reserved.
//

#import "NSObject+WRCrashProject.h"
#import <objc/runtime.h>

@implementation NSObject (WRCrashProject)

+ (void)swizzleSystemMethodWithSel:(SEL)systemSelector
{
//    Class needSwizzledClass = [self class];
    NSString *systemSELStr = NSStringFromSelector(systemSelector);
    NSString *safeSELStr = [NSString stringWithFormat:@"wr_%@",systemSELStr];
    SEL safeSelector = NSSelectorFromString(safeSELStr);
    Method systemMethod = class_getInstanceMethod(self, systemSelector);
    Method safeMethod = class_getInstanceMethod(self, safeSelector);
    method_exchangeImplementations(systemMethod, safeMethod);
}

+ (void)swizzleSystemMethodWithSel:(SEL)systemSelector to:(SEL)safeSelector
{
    Method systemMethod = class_getInstanceMethod(self, systemSelector);
    Method safeMethod = class_getInstanceMethod(self, safeSelector);
    method_exchangeImplementations(systemMethod, safeMethod);
}

@end

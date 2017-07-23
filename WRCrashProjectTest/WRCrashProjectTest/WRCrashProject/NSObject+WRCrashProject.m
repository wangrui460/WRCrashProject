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

+ (void)swizzleSEL:(SEL)systemSEL
{
    NSString *systemSELStr = NSStringFromSelector(systemSEL);
    NSString *swizzledSELStr = [NSString stringWithFormat:@"wr_%@",systemSELStr];
    
    SEL swizzledSel = NSSelectorFromString(swizzledSELStr);
    [self swizzleSEL:systemSEL withSEL:swizzledSel];
}

+ (void)swizzleSEL:(SEL)originalSEL withSEL:(SEL)swizzledSEL
{
    Class class = [self class];
    
    // class_getInstanceMethod: 获取给定类的实例方法
    Method originalMethod = class_getInstanceMethod(class, originalSEL);
    Method newMethod = class_getInstanceMethod(class, swizzledSEL);
    
    // class_addMethod: 为给定类添加一个方法
    // class_getTypeEncoding: 获取方法的参数和返回值
    BOOL didAddMethod = class_addMethod(class,  //  为该类添加方法
                                        originalSEL, //    要添加方法的方法名
                                        method_getImplementation(newMethod), // 要添加方法的方法实现
                                        method_getTypeEncoding(newMethod));  // 要添加方法的参数和返回值
    
    if (didAddMethod) {
        // 替换给定类的给定方法的实现
        class_replaceMethod(class,
                            swizzledSEL,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, newMethod);
    }
}

@end

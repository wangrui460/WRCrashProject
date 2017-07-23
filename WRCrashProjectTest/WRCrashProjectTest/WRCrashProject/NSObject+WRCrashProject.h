//
//  NSObject+WRCrashProject.h
//  WRCrashProjectTest
//
//  Created by wangrui on 2017/7/22.
//  Copyright © 2017年 wangrui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (WRCrashProject)

+ (void)swizzleSystemMethodWithSel:(SEL)systemSelector;

+ (void)swizzleSystemMethodWithSel:(SEL)systemSelector to:(SEL)safeSelector;

@end

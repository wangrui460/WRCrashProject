//
//  NSObject+WRCrashProject.h
//  WRCrashProjectTest
//
//  Created by wangrui on 2017/7/22.
//  Copyright © 2017年 wangrui. All rights reserved.
//

#import <Foundation/Foundation.h>

#warning 如何切换debug和release状态: product -> Scheme -> Edit Scheme... -> info -> Buide Configuration

// if (DEBUG && WRCrashProjectDebugMode == 1) NSAssert
// if (release || WRCrashProjectDebugMode == 0) safe protect
#define WRCrashProjectDebugMode 1

#ifdef DEBUG
// 当 DEBUG 且 WRCrashProjectDebugMode为 1 的时候，数组越界等则断言失败，程序崩溃，方便找到错误原因
    #define WRCrashProjectLog(exception)    \
            WRAssert(exception);                                                      \

#else
// 当 release 或者 WRCrashProjectDebugMode为 0 的时候，数组越界等会做安全保护，并且不会断言失败，保证程序正常运行
    #define WRCrashProjectLog(exception)    \
            WRAssert(exception);                                                      \

#endif

#define WRAssert(exception) NSAssert(WRCrashProjectDebugMode == 0, exception);



@interface NSObject (WRCrashProject)

/** 交换系统方法 */
+ (void)swizzleSEL:(SEL)systemSEL;

/** 交换指定的两个方法 */
+ (void)swizzleSEL:(SEL)originalSEL withSEL:(SEL)swizzledSEL;

@end

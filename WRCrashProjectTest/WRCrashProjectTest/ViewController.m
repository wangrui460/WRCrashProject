//
//  ViewController.m
//  WRCrashProjectTest
//
//  Created by wangrui on 2017/7/22.
//  Copyright © 2017年 wangrui. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *arrM = @[@"1",@"2",@"3"];
//    NSMutableArray *arrM = [NSMutableArray arrayWithObjects:@"0",@"1", nil];
    NSString *str = [arrM objectAtIndex:3];
    NSLog(@"%@", str);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

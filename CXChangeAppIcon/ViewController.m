//
//  ViewController.m
//  CXChangeAppIcon
//
//  Created by 陈晓辉 on 2018/10/8.
//  Copyright © 2018年 陈晓辉. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

/** icon 数组 */
@property (nonatomic, copy) NSArray<NSString *> *weathers;

@end

@implementation ViewController

#pragma mark ---------- 更换图标功能（API）当前只支持iOS10.3以上的系统 ----------
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //https://www.jianshu.com/p/dd5144f8f021
    self.weathers = @[@"晴", @"多云", @"小雨", @"大雨", @"雪", @""];
}

- (IBAction)changeAppIcon:(id)sender {
    
    NSString *weather = self.weathers[arc4random() % self.weathers.count];
    [self setAppIconWithName:weather];
}

- (void)setAppIconWithName:(NSString *)iconName {
    
    //是否支持更换 icon
    if (![[UIApplication sharedApplication] supportsAlternateIcons]) {
        return;
    }
    
    if ([iconName isEqualToString:@""]) {
        iconName = nil;
    }
    
    //iconName = nil 时, 使用主图标
    [[UIApplication sharedApplication] setAlternateIconName:iconName completionHandler:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"更换app图标发生错误了 ： %@",error);
        }
    }];
}

@end

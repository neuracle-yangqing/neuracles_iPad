//
//  YQLoginViewController.m
//  neuracles_iPad
//
//  Created by neuracle on 16/1/18.
//  Copyright © 2016年 neuracle. All rights reserved.
//

#import "YQLoginViewController.h"
#import "HMTabBarController.h"
#import "YQViewController.h"
#define myFrame [UIScreen mainScreen].bounds

@interface YQLoginViewController ()
@property(nonatomic,strong)HMTabBarController * homeVC;

@end

@implementation YQLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"医院登录系统";

    
}
/**
 *  点击登录按钮弹出控制器
 */
- (IBAction)clickCenterButtton:(id)sender {
    //创建进入下一home控制器
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    HMTabBarController * homeVC = [[HMTabBarController alloc]init];
    self.homeVC = homeVC;
    window.rootViewController = homeVC;
    
}


-(void)dealloc{
    NSLog(@"登录 挂了吗??");
}
@end

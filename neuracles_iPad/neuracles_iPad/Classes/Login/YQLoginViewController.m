//
//  YQLoginViewController.m
//  neuracles_iPad
//
//  Created by neuracle on 16/1/18.
//  Copyright © 2016年 neuracle. All rights reserved.
//

#import "YQLoginViewController.h"
#import "YQViewController.h"

@interface YQLoginViewController ()
@property(nonatomic,strong)YQViewController * homeVC;
@end

@implementation YQLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
/**
 *  点击登录按钮弹出控制器
 */
- (IBAction)saveButton {
    //创建导航控制器的根控制器
    YQViewController * home = [[YQViewController alloc]init];
    home.view.frame = [UIScreen mainScreen].bounds ;
    home.view.backgroundColor = [UIColor greenColor];

    //创建导航控制器
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:home];
    nav.view.backgroundColor = [UIColor yellowColor];
    
    //根据aboard 的 window 来添加一个nav 的控制器
     self.view.window.rootViewController = nav ;
    [self.navigationController pushViewController:nav animated:YES];
}

@end

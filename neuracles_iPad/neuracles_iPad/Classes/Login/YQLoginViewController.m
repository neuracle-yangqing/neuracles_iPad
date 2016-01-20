//
//  YQLoginViewController.m
//  neuracles_iPad
//
//  Created by neuracle on 16/1/18.
//  Copyright © 2016年 neuracle. All rights reserved.
//

#import "YQLoginViewController.h"
#import "YQViewController.h"

#define myFrame [UIScreen mainScreen].bounds

@interface YQLoginViewController ()
@property(nonatomic,strong)YQViewController * homeVC;
@end

@implementation YQLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"医院登录系统";

    
}
/**
 *  点击登录按钮弹出控制器
 */
- (IBAction)saveButton {
    //创建进入下一home控制器
    
    YQViewController * homeVC = [[YQViewController alloc]init];
    homeVC.view.backgroundColor = [UIColor whiteColor
                                   ];
    
    [self.navigationController pushViewController:homeVC animated:YES];
}


-(void)dealloc{
    NSLog(@"登录 挂了吗??");
}
@end

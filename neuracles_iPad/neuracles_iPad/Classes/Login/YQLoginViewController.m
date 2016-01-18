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
    self.homeVC = [[YQViewController alloc]init];
    self.homeVC.view.frame = self.view.bounds;
    self.homeVC.view.backgroundColor = [UIColor greenColor];
    [self.view.window addSubview:self.homeVC.view];
}
-(void)dealloc{
    [self.view removeFromSuperview];
}
@end

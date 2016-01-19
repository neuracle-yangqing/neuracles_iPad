//
//  YQViewController.m
//  neuracles_iPad
//
//  Created by neuracle on 16/1/18.
//  Copyright © 2016年 neuracle. All rights reserved.
//

#import "YQViewController.h"
#import "YQTarViewController.h"
#import "YQrightViewController.h"
#import "YQLeftViewController.h"
#import "YQrightViewController.h"
#import "YQCenterViewController.h"

#define MAS_SHORTHAND

// 自动装箱:自动把基本数据类型转化成对象,int => NSNumber
#define MAS_SHORTHAND_GLOBALS

#import "Masonry.h"

#define TarVHeight 64
#define leftVCHeight 100
#define rightVCHeight 200
#define navBar 64
#define iPadAriwidth 1536
#define iPadAriHeight 2048
@interface YQViewController ()

@end

@implementation YQViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.初始化主控制器,设置标题和按钮
    //注意的是:item 他是一个模块,是属于我们的nav 的 但是,nav他又是属于我们的view的
    //要调用navigationItem 就必须要求的调用一个模块!
    self.title = @"Monitor";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"添加" style:UIBarButtonItemStyleDone target:self action:@selector(addNew)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"页面列表" style:UIBarButtonItemStyleDone target:self action:@selector(PageList)];
    
    //2.添加我们的子控制器
    [self setUpChildVC];
    
    //根据现在的屏幕的尺寸来设置和改变我们的chlidVC的变化的值;
    [self viewWillTransitionToSize:[UIScreen mainScreen].bounds.size  withTransitionCoordinator:nil];
    
    //3.适配和正确的布局我们的子控制器
    [self setUpChildLayout];
    
}

#pragma mark - 监听屏幕旋转 (new)
-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    //1.添加一个定时器(记录和监听屏幕的旋转的时间)
    NSTimeInterval duration = [coordinator transitionDuration];
    //2.执行动画来监听改变
    [UIView animateWithDuration:duration animations:^{
        CGRect frame = self.view.frame;
        frame.size.height = size.height;
        if (size.width > iPadAriwidth) { // 横屏
            frame.size.width = 270;
        } else { // 竖屏
            frame.size.width = 90;
        }
    }];
    
    
}

#pragma mark - 增加和翻页的接口
/**
 *  新增功能接口
 */
-(void)addNew{
    NSLog(@"newAdd");
}

/**
 *  页面的展示的接口
 */
-(void)PageList{
    NSLog(@"Page List");
}
#pragma mark - 内部控制器和view的添加
/**
 *  添加各种的子控制器
 */
-(void)setUpChildVC{
    //YQ-TarVC
    YQTarViewController * TarVC = [[YQTarViewController alloc]init];
    TarVC.view.backgroundColor = [UIColor colorWithRed:((arc4random_uniform(256)/255.0)) green:(arc4random_uniform(256)/255.0) blue:(arc4random_uniform(256)/255.0) alpha:1.0];
    [self addChildViewController:TarVC];
    //YQ-leftVC
    YQLeftViewController * leftVC = [[YQLeftViewController alloc]init];
    leftVC.view.backgroundColor = [UIColor colorWithRed:((arc4random_uniform(256)/255.0)) green:(arc4random_uniform(256)/255.0) blue:(arc4random_uniform(256)/255.0) alpha:1.0];
    [self addChildViewController:leftVC];
    //YQ-rightVC
    YQrightViewController * rightVC = [[YQrightViewController alloc]init];
    rightVC.view.backgroundColor = [UIColor colorWithRed:((arc4random_uniform(256)/255.0)) green:(arc4random_uniform(256)/255.0) blue:(arc4random_uniform(256)/255.0) alpha:1.0];
    [self addChildViewController:rightVC];
    //YQ-centerVC
    YQCenterViewController * centerVC = [[YQCenterViewController alloc]init];
    centerVC.view.backgroundColor = [UIColor colorWithRed:((arc4random_uniform(256)/255.0)) green:(arc4random_uniform(256)/255.0) blue:(arc4random_uniform(256)/255.0) alpha:1.0];
    [self addChildViewController:centerVC];
}

/**
 *  设置各种子控制器的布局
 */
-(void)setUpChildLayout{
    //应用msonry的框架来实现
    //1.yq_TarV
    UIView * TarV = self.childViewControllers[0].view;
    [self.view addSubview:TarV];
    [TarV makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(self.view);
        make.height.equalTo(TarVHeight);
    }];
    //2.yq_leftVC
    UIView * leftVC = self.childViewControllers[1].view;
    [self.view addSubview:leftVC];
    [leftVC makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.top.equalTo(self.view).offset(navBar);
        make.bottom.equalTo(TarV.top);
        make.width.equalTo(leftVCHeight);
    }];
    //3.yq_rightVC
    UIView * rightVC = self.childViewControllers[2].view;
    [self.view addSubview:rightVC];
    [rightVC makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view);
        make.bottom.equalTo(TarV.top);
        make.top.equalTo(self.view).offset(navBar);
        make.width.equalTo(rightVCHeight);
    }];
    
    //4.yq_centerVC
    UIView * centerVC = self.childViewControllers[3].view;
    [self.view addSubview:centerVC];
    [centerVC makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(navBar);
        make.bottom.equalTo(TarV.top);
        make.left.equalTo(leftVC.right);
        make.right.equalTo(rightVC.left);
    }];
    
}
@end

//
//  YQViewController.m
//  neuracles_iPad
//
//  Created by neuracle on 16/1/18.
//  Copyright © 2016年 neuracle. All rights reserved.
//

#define MAS_SHORTHAND
// 自动装箱:自动把基本数据类型转化成对象,int => NSNumber
#define MAS_SHORTHAND_GLOBALS
#import "Masonry.h"

#import "YQconstTOOLs.h"
#import "YQViewController.h"
#import "YQTarViewController.h"
#import "YQrightViewController.h"
#import "YQLeftViewController.h"
#import "YQrightViewController.h"
#import "YQCenterViewController.h"
#import "YQchlidView.h"

#define myFrame [UIScreen mainScreen].bounds

@interface YQViewController ()
//底部的视图
@property(nonatomic, strong)YQchlidView * TarView;
//左边的视图
@property(nonatomic, strong)YQchlidView * leftView;
//右边的视图
@property(nonatomic, strong)YQchlidView * rightView;
//中间视图
@property(nonatomic, strong)YQchlidView * centerView;
@end

@implementation YQViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.初始化主控制器,设置标题和按钮
    self.title = @"Monitor";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"添加" style:UIBarButtonItemStyleDone target:self action:@selector(addNew)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"页面列表" style:UIBarButtonItemStyleDone target:self action:@selector(PageList)];

    //2.创建加载子控制(一共有4个)
    [self setUpChildVC];
    
    //3.方便自动的布局
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    self.TarView.translatesAutoresizingMaskIntoConstraints = NO;

    //3.根据现在的frame 的值来设置TarView的frame
    [self viewWillTransitionToSize:myFrame.size withTransitionCoordinator:nil];

}


#pragma mark - 监听屏幕旋转 (new)
-(void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    self.TarView.clipsToBounds = YES;
    //1.添加一个定时器(记录和监听屏幕的旋转的时间)
    NSTimeInterval duration = [coordinator transitionDuration];
    //2.执行动画来监听屏幕的frame的改变
    [UIView animateWithDuration:duration animations:^{
        //TarView的屏幕适配
        CGRect tarFrame = self.TarView.frame;
        CGRect newFrame1 =[self setUpTarVCLayout:tarFrame andCGSize:size];
        self.TarView.frame = newFrame1;
        //rightView的屏幕适配
        CGRect rightFrame = self.rightView.frame;
        CGRect newFrame2 =[self setUpRightVCLayout:rightFrame AndCGRect:size];
        self.rightView.frame = newFrame2;
        //leftView的屏幕的适配
        CGRect leftFrame = self.leftView.frame;
        CGRect newFrame3 = [self setUpLeftVCLayout:leftFrame AndCGRect:size];
        self.leftView.frame = newFrame3;
        //center的屏幕适配
        CGRect centerFrame = self.centerView.frame;
        centerFrame = CGRectMake(self.leftView.frame.size.width, navBar, self.rightView.frame.origin.x - self.leftView.frame.size.width, self.leftView.frame.size.height);
        self.centerView.frame = centerFrame;
    }];
    
}


#pragma mark - 内部控制器和view的添加
/**
 *  添加各种的子控制器
 */
-(void)setUpChildVC{
    YQchlidView * TarView = [[YQchlidView alloc]init];
    TarView.backgroundColor = [UIColor colorWithRed:((arc4random_uniform(256)/255.0)) green:(arc4random_uniform(256)/255.0) blue:(arc4random_uniform(256)/255.0) alpha:1.0];
    [self.view addSubview:TarView];
    self.TarView = TarView;
    
    YQchlidView * leftView = [[YQchlidView alloc]init];
    leftView.backgroundColor = [UIColor colorWithRed:((arc4random_uniform(256)/255.0)) green:(arc4random_uniform(256)/255.0) blue:(arc4random_uniform(256)/255.0) alpha:1.0];
    [self.view addSubview:leftView];
    self.leftView = leftView;
    
    YQchlidView * rightView = [[YQchlidView alloc]init];
    rightView.backgroundColor = [UIColor colorWithRed:((arc4random_uniform(256)/255.0)) green:(arc4random_uniform(256)/255.0) blue:(arc4random_uniform(256)/255.0) alpha:1.0];
    self.rightView = rightView;
    [self.view addSubview:rightView];
    
    YQchlidView * centerView = [[YQchlidView alloc]init];
    centerView.backgroundColor = [UIColor colorWithRed:((arc4random_uniform(256)/255.0)) green:(arc4random_uniform(256)/255.0) blue:(arc4random_uniform(256)/255.0) alpha:1.0];
    
    self.centerView = centerView;
    [self.view addSubview:centerView];
    //YQ-TarVC
//    YQTarViewController * TarVC = [[YQTarViewController alloc]init];
//    TarVC.view.backgroundColor = [UIColor purpleColor];
   // TarVC.view.frame = CGRectMake(0, 0, 500, 100);
//    self.TarView = TarVC.view;
//    [self addChildViewController:TarVC];
//    [self.view addSubview:TarVC.view];
//    //YQ-leftVC
//    YQLeftViewController * leftVC = [[YQLeftViewController alloc]init];
//    leftVC.view.backgroundColor = [UIColor colorWithRed:((arc4random_uniform(256)/255.0)) green:(arc4random_uniform(256)/255.0) blue:(arc4random_uniform(256)/255.0) alpha:1.0];
//    [self addChildViewController:leftVC];
//    //YQ-rightVC
//    YQrightViewController * rightVC = [[YQrightViewController alloc]init];
//    rightVC.view.backgroundColor = [UIColor colorWithRed:((arc4random_uniform(256)/255.0)) green:(arc4random_uniform(256)/255.0) blue:(arc4random_uniform(256)/255.0) alpha:1.0];
//    [self addChildViewController:rightVC];
//    //YQ-centerVC
//    YQCenterViewController * centerVC = [[YQCenterViewController alloc]init];
//    centerVC.view.backgroundColor = [UIColor colorWithRed:((arc4random_uniform(256)/255.0)) green:(arc4random_uniform(256)/255.0) blue:(arc4random_uniform(256)/255.0) alpha:1.0];
//    [self addChildViewController:centerVC];
}

#pragma mark - 设置的是各种的控件的布局
//设置的是tarVC的布局
-(CGRect)setUpTarVCLayout:(CGRect)frame andCGSize:(CGSize)size{
    if (size.width > iPadAriwidth||size.height > iPadAriHeight) { // 横屏
        frame.origin.x = 0;
        frame.size.width = size.width;
        frame.size.height = TarVCHeightMin;
        frame.origin.y = size.height - frame.size.height;
    } else { // 竖屏
        frame.origin.x = 0;
        frame.size.width = size.width;
        frame.size.height = TarVCHeightMax;
        frame.origin.y = size.height - frame.size.height;
    }
    return frame;
}

//设置的是RightVC的约束
-(CGRect)setUpRightVCLayout:(CGRect)frame AndCGRect:(CGSize)size{
    if (size.width > iPadAriwidth||size.height > iPadAriHeight) { // 横屏
        frame.size.width = rightVCHeightMax;
        frame.origin.x = size.width - frame.size.width;
        frame.size.height = size.height - navBar - self.TarView.frame.size.height;
        frame.origin.y = navBar;
    } else { // 竖屏
        frame.size.width = rightVCHeightMin;
        frame.origin.x = size.width - frame.size.width;
        frame.size.height = size.height - navBar - self.TarView.frame.size.height;
        frame.origin.y = navBar;
    }
    return frame;
}

//设置的是LeftVC的约束
-(CGRect)setUpLeftVCLayout:(CGRect)frame AndCGRect:(CGSize)size{
    if (size.width > iPadAriwidth||size.height > iPadAriHeight) { // 横屏
        frame.size.width = leftVCHeightMax;
        frame.origin.x = 0;
        frame.size.height = size.height - navBar - self.TarView.frame.size.height;
        frame.origin.y = navBar;
    } else { // 竖屏
        frame.size.width = leftVCHeightMin;
        frame.origin.x = 0;
        frame.size.height = size.height - navBar - self.TarView.frame.size.height;
        frame.origin.y = navBar;
    }
    return frame;
}

#pragma mark - 增加的nav的接口
/**
 *  addNew添加功能的接口
 */
-(void)addNew{
    NSLog(@"添加的新功能");
}

/**
 *  PageList页面列表的展示
 */
-(void)PageList{
    NSLog(@"页面列表的显示");
}

#pragma mark - 控制器的销毁的方法
-(void)dealloc
{
    NSLog(@"yqviewcontoller挂了");
}

@end

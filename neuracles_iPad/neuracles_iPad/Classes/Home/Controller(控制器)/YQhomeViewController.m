//
//  YQhomeViewController.m
//  neuracles_iPad
//
//  Created by neuracle on 16/1/21.
//  Copyright © 2016年 neuracle. All rights reserved.
//

#import "YQhomeViewController.h"
#import "YQlookBackViewController.h"
#import "YQCenterViewController.h"
#import "YQsetViewController.h"
#import "YQTarButtonContorller.h"
#import "YQViewController.h"

#define myFrame [UIScreen mainScreen].bounds

@interface YQhomeViewController ()
@property (weak, nonatomic) IBOutlet UIView *tarView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end

@implementation YQhomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //1.初始化主控制器,设置标题和按钮
    self.title = @"Monitor";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Add" style:UIBarButtonItemStyleDone target:self action:@selector(addNew)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"PageList" style:UIBarButtonItemStyleDone target:self action:@selector(PageList)];
    
//    [self setTarviewFunction];
    
//    2.添加默认的控制器
//    UIViewController * towVC = self.childViewControllers[1];
//    towVC.view.frame = self.scrollView.frame;
//    self.automaticallyAdjustsScrollViewInsets = NO;
//    [self.scrollView addSubview:towVC.view];
//
//    //3.设置内容的 size
//    CGFloat scrollW = self.childViewControllers.count * myFrame.size.width;
//    self.scrollView.contentSize = CGSizeMake(scrollW, 0);
    
   
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setupButtonTitle];
    }
    return self;
}

#pragma mark - 添加子视图的功能和view(button扩展的功能)
-(void)setTarviewFunction{
    //添加回看界面
    YQlookBackViewController * VC0 = [[YQlookBackViewController alloc]init];
    VC0.title = @"look back";
    [self addChildViewController:VC0];
    //添加监护的主页面
    YQhomeViewController * VC1 = [[YQhomeViewController alloc]init];
    VC1.title = @"Monitor";
    [self addChildViewController:VC1];
    //添加two子控制器(病例管理)
    YQCenterViewController * VC2 = [[YQCenterViewController alloc]init];
    VC2.title = @"case load";
    [self addChildViewController:VC2];
    //添加three子控制器(设置)
    YQsetViewController * VC3 = [[YQsetViewController alloc]init];
    VC3.title = @"setting";
    [self addChildViewController:VC3];
    
}

#pragma mark - 添加底部的所有的标题
-(void)setupButtonTitle{
    //创建button
    NSUInteger count = self.childViewControllers.count;
    CGFloat value = [UIScreen mainScreen].bounds.size.width / count;
    CGFloat buttonW = value;
    CGFloat buttonH = self.tarView.frame.size.height;
    CGFloat buttonY = 0;
    for(NSUInteger i= 0; i< count; i++){
        YQTarButtonContorller * button  = [[YQTarButtonContorller alloc]init];
        button.tag = i;
        CGFloat buttonX = i * buttonW;
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        //设置文字
        UIViewController * temp = self.childViewControllers[i];
        [button setTitle:temp.title forState:UIControlStateNormal];
        [button addTarget:self action:@selector(clickTarbutton:) forControlEvents:UIControlEventTouchUpInside];
        [self.tarView addSubview: button];
    }
}

#pragma mark - 监听tarButton的点击事件
-(void)clickTarbutton:(UIButton * )button{
    NSLog(@"点击了---%zd",button.tag);
    CGFloat offsetX = button.tag * self.scrollView.frame.size.width;
    [self.scrollView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
    
    
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
@end

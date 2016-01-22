//
//  YQCenterViewController.m
//  neuracles_iPad
//
//  Created by neuracle on 16/1/19.
//  Copyright © 2016年 neuracle. All rights reserved.
//

#import "YQCenterViewController.h"

@interface YQCenterViewController ()

@end

@implementation YQCenterViewController
static NSString * const ID = @"guardian";


- (void)viewDidLoad {
    [super viewDidLoad];
    //    self.title = @"guardian";
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
}

#pragma mark - Table view data source
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 40;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ --- %zd",self.title,indexPath.row];
    
    return cell;
}

@end

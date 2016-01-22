//
//  YQTarButtonContorller.m
//  neuracles_iPad
//
//  Created by neuracle on 16/1/21.
//  Copyright © 2016年 neuracle. All rights reserved.
//

#import "YQTarButtonContorller.h"

@implementation YQTarButtonContorller
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.titleLabel.textAlignment = NSTextAlignmentNatural;
        self.titleLabel.font = [UIFont systemFontOfSize:18];
        self.backgroundColor = [UIColor grayColor];
        self.userInteractionEnabled = YES;
    }
    
    return self;
}
@end

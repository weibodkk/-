//
//  TestCollectionViewCell.m
//  testbascAnimation
//
//  Created by 郭俊秀 on 16/9/7.
//  Copyright © 2016年 wby. All rights reserved.
//

#import "TestCollectionViewCell.h"

@implementation TestCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setSubvies];
    }
    return self;
}
-(void)setSubvies
{
    _backImage = [[UIButton alloc]initWithFrame:CGRectMake(40, 0, 40, 40)];
    _backImage.backgroundColor = [UIColor redColor];
    [self addSubview:_backImage];
    
    
    UIView * otherView = [[UIView alloc]initWithFrame:CGRectMake(0, 40, 80, 30)];
    otherView.backgroundColor = [UIColor orangeColor];
    [self addSubview:otherView];
}
@end

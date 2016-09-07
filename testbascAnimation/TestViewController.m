//
//  TestViewController.m
//  testbascAnimation
//
//  Created by 郭俊秀 on 16/9/7.
//  Copyright © 2016年 wby. All rights reserved.
//

#import "TestViewController.h"
#import "TestCollectionViewCell.h"
@interface TestViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
{
    UICollectionView * backColler;
}
@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc]init];
    flowLayout.itemSize = CGSizeMake(100, 100);
    
    CGFloat itemW = self.view.frame.size.width /4 -1;
    CGFloat itemH =itemW;
    flowLayout.itemSize = CGSizeMake(itemW, itemH);
    flowLayout.sectionInset = UIEdgeInsetsMake(0,0,0, 0);


    backColler = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) collectionViewLayout:flowLayout];
    backColler.delegate = self;
    backColler.dataSource = self;
    backColler.backgroundColor = [UIColor grayColor];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    [self.view addSubview:backColler];
    
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellidenifier = @"testCell";
    [collectionView registerClass:[TestCollectionViewCell class] forCellWithReuseIdentifier:cellidenifier];
    TestCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellidenifier forIndexPath:indexPath];
    [cell.backImage addTarget:self action:@selector(didClickedCellBuutonAction: withEvent:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
    
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 1;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 1;
}
-(void)didClickedCellBuutonAction:(UIButton *)btn withEvent:(UIEvent *)event
{
    UITouch* touch = [[event touchesForView:btn] anyObject];
    
    CGPoint rootViewLocation = [touch locationInView:[UIApplication sharedApplication].keyWindow];
    
    CALayer * layer = [[CALayer alloc]init];
    layer.frame = btn.frame;
    layer.opacity = 1;
    layer.backgroundColor = [UIColor blueColor].CGColor;
    layer.masksToBounds = YES;
    layer.cornerRadius = layer.frame.size.width / 2.0;
    [backColler.layer addSublayer:layer];
    
    UIBezierPath * path = [UIBezierPath bezierPath];
    CGPoint endPoint = CGPointMake(20,self.view.frame.size.height -  20);
    
//    CGPoint startPoint = CGPointMake(btn.frame.origin.x, btn.frame.origin.y);
    CGPoint centerPoint = CGPointMake((rootViewLocation.x - 20) / 2, (rootViewLocation.y - 20) / 2);
    [path moveToPoint:rootViewLocation];
    [path addQuadCurveToPoint:endPoint controlPoint:centerPoint];
    CAKeyframeAnimation *animation=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.path = path.CGPath;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.duration=0.8;
    animation.delegate=self;
    animation.autoreverses= NO;
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [layer addAnimation:animation forKey:@"buy"];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

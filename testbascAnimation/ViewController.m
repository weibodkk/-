//
//  ViewController.m
//  testbascAnimation
//
//  Created by 郭俊秀 on 16/9/7.
//  Copyright © 2016年 wby. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton * senderButton = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 40)];
    senderButton.backgroundColor =[UIColor redColor];
    [senderButton addTarget:self action:@selector(didClickedSenderButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:senderButton];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)didClickedSenderButtonAction
{
    TestViewController * tvc = [[TestViewController alloc]init];
    [self presentViewController:tvc animated:YES completion:nil];
//    [self.navigationController pushViewController:tvc animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

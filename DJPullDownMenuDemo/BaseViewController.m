//
//  BaseViewController.m
//  DJPullDownMenuDemo
//
//  Created by ii on 16/10/8.
//  Copyright © 2016年 JSMD. All rights reserved.
//

#import "BaseViewController.h"

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = self.view.frame;
    [button setTitle:@"PullDownButton" forState:UIControlStateNormal];
    [button setTitleColor:MenuButtonTextColor forState:UIControlStateNormal];
    [button addTarget:self action:@selector(PullDownButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)PullDownButtonClick{

    PullDownMenuController *pullVC = [PullDownMenuController new];
    [self.navigationController pushViewController:pullVC animated:YES];
}

@end

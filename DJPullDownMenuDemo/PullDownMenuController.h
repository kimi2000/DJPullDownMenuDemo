//
//  PullDownMenuController.h
//  DJPullDownMenuDemo
//
//  Created by ii on 16/10/8.
//  Copyright © 2016年 JSMD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DJPullDowmMenuView.h"
#import "ShareMenuShowView.h"
#import "DJMenuButton.h"

@interface PullDownMenuController : UIViewController <DJPullDowmMenuViewDelegate>

@property (nonatomic,strong) DJPullDowmMenuView *menu;
@property (nonatomic,strong) NSArray *titleNameArray;
@property (nonatomic,strong) DJMenuButton *menuButton;

@property (nonatomic,strong) ShareMenuShowView *menuShowView;
@property (nonatomic,assign) BOOL isShow;

@end

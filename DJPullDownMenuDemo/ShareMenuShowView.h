//
//  ShareMenuShowView.h
//  DJPullDownMenuDemo
//
//  Created by ii on 16/10/8.
//  Copyright © 2016年 JSMD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShareMenuShowView : UIView <UITableViewDelegate,UITableViewDataSource>

@property (assign, nonatomic) CGPoint showPoint;
@property (strong, nonatomic) NSArray *items;
@property (strong, nonatomic) UITableView *myTabelView;
@property (assign, nonatomic) CGRect originalRect;
@property (strong, nonatomic) NSMutableSet *choseSet;


- (id)initWithFrame:(CGRect)frame items:(NSArray <NSString *> *)items showPoint:(CGPoint)showPoint;

@property (strong, nonatomic) UIColor *sq_selectColor; //选后的颜色
@property (strong, nonatomic) UIColor *sq_backGroundColor;
@property (copy, nonatomic) void(^selectBlock)(ShareMenuShowView *view, NSInteger index);

@property (copy, nonatomic) UIColor *itemTextColor;

- (void)selectBlock:(void(^)(ShareMenuShowView *view, NSInteger index))block;

- (void)showView;

- (void)dismissView;

@end

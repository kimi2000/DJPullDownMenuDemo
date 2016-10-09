//
//  DJPullDowmMenuView.h
//  DJPullDownMenuDemo
//
//  Created by ii on 16/10/8.
//  Copyright © 2016年 JSMD. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^Dismiss)(void);

typedef enum : NSInteger{
    kNavigationPop=1000,
    ksortPop
}popType;

//下拉菜单，代理方法，当点击某一行时候，发生的事件 .
@protocol DJPullDowmMenuViewDelegate <NSObject>

- (void)tableViewDidSelectRowAtIndexPath:(NSIndexPath *)indexPath andPopType:(popType)popViewType;

@end

@protocol DJPullDowmMenuViewDelegate;

@interface DJPullDowmMenuView : UIView <UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)id<DJPullDowmMenuViewDelegate>tableViewDelegate;

@property(nonatomic,strong)Dismiss dismiss;
@property(nonatomic,strong)UITableView *menuTableView;
@property(nonatomic,assign)popType popViewType;
@property(nonatomic,assign)BOOL isSharp;//下拉菜单是否有上面的三角形符号
@property(nonatomic,copy)NSArray *nameArray;
@property(nonatomic,retain)UIColor *color;
@property(nonatomic,assign)CGPoint orign;
@property(nonatomic,assign)CGFloat width;
@property(nonatomic,assign)CGFloat layerSize;

/*
 自定义一个下拉菜单，传入下拉菜单显示的内容，属性为数组，下拉菜单左上角的位置，下拉菜单的宽度，下拉菜单的高度，每一行的高度，是否将下拉菜单设置为有圆角，传入圆角大小，设置下拉菜单的背景颜色，下拉菜单是否有上访的三角形符号，如果有则设置sharp属性为真，也可传入此下拉菜单的用途，用于复用，不同的情况弹出，对应不用的事件.
 */
- (instancetype)initWithNameArray:(NSArray *)nameArray andMenuOrigin:(CGPoint)orign andMenuWidth:(CGFloat)width andHeight:(CGFloat)rowHeight andLayer:(CGFloat)layer  andTableViewBackGroundColor:(UIColor *)color andIsSharp:(BOOL)sharp andType:(popType)poptype;

//下拉菜单消失事件
- (void)dismissWithCompletion:(void (^)(DJPullDowmMenuView *create))completion;

@end

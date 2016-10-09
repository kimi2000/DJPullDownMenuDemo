//
//  DJPullDowmMenuView.m
//  DJPullDownMenuDemo
//
//  Created by ii on 16/10/8.
//  Copyright © 2016年 JSMD. All rights reserved.
//

#import "DJPullDowmMenuView.h"

@implementation DJPullDowmMenuView
#pragma mark--自定义下拉菜单
- (instancetype)initWithNameArray:(NSArray *)nameArray andMenuOrigin:(CGPoint)orign andMenuWidth:(CGFloat)width andHeight:(CGFloat)rowHeight andLayer:(CGFloat)layer andTableViewBackGroundColor:(UIColor *)color andIsSharp:(BOOL)sharp andType:(popType)poptype{
    self=[super initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) ];
    if (self) {
        
        _popViewType=poptype;
        _isSharp=sharp;
        _layerSize=layer;
        _width=width;
        _orign=orign;
        _nameArray=nameArray;
        _color=color;
        
        CGFloat height;
        if (rowHeight*nameArray.count > SCREEN_HEIGHT - 84) {
            height = SCREEN_HEIGHT - 84;
        }else{
            height = rowHeight*nameArray.count;
        }
        
        self.menuTableView=[[UITableView alloc]initWithFrame:CGRectMake(orign.x, orign.y, width, height) style:UITableViewStylePlain];

        [self.menuTableView setDelegate:self];
        [self.menuTableView setDataSource:self];
        
        self.menuTableView.rowHeight = rowHeight;
        
        [self.menuTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:NSStringFromClass([UITableViewCell class])];

        //设置下拉菜单边框颜色，如果不需要可以注掉 。
        //        [self.menuTableView.layer setMasksToBounds:YES];
        [self.menuTableView.layer setBorderWidth:0.5];
        [self.menuTableView.layer setBorderColor:[UIColor lightGrayColor].CGColor];

        _menuTableView.tableFooterView = [[UIView alloc]init];
        
        [self addSubview:_menuTableView];
    }
    return self;
}

#pragma mark--tableView代理方法
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:NSStringFromClass([UITableViewCell class])];
    cell.backgroundColor=[UIColor clearColor];
    cell.textLabel.textColor=COLOR(109, 109, 109);
    cell.textLabel.font = [UIFont systemFontOfSize:18];
    cell.textLabel.text=_nameArray[indexPath.row];
    [cell.textLabel setTextAlignment:NSTextAlignmentCenter];
    cell.selectionStyle=UITableViewCellSelectionStyleGray;
    return cell;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _nameArray.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView selectRowAtIndexPath:indexPath animated:YES scrollPosition:UITableViewScrollPositionMiddle];
    if ([self.tableViewDelegate respondsToSelector:@selector(tableViewDidSelectRowAtIndexPath: andPopType:)]) {
        [self.tableViewDelegate tableViewDidSelectRowAtIndexPath:indexPath andPopType:_popViewType];
    }
}

#pragma mark--消失事件
- (void)dismissWithCompletion:(void (^)(DJPullDowmMenuView *))completion{
    __weak typeof(self)weakSelf=self;
    [UIView animateWithDuration:0.1 animations:^{
        weakSelf.menuTableView.frame=CGRectMake(_orign.x, _orign.y, _width, 0);
    } completion:^(BOOL finished) {
        
        if (weakSelf.dismiss) {
            weakSelf.dismiss();
        }
    }];
}

@end

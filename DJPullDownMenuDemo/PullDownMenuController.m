//
//  PullDownMenuController.m
//  DJPullDownMenuDemo
//
//  Created by ii on 16/10/8.
//  Copyright © 2016年 JSMD. All rights reserved.
//

#import "PullDownMenuController.h"

@implementation PullDownMenuController
{
    NSArray *_itemsArray;
    NSArray *_titleNameArray;
    
    UILabel *_showLabel;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    // Do any additional setup after loading the view.
    
    _titleNameArray = [NSArray arrayWithObjects:@"蜂蜜单品优惠活动",@"全场优惠满188减100",@"全部满减",@"全场优惠满388减150", @"蜂蜜单品优惠活动",@"全场优惠满188减100",@"全部满减",@"全场优惠满388减150",@"蜂蜜单品优惠活动",@"全场优惠满188减100",@"全部满减",@"全场优惠满388减150",@"蜂蜜单品优惠活动",@"全场优惠满188减100",@"全部满减",@"全场优惠满388减150",nil];
    _itemsArray = [NSArray arrayWithObjects:@"QQ",@"微信",@"微博", nil];
    
    
    [self createMenuButton];
    
    [self createMenuShowView];
}

#pragma mark - createMenuShowView

- (void)createMenuShowView {

    if ([self respondsToSelector:@selector(automaticallyAdjustsScrollViewInsets)]){
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    _showLabel = [[UILabel alloc]init];
    _showLabel.frame = CGRectMake(0, 0, itemWidth, itemHeigth);
    _showLabel.center = self.view.center;
    _showLabel.font = [UIFont systemFontOfSize:20];
    _showLabel.textColor = [UIColor redColor];
    _showLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_showLabel];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"share"
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:@selector(share)];
    __weak typeof(self) weakSelf = self;
    
    [self.menuShowView selectBlock:^(ShareMenuShowView *view, NSInteger index) {
        weakSelf.isShow = NO;
//        NSLog(@"点击 %@",_itemsArray[index]);
        _showLabel.text = _itemsArray[index];
        
    }];
}

#pragma mark - createMenuButton

- (void)createMenuButton {
    
    self.navigationItem.titleView = self.menuButton;
}

#pragma mark - menuButton
-(DJMenuButton *)menuButton
{
    if (!_menuButton)
    {
        _menuButton = [DJMenuButton buttonWithType:UIButtonTypeCustom];
        _menuButton.frame = CGRectMake(20, 0, SCREEN_WIDTH - 40, 40);
        [_menuButton addTarget:self action:@selector(showDownList) forControlEvents:UIControlEventTouchUpInside];
        [_menuButton setTitle:_titleNameArray[0] forState:UIControlStateNormal];
        [_menuButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_menuButton setImage:[UIImage imageNamed:@"标签-向下箭头"] forState:UIControlStateNormal];
    }
    return _menuButton;
}

#pragma mark - 展示下拉菜单
-(void)showDownList {
    
    __weak typeof(self)weakSelf = self;
    
    if (!_menu) {
        [_menuButton setImage:[UIImage imageNamed:@"标签-向上箭头"] forState:UIControlStateNormal];
        [_menuButton setTitleColor:MenuButtonTextColor forState:UIControlStateNormal];
        
        _menu=[[DJPullDowmMenuView alloc]initWithNameArray:_titleNameArray andMenuOrigin:CGPointMake(10,74 ) andMenuWidth:SCREEN_WIDTH - 20 andHeight:40 andLayer:4 andTableViewBackGroundColor:[UIColor whiteColor] andIsSharp:YES andType:kNavigationPop];
        _menu.tableViewDelegate=self;
        _menu.dismiss=^(){

            [weakSelf.menuButton setImage:[UIImage imageNamed:@"标签-向下箭头"] forState:UIControlStateNormal];
            [weakSelf.menuButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            
            [weakSelf.menu removeFromSuperview];
            _menu=nil;
        };
        [self.view addSubview:_menu];
    }
    else{
        [_menuButton setImage:[UIImage imageNamed:@"标签-向上箭头"] forState:UIControlStateNormal];
        [_menuButton setTitleColor:MenuButtonTextColor forState:UIControlStateNormal];
        [_menu dismissWithCompletion:^(DJPullDowmMenuView *create) {
            [weakSelf.menu removeFromSuperview];
            weakSelf.menu=nil;
        }];
    }
}

#pragma mark - 自定义下拉菜单代理方法,点击下拉菜单某一行时候对应的响应时间，点击完成后试图要消失，用一个block通知；
-(void)tableViewDidSelectRowAtIndexPath:(NSIndexPath *)indexPath andPopType:(popType)popViewType{
    //改变导航栏文字
    if (popViewType==kNavigationPop) {
        [_menuButton setTitle:_titleNameArray[indexPath.row] forState:UIControlStateNormal];
        
        NSLog(@"%ld - %@",indexPath.row,_titleNameArray[indexPath.row]);
    }
    if (popViewType==ksortPop) {
        NSLog(@"点击排序后要做的事情");
    }
    [_menu dismissWithCompletion:nil];//点击完成后视图消失;
}

#pragma mark - touchesBegan
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    if (_menu) {
        
        [_menu dismissWithCompletion:nil];//点击完成后视图消失;
    }
    
    _isShow = NO;
    
    [self.menuShowView dismissView];
}

#pragma mark - menuShowView
- (ShareMenuShowView *)menuShowView{
    
    if (_menuShowView) {
        return _menuShowView;
    }
    
    _menuShowView = [[ShareMenuShowView alloc]initWithFrame:(CGRect){SCREEN_WIDTH-itemWidth-10,TopBarHeight+5,itemWidth,0}
                                               items:_itemsArray
                                           showPoint:(CGPoint){SCREEN_WIDTH-25,10}];
    _menuShowView.backGroundColor = [UIColor whiteColor];
    _menuShowView.itemTextColor = TextColor;
    [self.view addSubview:_menuShowView];
    return _menuShowView;
}

#pragma mark - shareClick
- (void)share{
    _isShow = !_isShow;
    
    if (_isShow) {
        [self.menuShowView showView];
        
    }else{
        [self.menuShowView dismissView];
    }
}

@end

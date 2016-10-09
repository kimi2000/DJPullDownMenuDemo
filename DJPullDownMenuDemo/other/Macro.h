//
//  Macro.h
//  DJPullDownMenuDemo
//
//  Created by ii on 16/10/8.
//  Copyright © 2016年 JSMD. All rights reserved.
//

#ifndef Macro_h
#define Macro_h

/**< 屏幕宽度*/
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
/**< 屏幕高度*/
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

#define COLOR(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define TextColor [UIColor colorWithRed:51.0/255.0 green:51.0/255.0 blue:51.0/255.0 alpha:1.0]
#define MenuButtonTextColor [UIColor colorWithRed:25 /255.0 green:143/255.0 blue:238/255.0 alpha:1]
// 随机色
#define DJRandomColor COLOR(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

#define itemSelectColor  [[UIColor blackColor]colorWithAlphaComponent:0.1]

#define itemHeigth     30  //每项高度
#define itemWidth     100  //每项宽度
#define triangleWith   15  //三角形的高度

#define TopBarHeight 64  //导航栏高度

#endif /* Macro_h */

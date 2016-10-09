//
//  ShareMenuShowCell.m
//  DJPullDownMenuDemo
//
//  Created by ii on 16/10/8.
//  Copyright © 2016年 JSMD. All rights reserved.
//

#import "ShareMenuShowCell.h"

@implementation ShareMenuShowCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];

        [self.contentView addSubview:self.textTitle];

      }
    
    return  self;
}


- (UILabel *)textTitle{
    if (!_textTitle) {
        _textTitle = [[UILabel alloc]init];
        _textTitle.frame = CGRectMake(0, 0, itemWidth, itemHeigth);
        [self setLable:_textTitle];
    }
    return _textTitle;
}
- (void)setLable:(UILabel *)lable{
    lable.font = [UIFont systemFontOfSize:14];
    lable.textAlignment = NSTextAlignmentCenter;
    lable.textColor = TextColor;
//    lable.backgroundColor = DJRandomColor;
}

@end

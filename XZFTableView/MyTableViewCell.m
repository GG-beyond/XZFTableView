//
//  MyTableViewCell.m
//  XZFTableView
//
//  Created by anxindeli on 2017/7/27.
//  Copyright © 2017年 anxindeli. All rights reserved.
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell
- (instancetype)initWithIndentifier:(NSString *)indentifier{
    if (self = [super initWithIndentifier:indentifier]) {
        [self addSubview:self.appName];
        [self creatLine];
    }
    return self;
}

//应用名称
- (UILabel *)appName{
    if (!_appName) {
        _appName = [[UILabel alloc] initWithFrame:CGRectMake(0, 130, 44, 20)];
        _appName.textColor = [UIColor redColor];
        _appName.textAlignment = NSTextAlignmentCenter;
        _appName.font = [UIFont systemFontOfSize:14];
    }
    return _appName;
}
- (void)creatLine{
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(43, 0, 1, 300)];
    line.backgroundColor = [UIColor orangeColor];
    [self addSubview:line];
    
}
@end

//
//  MyTableViewCell.m
//  XZFTableView
//
//  Created by anxindeli on 2017/7/27.
//  Copyright © 2017年 anxindeli. All rights reserved.
//

#import "MyTableViewCell.h"
@interface MyTableViewCell ()
@property (nonatomic, strong) UIView *line;

@end
@implementation MyTableViewCell
- (instancetype)initWithIndentifier:(NSString *)indentifier{
    if (self = [super initWithIndentifier:indentifier]) {
        [self addSubview:self.weekDay];
        [self addSubview:self.line];
        [self addSubview:self.cornerMarkImageView];
        UIView *bgView = [[UIView alloc] init];
        bgView.backgroundColor = [UIColor blueColor];
        self.selectedBackgroundView = bgView;
    }
    return self;
}

- (void)setViewSize:(CGSize)viewSize{
    [super setViewSize:viewSize];
    self.weekDay.frame = CGRectMake(0, 130, viewSize.width, 20);
    self.line.frame = CGRectMake(viewSize.width-1, 0, 1, viewSize.height);
    self.cornerMarkImageView.frame = CGRectMake(0, 5, 20, 20);
}
//应用名称
- (UILabel *)weekDay{
    if (!_weekDay) {
        _weekDay = [[UILabel alloc] initWithFrame:CGRectMake(0, 130, 44, 20)];
        _weekDay.textColor = [UIColor redColor];
        _weekDay.textAlignment = NSTextAlignmentCenter;
        _weekDay.font = [UIFont systemFontOfSize:14];
    }
    return _weekDay;
}
- (UIView*)line{
    
    if (!_line) {
        _line = [[UIView alloc] initWithFrame:CGRectMake(43, 0, 1, 300)];
        _line.backgroundColor = [UIColor orangeColor];
    }
    return _line;
}
- (UIImageView *)cornerMarkImageView{
    
    if (!_cornerMarkImageView) {
        _cornerMarkImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 5, 20, 20)];
        _cornerMarkImageView.layer.borderWidth = 0.5;
        _cornerMarkImageView.backgroundColor = [UIColor clearColor];
        _cornerMarkImageView.layer.borderColor = [UIColor redColor].CGColor;
        _cornerMarkImageView.layer.cornerRadius = 10.0f;
    }
    return _cornerMarkImageView;
}
@end

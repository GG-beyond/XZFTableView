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
        [self addSubview:self.date];
        [self addSubview:self.type];
        [self addSubview:self.high];
        [self addSubview:self.low];
        [self addSubview:self.fengxiang];
        [self addSubview:self.fengli];
        [self addSubview:self.line];
        [self addSubview:self.cornerMarkImageView];
        UIView *bgView = [[UIView alloc] init];
        bgView.backgroundColor = [UIColor blueColor];
        self.selectedBackgroundView = bgView;
    }
    return self;
}

- (void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    self.weekDay.frame = CGRectMake(0, 40, frame.size.width, 20);
    self.date.frame = CGRectMake(0, 70, frame.size.width, 20);
    self.type.frame = CGRectMake(0, 100, frame.size.width, 20);
    self.high.frame = CGRectMake(0, 130, frame.size.width, 20);
    self.low.frame = CGRectMake(0, 160, frame.size.width, 20);
    self.fengxiang.frame = CGRectMake(0, 190, frame.size.width, 20);
    self.fengli.frame = CGRectMake(0, 240, frame.size.width, 20);
    self.line.frame = CGRectMake(frame.size.width-1, 0, 1, frame.size.height);
    self.cornerMarkImageView.frame = CGRectMake(0, 5, 20, 20);

}
//天气
- (UILabel *)weekDay{
    if (!_weekDay) {
        _weekDay = [[UILabel alloc] initWithFrame:CGRectMake(0, 130, 44, 20)];
        _weekDay.textColor = [UIColor redColor];
        _weekDay.textAlignment = NSTextAlignmentCenter;
        _weekDay.font = [UIFont systemFontOfSize:14];
    }
    return _weekDay;
}
- (UILabel *)date{
    if (!_date) {
        _date = [[UILabel alloc] initWithFrame:CGRectMake(0, 130, 44, 20)];
        _date.textColor = [UIColor redColor];
        _date.textAlignment = NSTextAlignmentCenter;
        _date.font = [UIFont systemFontOfSize:12];
    }
    return _date;
}
- (UILabel *)type{
    if (!_type) {
        _type = [[UILabel alloc] initWithFrame:CGRectMake(0, 130, 44, 20)];
        _type.textColor = [UIColor redColor];
        _type.textAlignment = NSTextAlignmentCenter;
        _type.font = [UIFont systemFontOfSize:14];
    }
    return _type;
}
- (UILabel *)high{
    if (!_high) {
        _high = [[UILabel alloc] initWithFrame:CGRectMake(0, 130, 44, 20)];
        _high.textColor = [UIColor orangeColor];
        _high.textAlignment = NSTextAlignmentCenter;
        _high.font = [UIFont systemFontOfSize:14];
    }
    return _high;
}
- (UILabel *)low{
    if (!_low) {
        _low = [[UILabel alloc] initWithFrame:CGRectMake(0, 130, 44, 20)];
        _low.textColor = [UIColor grayColor];
        _low.textAlignment = NSTextAlignmentCenter;
        _low.font = [UIFont systemFontOfSize:14];
    }
    return _low;
}
- (UILabel *)fengxiang{
    if (!_fengxiang) {
        _fengxiang = [[UILabel alloc] initWithFrame:CGRectMake(0, 130, 44, 20)];
        _fengxiang.textColor = [UIColor greenColor];
        _fengxiang.textAlignment = NSTextAlignmentCenter;
        _fengxiang.font = [UIFont systemFontOfSize:12];
    }
    return _fengxiang;
}
- (UILabel *)fengli{
    if (!_fengli) {
        _fengli = [[UILabel alloc] initWithFrame:CGRectMake(0, 130, 44, 20)];
        _fengli.textColor = [UIColor greenColor];
        _fengli.textAlignment = NSTextAlignmentCenter;
        _fengli.font = [UIFont systemFontOfSize:11];
    }
    return _fengli;
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
- (void)fillinInfo:(NSDictionary *)info{
    
    _weekDay.text = info[@"week"];
    _date.text = info[@"date"];
    _type.text = info[@"type"];
    _high.text = info[@"high"];
    _low.text = info[@"low"];
    _fengxiang.text = info[@"fengxiang"];
    _fengli.text = info[@"fengli"];
    
}
@end

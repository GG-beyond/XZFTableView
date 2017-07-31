//
//  MyTableViewCell.h
//  XZFTableView
//
//  Created by anxindeli on 2017/7/27.
//  Copyright © 2017年 anxindeli. All rights reserved.
//

#import "ViewCell.h"

@interface MyTableViewCell : ViewCell
@property (nonatomic, strong) UILabel *weekDay;//星期几
@property (nonatomic, strong) UILabel *date;//日期
@property (nonatomic, strong) UILabel *type;//天气：晴
@property (nonatomic, strong) UILabel *fengli;//风力
@property (nonatomic, strong) UILabel *fengxiang;//风向
@property (nonatomic, strong) UILabel *high;//最高温度
@property (nonatomic, strong) UILabel *low;//最低温度
@property (nonatomic, strong) UIImageView *cornerMarkImageView;//编辑角标（目前不可点击）


@end

//
//  ViewCell.m
//  XZFTableView
//
//  Created by anxindeli on 2017/7/26.
//  Copyright © 2017年 anxindeli. All rights reserved.
//

#import "ViewCell.h"

@implementation ViewCell

- (id)initWithIndentifier:(NSString *)indentifier{
    if (self=[super init]) {
        _indentifier = indentifier;
        self.backgroundColor = [UIColor purpleColor];
    }
    return self;
}

@end

//
//  ViewCell.h
//  XZFTableView
//
//  Created by anxindeli on 2017/7/26.
//  Copyright © 2017年 anxindeli. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewCell : UIControl
@property (nonatomic, strong) NSString *indentifier;

- (id)initWithIndentifier:(NSString *)indentifier;
@end

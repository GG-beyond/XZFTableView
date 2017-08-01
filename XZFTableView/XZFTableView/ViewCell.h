//
//  ViewCell.h
//  XZFTableView
//
//  Created by anxindeli on 2017/7/26.
//  Copyright © 2017年 anxindeli. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ViewCell;
@protocol CellDelegate <NSObject>

- (void)selectCurrentCell:(NSInteger)index ;
@end
@interface ViewCell : UIView
@property (nonatomic, strong) NSString *indentifier;
@property (nonatomic, strong) UIView *selectedBackgroundView;//cell选中时的view
@property (nonatomic, getter=isSelected) BOOL selected;//选中
@property (nonatomic, getter=isHighlighted) BOOL highlighted; //高亮
@property (nonatomic, weak) id<CellDelegate> cellDelegate;

- (id)initWithIndentifier:(NSString *)indentifier;
@end

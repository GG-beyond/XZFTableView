//
//  ViewCell.m
//  XZFTableView
//
//  Created by anxindeli on 2017/7/26.
//  Copyright © 2017年 anxindeli. All rights reserved.
//

#import "ViewCell.h"
@interface ViewCell ()
@property (nonatomic, strong) UIButton *bgControl;
@property (nonatomic, strong) UIColor *defalutColor;

@end
@implementation ViewCell
- (void)layoutSubviews{
    
}
- (id)initWithIndentifier:(NSString *)indentifier{
    if (self=[super init]) {
        _indentifier = indentifier;
        self.backgroundColor = [UIColor purpleColor];
        [self addSubview:self.selectedBackgroundView];
        [self addSubview:self.bgControl];
        _defalutColor = [UIColor grayColor];
    }
    return self;
}
- (UIButton *)bgControl{
    
    if (!_bgControl) {
        
        _bgControl = [[UIButton alloc] initWithFrame:self.bounds];
        [_bgControl addTarget:self action:@selector(doSelect:) forControlEvents:UIControlEventTouchUpInside];

    }
    return _bgControl;
}
- (UIView *)backgroundView{
    
    UIView *selectedBackgroundView = [[UIView alloc] initWithFrame:self.bounds];
    self.selectedBackgroundView = selectedBackgroundView;
    selectedBackgroundView.backgroundColor = _defalutColor;
    return selectedBackgroundView;
}
#pragma mark - SETTET && GETTER
- (void)setSelectedBackgroundView:(UIView *)selectedBackgroundView{

    _defalutColor = selectedBackgroundView.backgroundColor;

}
- (void)setViewSize:(CGSize)viewSize{
    _viewSize = viewSize;
    self.bgControl.frame = CGRectMake(0, 0, viewSize.width, viewSize.height);
    UIImage *image = [self createImageWithBgColor:_defalutColor size:_bgControl.bounds.size ];
    [_bgControl setImage:image forState:UIControlStateHighlighted];
    [_bgControl setImage:image forState:UIControlStateSelected];

}
- (void)setSelected:(BOOL)selected{
    _selected = selected;
    self.bgControl.selected = selected;
}
- (void)setHighlighted:(BOOL)highlighted{
    _highlighted = highlighted;
    self.bgControl.highlighted = highlighted;
}

- (UIImage *)createImageWithBgColor:(UIColor *)color size:(CGSize)size
{
    CGFloat scale = [[UIScreen mainScreen] scale];
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, size.width * scale, size.height * scale)];
    view.backgroundColor = color;
    UIGraphicsBeginImageContext(view.frame.size);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
- (void)doSelect:(UIButton *)sender{
    NSLog(@"%ld",self.tag);
    if (self.cellDelegate && [self.cellDelegate respondsToSelector:@selector(selectCurrentCell:)]) {
        [self.cellDelegate selectCurrentCell:sender.tag];
    }
}
@end

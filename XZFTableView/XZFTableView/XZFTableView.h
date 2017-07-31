//
//  XZFTableView.h
//  XZFTableView
//
//  Created by anxindeli on 2017/7/26.
//  Copyright © 2017年 anxindeli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewCell.h"
typedef enum ScrollDirection {
    ScrollDirectionRight,
    ScrollDirectionLeft,
} ScrollDirection;

@class XZFTableView;
@protocol UIXZFTableViewDataSource<NSObject>//Datasource
@required
/*
 cardview 目前只有一个分区
 return 返回个数
 */
- (NSInteger)numberCardScrollView;
/*
 返回对应每一个小cell
 */
- (__kindof ViewCell *)xzfTableview:(XZFTableView *)tableView cellForRowAtIndex:(NSInteger)index;
@end
//============================、、、delegate、、、==================
@protocol UIXZFTableViewDelegate<NSObject>
@optional
/*
    返回一个cell的大小
 */
- (CGSize)tableView:(XZFTableView *)tableView;
- (void)tableView:(XZFTableView *)tableView didSelectRowAtIndex:(NSInteger)index;//选中
- (void)tableView:(XZFTableView *)tableView didDeselectRowAtIndex:(NSInteger)index;
- (void)xzfTableViewDidScroll:(XZFTableView *)tableView;


@end
@interface XZFTableView : UIScrollView<UIScrollViewDelegate>
@property (nonatomic, weak) id <UIXZFTableViewDataSource> xzfDataSource;
@property (nonatomic, weak) id <UIXZFTableViewDelegate> xzfDelegate;
@property (nonatomic, strong) NSMutableArray *visibleViewCells;//可见的cell数组
@property (nonatomic, strong) NSMutableSet *reuseableViewCells;//重用的cell集合
@property (nonatomic, assign) ScrollDirection sDirection;//滑动方向

/*
    重用机制
 */
- (__kindof ViewCell *)dequeueReusableCardViewWithIdentifier:(NSString *)identifier;
/*
    刷新数据
 */
- (void)reloadData;
/*
    跳转到指定位置(下标)
 */
- (void)scrollToIndex:(NSInteger)index animated:(BOOL)animated;
/*
    取消选中
 */
- (void)deselectRowAtIndexPath:(NSInteger)index animated:(BOOL)animated;

@end

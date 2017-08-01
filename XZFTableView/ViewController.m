//
//  ViewController.m
//  XZFTableView
//
//  Created by anxindeli on 2017/7/26.
//  Copyright © 2017年 anxindeli. All rights reserved.
//

#import "ViewController.h"
#import "XZFTableView.h"
#import "MyTableViewCell.h"
@interface ViewController ()<UIXZFTableViewDelegate,UIXZFTableViewDataSource,UIGestureRecognizerDelegate>
@property (nonatomic, strong) XZFTableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) UIView *snapShotView;
@property (nonatomic, strong) UIView *originView;

@property (nonatomic, assign) CGRect snapFrame;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self.view addSubview:self.tableView];

    
}

- (XZFTableView *)tableView{
    if (!_tableView) {
        _tableView = [[XZFTableView alloc]initWithFrame:CGRectMake(0, 100, SCREEN_WIDTH, 300)];
        _tableView.xzfDelegate = self;
        _tableView.xzfDataSource = self;
        //跳转到指定位置
        [_tableView scrollToIndex:0 animated:YES];
    }
    return _tableView;
}
- (NSMutableArray *)dataSource{
    
    if (!_dataSource) {
        _dataSource = [[NSMutableArray alloc] init];
        //获取json中的数据，刷新
        NSString *path = [[NSBundle mainBundle] pathForResource:@"weather" ofType:@"json"];
        NSData *jsonData = [NSData dataWithContentsOfFile:path options:NSDataReadingMappedIfSafe error:nil];
        
        NSError *error= nil;
        NSMutableDictionary *dict = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];

        [_dataSource addObject:dict[@"data"][@"yesterday"]];
        [_dataSource addObjectsFromArray:dict[@"data"][@"forecast"]];
    }
    return _dataSource;
}
#pragma mark - DataSource
- (NSInteger)numberCardScrollView{
    return self.dataSource.count;
}
- (__kindof ViewCell *)xzfTableview:(XZFTableView *)tableView cellForRowAtIndex:(NSInteger)index{
    static NSString *indentifier = @"cardNomal";
    MyTableViewCell *cell = [tableView dequeueReusableCardViewWithIdentifier:indentifier];
    if (!cell) {
        cell = [[MyTableViewCell alloc] initWithIndentifier:indentifier];
    }
    [cell fillinInfo:self.dataSource[index]];
    return cell;
}
#pragma mark - Delegate
- (CGSize)tableView:(XZFTableView *)tableView{
    /*
     宽度：自己设置
     高度：获取控件的高度
    */
    return CGSizeMake(100, CGRectGetHeight(self.tableView.frame));
    
}
- (void)tableView:(XZFTableView *)tableView didSelectRowAtIndex:(NSInteger)index{
    
//    MyTableViewCell *cell = [tableView cellForItemAtIndex:index];
//    [self addCopyView:cell];
//    return;
    [tableView deselectRowAtIndexPath:index animated:YES];
}
- (void)tableView:(XZFTableView *)tableView didDeselectRowAtIndex:(NSInteger)index{
    
    
}
#pragma mark - 模仿qq发图片，选择图片时角标

//模仿qq发图片，选择图片时角标
- (void)xzfTableViewDidScroll:(XZFTableView *)tableView{
    
    CGFloat offSet = tableView.contentOffset.x + SCREEN_WIDTH;
    for (MyTableViewCell *cell in self.tableView.subviews) {
        
        CGFloat cellMinOffSet = CGRectGetMinX(cell.frame);
        CGFloat cellMaxOffSet = CGRectGetMaxX(cell.frame);

        if (cellMinOffSet>offSet) {//cell在屏幕右边
            cell.cornerMarkImageView.frame = CGRectMake(0, 5, 20, 20);
        }else if (cellMaxOffSet<offSet){//cell 已经展示在屏幕或在屏幕左边
            cell.cornerMarkImageView.frame = CGRectMake([self tableView:tableView].width-20-5, 5, 20, 20);
        }else if (cellMinOffSet <offSet && cellMaxOffSet >offSet){//在屏幕右边边缘
            
            cell.cornerMarkImageView.frame = CGRectMake(MAX(offSet - cellMinOffSet-20-5, 0), 5, 20, 20);
            
        }
    }
}
#pragma mark - 用于模仿qq发图片
/*
 1、实现xzfTableView可编辑的代理，即返回Bool = YES
 2、选中某个cell
 3、
 */
- (void)addCopyView:(UIView *)copyView{
    
    self.originView = copyView;
    UIView *snapShotView = [copyView snapshotViewAfterScreenUpdates:NO];//截图
    CGRect re = [self.view convertRect:copyView.frame fromView:copyView.superview];
    re.origin.y = re.origin.y;
    snapShotView.frame = re;
    self.snapFrame = re;
    self.snapShotView = snapShotView;
    [self.view addSubview:snapShotView];
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(doPan:)];
    [self.tableView.panGestureRecognizer requireGestureRecognizerToFail:pan];
    pan.delegate = self;
    copyView.hidden = YES;
    [snapShotView addGestureRecognizer:pan];
    
}
- (void)doPan:(UIPanGestureRecognizer *)pan{
    

    if (pan.state == UIGestureRecognizerStateBegan) {
        
        
    }else if (pan.state == UIGestureRecognizerStateChanged){
        
        CGPoint translation = [pan translationInView:self.view];
        CGPoint newCenter = CGPointMake(pan.view.center.x,pan.view.center.y +translation.y);//    限制屏幕范围：
        pan.view.center = newCenter;
        [pan setTranslation:CGPointZero inView:self.view];

        
    }else if (pan.state == UIGestureRecognizerStateEnded || pan.state ==UIGestureRecognizerStateCancelled){
        
        [UIView animateWithDuration:1.0
                              delay:0.0
             usingSpringWithDamping:0.5
              initialSpringVelocity:0
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^{
                             
                             pan.view.frame = self.snapFrame;
                             
                         } completion:^(BOOL finished) {
                             if (finished) {
                                 self.originView.hidden = NO;
                                 [self.snapShotView removeFromSuperview];
                                 self.snapShotView = nil;
                             }
                         }];
    }
    
    
}
-(BOOL)gestureRecognizer:(UIGestureRecognizer*) gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer*)otherGestureRecognizer
{
    if ([gestureRecognizer.view isKindOfClass:[MyTableViewCell class]]) {
        
        return NO;
        
    }
    else {
        
        return YES;
        
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end

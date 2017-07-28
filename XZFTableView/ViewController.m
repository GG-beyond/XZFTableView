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
@interface ViewController ()<UIXZFTableViewDelegate,UIXZFTableViewDataSource>
@property (nonatomic, strong) XZFTableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
}
- (XZFTableView *)tableView{
    if (!_tableView) {
        _tableView = [[XZFTableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 300)];
        _tableView.xzfDelegate = self;
        _tableView.xzfDataSource = self;
        //跳转到指定位置
        [_tableView scrollToIndex:20 animated:YES];
    }
    return _tableView;
}
#pragma mark - DataSource
- (NSInteger)numberCardScrollView{
    return 50;
}
- (__kindof ViewCell *)xzfTableview:(XZFTableView *)tableView cellForRowAtIndex:(NSInteger)index{
    static NSString *indentifier = @"cardNomal";
    MyTableViewCell *cell = [tableView dequeueReusableCardViewWithIdentifier:indentifier];
    if (!cell) {
        cell = [[MyTableViewCell alloc] initWithIndentifier:indentifier];
    }
    cell.appName.text = [NSString stringWithFormat:@"%ld",index];
    return cell;
}
#pragma mark - Delegate
- (CGSize)tableView:(XZFTableView *)tableView{
    return CGSizeMake(44, CGRectGetHeight(self.tableView.frame));
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end

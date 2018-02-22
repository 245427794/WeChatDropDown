//
//  ViewController.m
//  WeChatDropDown
//
//  Created by 邓毕华 on 2018/2/22.
//  Copyright © 2018年 邓毕华. All rights reserved.
//

#import "ViewController.h"

#import "DBHWeChatViewController.h"

#import "DBHHeaderView.h"
#import "DBHTableViewCell.h"

static NSString *const kDBHTableViewCellIdentifier = @"kDBHTableViewCellIdentifier";

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>

@property (nonatomic, strong) DBHHeaderView *headerView;
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, assign) BOOL isShowFunctionalUnit;

@end

@implementation ViewController

#pragma mark ------ Lifecycle ------
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.translucent = NO;
    
    [self setUI];
}

#pragma mark ------ UI ------
- (void)setUI {
    [self.view addSubview:self.tableView];
    
    WEAKSELF
    [self.tableView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(weakSelf.view);
        make.center.equalTo(weakSelf.view);
    }];
}

#pragma mark ------ UITableViewDataSource ------
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DBHTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kDBHTableViewCellIdentifier forIndexPath:indexPath];
    
    return cell;
}

#pragma mark ------ UIScrollViewDelegate ------
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    CGFloat offsetY = scrollView.contentOffset.y;
    WEAKSELF
    if (self.isShowFunctionalUnit) {
        // 现在是显示
        if (offsetY > AUTOLAYOUTSIZE(45)) {
            self.tableView.contentInset = UIEdgeInsetsMake(-AUTOLAYOUTSIZE(125), 0, 0, 0);
            self.isShowFunctionalUnit = NO;
        } else {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [weakSelf.tableView setContentOffset:CGPointMake(0,0) animated:YES];
            });
        }
    } else {
        // 现在是隐藏
        if (offsetY < AUTOLAYOUTSIZE(80)) {
            self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
            self.isShowFunctionalUnit = YES;
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [weakSelf.tableView setContentOffset:CGPointMake(0,0) animated:YES];
            });
        }
    }
}

#pragma mark ------ Getters And Setters ------
- (DBHHeaderView *)headerView {
    if (!_headerView) {
        _headerView = [[DBHHeaderView alloc] initWithFrame:CGRectMake(0, 0, 0, AUTOLAYOUTSIZE(125))];
        
        WEAKSELF
        [_headerView clickFunctionalUnitBlock:^(NSInteger functionalUnitType) {
            DBHWeChatViewController *weChatViewController = [[DBHWeChatViewController alloc] init];
            weChatViewController.title = [NSString stringWithFormat:@"WeChat%ld", functionalUnitType + 1];
            [weakSelf.navigationController pushViewController:weChatViewController animated:YES];
        }];
    }
    return _headerView;
}
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.backgroundColor = [UIColor whiteColor];
        
        _tableView.contentInset = UIEdgeInsetsMake(-AUTOLAYOUTSIZE(125), 0, 0, 0);
        
        _tableView.tableHeaderView = self.headerView;
        _tableView.sectionHeaderHeight = 0;
        _tableView.sectionFooterHeight = 0;
        _tableView.rowHeight = AUTOLAYOUTSIZE(50);
        
        _tableView.dataSource = self;
        _tableView.delegate = self;
        
        [_tableView registerClass:[DBHTableViewCell class] forCellReuseIdentifier:kDBHTableViewCellIdentifier];
    }
    return _tableView;
}

@end

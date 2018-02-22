//
//  DBHHeaderView.m
//  WeChatDropDown
//
//  Created by 邓毕华 on 2018/2/22.
//  Copyright © 2018年 邓毕华. All rights reserved.
//

#import "DBHHeaderView.h"

#import "DBHHeaderViewCollectionViewCell.h"

static NSString *const kDBHHeaderViewCollectionViewCellIdentifier = @"kDBHHeaderViewCollectionViewCellIdentifier";

@interface DBHHeaderView ()<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionViewFlowLayout *layout;
@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, copy) ClickFunctionalUnitBlock clickFunctionalUnitBlock;

@end

@implementation DBHHeaderView

#pragma mark ------ Lifecycle ------
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    return self;
}

#pragma mark ------ UI ------
- (void)setUI {
    [self addSubview:self.collectionView];
    
    WEAKSELF
    [self.collectionView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(weakSelf);
        make.center.equalTo(weakSelf);
    }];
}

#pragma mark ------ UICollectionViewDataSource ------
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 8;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    DBHHeaderViewCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kDBHHeaderViewCollectionViewCellIdentifier forIndexPath:indexPath];
    cell.title = [NSString stringWithFormat:@"WeChat%ld", indexPath.row + 1];
    
    return cell;
}

#pragma mark ------ UICollectionViewDelegate ------
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    self.clickFunctionalUnitBlock(indexPath.row);
}

#pragma mark ------ Public Methods ------
- (void)clickFunctionalUnitBlock:(ClickFunctionalUnitBlock)clickFunctionalUnitBlock {
    self.clickFunctionalUnitBlock = clickFunctionalUnitBlock;
}

#pragma mark ------ Getters And Setters ------
- (UICollectionViewFlowLayout *)layout {
    if (!_layout) {
        _layout = [[UICollectionViewFlowLayout alloc] init];
        _layout.itemSize = CGSizeMake(SCREEN_WIDTH * 0.25, AUTOLAYOUTSIZE(125));
        _layout.minimumLineSpacing = 0;
        _layout.minimumInteritemSpacing = 0;
        _layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    }
    return _layout;
}
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:self.layout];
        _collectionView.backgroundColor = COLORFROM16(0xF8F8F8, 1);
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        
        [_collectionView registerClass:[DBHHeaderViewCollectionViewCell class] forCellWithReuseIdentifier:kDBHHeaderViewCollectionViewCellIdentifier];
    }
    return _collectionView;
}

@end

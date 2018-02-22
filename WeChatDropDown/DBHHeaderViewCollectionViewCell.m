//
//  DBHHeaderViewCollectionViewCell.m
//  WeChatDropDown
//
//  Created by 邓毕华 on 2018/2/22.
//  Copyright © 2018年 邓毕华. All rights reserved.
//

#import "DBHHeaderViewCollectionViewCell.h"

@interface DBHHeaderViewCollectionViewCell ()

@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation DBHHeaderViewCollectionViewCell

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
    [self.contentView addSubview:self.iconImageView];
    [self.contentView addSubview:self.titleLabel];
    
    WEAKSELF
    [self.iconImageView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.height.offset(AUTOLAYOUTSIZE(45));
        make.centerX.equalTo(weakSelf.contentView);
        make.top.offset(AUTOLAYOUTSIZE(29));
    }];
    [self.titleLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(weakSelf.contentView);
        make.centerX.equalTo(weakSelf.contentView);
        make.top.equalTo(weakSelf.iconImageView.mas_bottom).offset(AUTOLAYOUTSIZE(6));
    }];
}

#pragma mark ------ Getters And Setters ------
- (void)setTitle:(NSString *)title {
    _title = title;
    
    self.titleLabel.text = _title;
}

- (UIImageView *)iconImageView {
    if (!_iconImageView) {
        _iconImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"WeChat"]];
    }
    return _iconImageView;
}
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:12];
        _titleLabel.textColor = COLORFROM16(0xB1B1B1, 1);
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

@end

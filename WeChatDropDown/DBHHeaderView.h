//
//  DBHHeaderView.h
//  WeChatDropDown
//
//  Created by 邓毕华 on 2018/2/22.
//  Copyright © 2018年 邓毕华. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ClickFunctionalUnitBlock)(NSInteger functionalUnitType);

@interface DBHHeaderView : UIView

/**
 点击功能组件回调
 */
- (void)clickFunctionalUnitBlock:(ClickFunctionalUnitBlock)clickFunctionalUnitBlock;

@end

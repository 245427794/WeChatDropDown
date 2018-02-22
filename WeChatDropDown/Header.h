//
//  Header.h
//  WeChatDropDown
//
//  Created by 邓毕华 on 2018/2/22.
//  Copyright © 2018年 邓毕华. All rights reserved.
//

#ifndef Header_h
#define Header_h

#import <Masonry.h>

/**
 *  弱引用
 */
#define WEAKSELF typeof(self) __weak weakSelf = self;

/**
 *  屏幕宽度
 */
#define  SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

/**
 *  屏幕高度
 */
#define  SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

/**
 *  自适应大小
 */
#define AUTOLAYOUTSIZE(size) (SCREEN_WIDTH / 375.0 * size)

/**
 *  将16进制rgb颜色转换成UIColor
 */
#define COLORFROM16(RGB, A) [UIColor colorWithRed:((float)((RGB & 0xFF0000) >> 16)) / 255.0 green:((float)((RGB & 0xFF00) >> 8)) / 255.0 blue:((float)(RGB & 0xFF)) / 255.0 alpha:A]


#endif /* Header_h */

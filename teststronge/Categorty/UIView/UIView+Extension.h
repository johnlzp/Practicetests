//
//  UIView+Extension.h
//  WeTogeterRich
//
//  Created by gushukeji on 15/11/27.
//  Copyright © 2015年 WuYaoZhe-GuShuKeJi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Extension)


@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, assign) CGSize size;


/**
 指定位置切圆角,注意这个方法存在缺陷，如果切圆角同时设置背景颜色，设置背景颜色不能生效
 @param corner 位置
 */
- (void)zpdrawRectWithRounded:(CGFloat)cornerRadius corner:(UIRectCorner)corner;


/**
 获取父控制器
 */
- (UIViewController *)superViewController;

//@property (nonatomic, assign) CGFloat GS_bottom;
@end

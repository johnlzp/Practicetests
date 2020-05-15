//
//  UIButton+ZPExtension.h
//  LeBen-Takeout
//
//  Created by OS on 2019/1/20.
//  Copyright © 2019年 单丶依. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
@interface UIButton (ZPExtension)
/** 设置可点击范围到按钮边缘的距离 */
- (void)setEnlargeEdge:(CGFloat)size;

/** 设置可点击范围到按钮上、右、下、左的距离 */
- (void)setEnlargeEdgeWithTop:(CGFloat)top right:(CGFloat)right bottom:(CGFloat)bottom left:(CGFloat)left;

/**图片居左，文字在右，垂直居中显示，间距为文字和图片之间的间距*/
- (void)setIconInLeftWithSpacing:(CGFloat)Spacing;

/**图片居右，文字在左，垂直居中显示*/
- (void)setIconInRightWithSpacing:(CGFloat)Spacing;

/**图片居上，文字在下，垂直居中显示*/
- (void)setIconInTopWithSpacing:(CGFloat)Spacing;

/**.图片居下，文字在上，垂直居中显示*/
- (void)setIconInBottomWithSpacing:(CGFloat)Spacing;
@end

//
//  UIImageView+maskLayer.h
//  quanzi
//
//  Created by 刘佳 on 18/3/12.
//  Copyright © 2018年 mi@prime. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (maskLayer)

/**
 绘制一个圆角的矩形

 @param cornerRadius 圆角的半径
 @return UIimageVIew
 */
- (UIImageView *)roundedRectImageViewWithCornerRadius:(CGFloat)cornerRadius;


/**
 画一个部分圆角的矩形
 
 @param corners 那些部位需要切圆角
 @param cornerRadius 圆角的size(如果要切成圆形就直接传view的size)
 @return UIimageView
 */
- (UIImageView *)roundedRectImageViewWithbyRoundingCorners:(UIRectCorner)corners CornerRadius:(CGSize)cornerRadius;
@end

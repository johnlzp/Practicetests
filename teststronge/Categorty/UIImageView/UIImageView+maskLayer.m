//
//  UIImageView+maskLayer.m
//  quanzi
//
//  Created by 刘佳 on 18/3/12.
//  Copyright © 2018年 mi@prime. All rights reserved.
//

#import "UIImageView+maskLayer.h"

@implementation UIImageView (maskLayer)

- (UIImageView *)roundedRectImageViewWithCornerRadius:(CGFloat)cornerRadius {
    // 新建一个bezier对象，此对象用于绘制一个圆角矩形
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:cornerRadius];
//    UIBezierPath *bezierPath  = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
    CAShapeLayer *layer = [CAShapeLayer layer];
    //设置图形样子
    layer.path = bezierPath.CGPath;
    self.layer.mask = layer;
    
    return self;
}

- (UIImageView *)roundedRectImageViewWithbyRoundingCorners:(UIRectCorner)corners CornerRadius:(CGSize)cornerRadius {
    //UIRectCornerAllCorners
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:cornerRadius];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
    //设置大小
    maskLayer.frame = self.bounds;
    //设置图形样子
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
    
    
    return self;
}



@end

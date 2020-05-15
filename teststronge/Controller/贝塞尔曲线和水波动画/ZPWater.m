//
//  ZPWater.m
//  teststronge
//
//  Created by OS on 2020/3/30.
//  Copyright © 2020 OS. All rights reserved.
//

#import "ZPWater.h"
#define BUTTONBLUECOLOR [UIColor colorWithHexString:@"#017AFC"]
/**每5个百分比的高度(152.68 / 65)*/
#define WaterH 2.35
@implementation ZPWater

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self configWater];
        [self configWaterBack];
    }
    return self;
}

- (void)configWater{
    UIColor* strokeColor = [UIColor colorWithRed: 0.004 green: 0.478 blue: 0.988 alpha: 1];
    UIColor* fillColor = [UIColor colorWithRed: 0.004 green: 0.478 blue: 0.988 alpha: 1];
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.frame = self.bounds;
     //水桶 X:0  Y:0  W:158.11  H:277.71 leftbucketPath
    UIBezierPath* leftbucketPath = [UIBezierPath bezierPath];
    [leftbucketPath moveToPoint: CGPointMake(77.72, 0)];
    [leftbucketPath addLineToPoint: CGPointMake(57.76, 0)];
    [leftbucketPath addLineToPoint: CGPointMake(57.76, 22.33)];
    [leftbucketPath addLineToPoint: CGPointMake(60.56, 22.33)];
    [leftbucketPath addLineToPoint: CGPointMake(60.56, 37.3)];
    [leftbucketPath addLineToPoint: CGPointMake(57.76, 37.3)];
    [leftbucketPath addLineToPoint: CGPointMake(57.76, 40.88)];
    [leftbucketPath addLineToPoint: CGPointMake(58.07, 40.87)];
    [leftbucketPath addCurveToPoint: CGPointMake(27.36, 49.49) controlPoint1: CGPointMake(47.3, 41.25) controlPoint2: CGPointMake(36.78, 44.21)];
    [leftbucketPath addCurveToPoint: CGPointMake(23.17, 52.08) controlPoint1: CGPointMake(26.16, 50.17) controlPoint2: CGPointMake(24.81, 50.98)];
    [leftbucketPath addLineToPoint: CGPointMake(22.98, 52.21)];
    [leftbucketPath addCurveToPoint: CGPointMake(5.19, 71.53) controlPoint1: CGPointMake(15.68, 57.2) controlPoint2: CGPointMake(9.59, 63.81)];
    [leftbucketPath addCurveToPoint: CGPointMake(1.56, 73.16) controlPoint1: CGPointMake(3.42, 72.03) controlPoint2: CGPointMake(3.19, 71.51)];
    [leftbucketPath addCurveToPoint: CGPointMake(0.01, 78.17) controlPoint1: CGPointMake(-0.06, 74.81) controlPoint2: CGPointMake(0.01, 78.17)];
    [leftbucketPath addLineToPoint: CGPointMake(0.01, 90.11)];
    [leftbucketPath addCurveToPoint: CGPointMake(1.56, 94.89) controlPoint1: CGPointMake(0.01, 90.11) controlPoint2: CGPointMake(-0.06, 93.43)];
    [leftbucketPath addLineToPoint: CGPointMake(1.55, 94.88)];
    [leftbucketPath addCurveToPoint: CGPointMake(5.12, 95.95) controlPoint1: CGPointMake(2.53, 95.75) controlPoint2: CGPointMake(3.83, 96.14)];
    [leftbucketPath addLineToPoint: CGPointMake(5.17, 129.36)];
    [leftbucketPath addLineToPoint: CGPointMake(5.14, 129.36)];
    [leftbucketPath addCurveToPoint: CGPointMake(1.58, 130.47) controlPoint1: CGPointMake(3.86, 129.27) controlPoint2: CGPointMake(2.59, 129.66)];
    [leftbucketPath addCurveToPoint: CGPointMake(0.01, 134.78) controlPoint1: CGPointMake(-0.06, 131.83) controlPoint2: CGPointMake(0.01, 134.78)];
    [leftbucketPath addLineToPoint: CGPointMake(0.01, 150.01)];
    [leftbucketPath addLineToPoint: CGPointMake(0.01, 149.98)];
    [leftbucketPath addCurveToPoint: CGPointMake(1.52, 154.57) controlPoint1: CGPointMake(-0.05, 151.64) controlPoint2: CGPointMake(0.49, 153.27)];
    [leftbucketPath addLineToPoint: CGPointMake(1.57, 154.63)];
    [leftbucketPath addCurveToPoint: CGPointMake(5.18, 155.92) controlPoint1: CGPointMake(2.48, 155.65) controlPoint2: CGPointMake(3.84, 156.14)];
    [leftbucketPath addLineToPoint: CGPointMake(5.17, 237.28)];
    [leftbucketPath addLineToPoint: CGPointMake(5.23, 237.27)];
    [leftbucketPath addCurveToPoint: CGPointMake(1.82, 238.77) controlPoint1: CGPointMake(3.98, 237.47) controlPoint2: CGPointMake(2.81, 237.99)];
    [leftbucketPath addLineToPoint: CGPointMake(1.85, 238.74)];
    [leftbucketPath addCurveToPoint: CGPointMake(0.01, 242.39) controlPoint1: CGPointMake(0.81, 239.69) controlPoint2: CGPointMake(0.16, 240.99)];
    [leftbucketPath addLineToPoint: CGPointMake(0.01, 266.46)];
    [leftbucketPath addCurveToPoint: CGPointMake(3.62, 275.35) controlPoint1: CGPointMake(0.01, 266.46) controlPoint2: CGPointMake(-0.33, 272.54)];
    [leftbucketPath addCurveToPoint: CGPointMake(14.46, 277.68) controlPoint1: CGPointMake(7.57, 278.15) controlPoint2: CGPointMake(14.46, 277.68)];
    [leftbucketPath addLineToPoint: CGPointMake(79.33, 277.68)];
    leftbucketPath.lineJoinStyle = kCGLineJoinRound;
    layer.fillColor = fillColor.CGColor;
    layer.backgroundColor = [UIColor clearColor].CGColor;
    layer.strokeColor = strokeColor.CGColor;
    layer.path = leftbucketPath.CGPath;
    [self.layer addSublayer:layer];
    

    //righttbucketPath
    CAShapeLayer *rightlayer = [CAShapeLayer layer];
    rightlayer.frame = self.bounds;
    UIBezierPath* righttbucketPath = [UIBezierPath bezierPath];
    [righttbucketPath moveToPoint: CGPointMake(76.72, 0)];
    [righttbucketPath addLineToPoint: CGPointMake(100.35, 0)];
    [righttbucketPath addLineToPoint: CGPointMake(100.35, 22.33)];
    [righttbucketPath addLineToPoint: CGPointMake(97.55, 22.33)];
    [righttbucketPath addLineToPoint: CGPointMake(97.55, 37.3)];
    [righttbucketPath addLineToPoint: CGPointMake(100.35, 37.3)];
    [righttbucketPath addLineToPoint: CGPointMake(100.35, 40.88)];
    [righttbucketPath addCurveToPoint: CGPointMake(152.94, 71.57) controlPoint1: CGPointMake(100.35, 40.88) controlPoint2: CGPointMake(135.1, 40.62)];
    [righttbucketPath addCurveToPoint: CGPointMake(156.55, 73.16) controlPoint1: CGPointMake(154.69, 72.03) controlPoint2: CGPointMake(154.92, 71.51)];
    [righttbucketPath addCurveToPoint: CGPointMake(158.1, 78.17) controlPoint1: CGPointMake(158.17, 74.81) controlPoint2: CGPointMake(158.1, 78.17)];
    [righttbucketPath addLineToPoint: CGPointMake(158.1, 90.11)];
    [righttbucketPath addCurveToPoint: CGPointMake(156.55, 94.89) controlPoint1: CGPointMake(158.1, 90.11) controlPoint2: CGPointMake(158.17, 93.43)];
    [righttbucketPath addLineToPoint: CGPointMake(156.56, 94.88)];
    [righttbucketPath addCurveToPoint: CGPointMake(152.99, 95.95) controlPoint1: CGPointMake(155.58, 95.75) controlPoint2: CGPointMake(154.28, 96.14)];
    [righttbucketPath addLineToPoint: CGPointMake(152.94, 129.36)];
    [righttbucketPath addLineToPoint: CGPointMake(152.97, 129.36)];
    [righttbucketPath addCurveToPoint: CGPointMake(156.53, 130.47) controlPoint1: CGPointMake(154.25, 129.27) controlPoint2: CGPointMake(155.52, 129.66)];
    [righttbucketPath addCurveToPoint: CGPointMake(158.1, 134.78) controlPoint1: CGPointMake(158.17, 131.83) controlPoint2: CGPointMake(158.1, 134.78)];
    [righttbucketPath addLineToPoint: CGPointMake(158.1, 150.01)];
    [righttbucketPath addLineToPoint: CGPointMake(158.1, 149.98)];
    [righttbucketPath addCurveToPoint: CGPointMake(156.58, 154.57) controlPoint1: CGPointMake(158.16, 151.65) controlPoint2: CGPointMake(157.62, 153.28)];
    [righttbucketPath addLineToPoint: CGPointMake(156.54, 154.63)];
    [righttbucketPath addCurveToPoint: CGPointMake(152.93, 155.92) controlPoint1: CGPointMake(155.63, 155.65) controlPoint2: CGPointMake(154.27, 156.14)];
    [righttbucketPath addLineToPoint: CGPointMake(152.94, 237.28)];
    [righttbucketPath addLineToPoint: CGPointMake(152.88, 237.27)];
    [righttbucketPath addCurveToPoint: CGPointMake(156.29, 238.77) controlPoint1: CGPointMake(154.12, 237.47) controlPoint2: CGPointMake(155.3, 237.99)];
    [righttbucketPath addLineToPoint: CGPointMake(156.26, 238.75)];
    [righttbucketPath addCurveToPoint: CGPointMake(158.1, 242.39) controlPoint1: CGPointMake(157.3, 239.69) controlPoint2: CGPointMake(157.95, 240.99)];
    [righttbucketPath addLineToPoint: CGPointMake(158.1, 266.46)];
    [righttbucketPath addCurveToPoint: CGPointMake(154.49, 275.35) controlPoint1: CGPointMake(158.1, 266.46) controlPoint2: CGPointMake(158.43, 272.54)];
    [righttbucketPath addCurveToPoint: CGPointMake(143.65, 277.68) controlPoint1: CGPointMake(150.54, 278.15) controlPoint2: CGPointMake(143.65, 277.68)];
    [righttbucketPath addLineToPoint: CGPointMake(78.77, 277.68)];
    righttbucketPath.lineJoinStyle = kCGLineJoinRound;
    
//    [leftbucketPath appendPath:righttbucketPath];
    rightlayer.fillColor = fillColor.CGColor;
    rightlayer.backgroundColor = [UIColor clearColor].CGColor;
    rightlayer.strokeColor = strokeColor.CGColor;
    rightlayer.path = righttbucketPath.CGPath;
    [self.layer addSublayer:rightlayer];

}

//水波  X:5  Y:114.55  W:148.72  H:152.86  %65
- (void)configWaterBack{
    NSInteger level = 15;
     CGFloat h = WaterH * level;  //205 - 11.54 = 193.46
     //267.4(255.86) - 118.69
     UIColor* fillColor = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 0.2];
     //凸
     UIBezierPath* leftWaterPath = [UIBezierPath bezierPath];
     //顶部的4个点 5,118.69   47.92,118.69  113.22,118.69  153.72,118.69(顺时针)
     [leftWaterPath moveToPoint: CGPointMake(5, 118.69)];
     [leftWaterPath addCurveToPoint: CGPointMake(47.92, 118.69) controlPoint1: CGPointMake(5, 118.69) controlPoint2: CGPointMake(18.71, 125.39)];
     [leftWaterPath addCurveToPoint: CGPointMake(113.22, 118.69) controlPoint1: CGPointMake(77.12, 111.99) controlPoint2: CGPointMake(87.58, 110.27)];
     [leftWaterPath addCurveToPoint: CGPointMake(153.72, 118.69) controlPoint1: CGPointMake(138.86, 127.11) controlPoint2: CGPointMake(153.72, 118.69)];
     //等于0 的底部右侧三个拐点(顺时针)
     [leftWaterPath addLineToPoint: CGPointMake(153.72, 255.04)];
     [leftWaterPath addCurveToPoint: CGPointMake(150.22, 263.77) controlPoint1: CGPointMake(153.72, 255.04) controlPoint2: CGPointMake(153.41, 260.68)];
     [leftWaterPath addCurveToPoint: CGPointMake(140.94, 267.4) controlPoint1: CGPointMake(147.03, 266.86) controlPoint2: CGPointMake(140.94, 267.4)];
     //等于0 的底部左侧三个拐点(顺时针)
     [leftWaterPath addLineToPoint: CGPointMake(18.11, 267.4)];
     [leftWaterPath addCurveToPoint: CGPointMake(8.62, 263.97) controlPoint1: CGPointMake(18.11, 267.4) controlPoint2: CGPointMake(11.9, 266.87)];
     [leftWaterPath addCurveToPoint: CGPointMake(5, 255.81) controlPoint1: CGPointMake(5.34, 261.07) controlPoint2: CGPointMake(5, 255.81)];
     //65的左侧顶点
     [leftWaterPath addLineToPoint: CGPointMake(5, 118.69)];

    CAShapeLayer *layer = [CAShapeLayer layer];
     layer.frame = self.bounds;
     [leftWaterPath closePath];
     layer.fillColor = fillColor.CGColor;
     layer.backgroundColor = [UIColor clearColor].CGColor;
     layer.path = leftWaterPath.CGPath;
     [self.layer addSublayer:layer];
     
     
     //凹
     UIBezierPath* rightWaterPath = [UIBezierPath bezierPath];
     //顶部的4个点 5,118.69   47.92,118.69  113.22,118.69  153.72,118.69(顺时针)
     [rightWaterPath moveToPoint: CGPointMake(5, 118.69)];
     [rightWaterPath addCurveToPoint: CGPointMake(47.92, 118.69) controlPoint1: CGPointMake(5, 118.69) controlPoint2: CGPointMake(16.94, 109.95)];
     [rightWaterPath addCurveToPoint: CGPointMake(113.22, 118.69) controlPoint1: CGPointMake(78.9, 127.43) controlPoint2: CGPointMake(85.18, 128.01)];
     [rightWaterPath addCurveToPoint: CGPointMake(153.72, 118.69) controlPoint1: CGPointMake(141.26, 109.37) controlPoint2: CGPointMake(153.72, 118.69)];
      //等于0 的底部右侧三个拐点(顺时针)
     // 153.72,253.24   150.23,263.88   138.98,267.41
     [rightWaterPath addLineToPoint: CGPointMake(153.72, 253.24)];
     [rightWaterPath addCurveToPoint: CGPointMake(150.23, 263.88) controlPoint1: CGPointMake(153.72, 253.24) controlPoint2: CGPointMake(153.92, 260.34)];
     [rightWaterPath addCurveToPoint: CGPointMake(138.98, 267.41) controlPoint1: CGPointMake(146.54, 267.42) controlPoint2: CGPointMake(138.98, 267.41)];
     //等于0 的底部左侧三个拐点(顺时针)
     [rightWaterPath addLineToPoint: CGPointMake(17.22, 267.41)];
     [rightWaterPath addCurveToPoint: CGPointMake(8.42, 263.77) controlPoint1: CGPointMake(17.22, 267.41) controlPoint2: CGPointMake(11.48, 266.65)];
     [rightWaterPath addCurveToPoint: CGPointMake(5, 255.86) controlPoint1: CGPointMake(5.37, 260.88) controlPoint2: CGPointMake(5, 255.86)];
     //65的左侧顶点
     [rightWaterPath addLineToPoint: CGPointMake(5, 118.69)];
     CAShapeLayer *rightlayer = [CAShapeLayer layer];
     rightlayer.frame = self.bounds;
     [rightWaterPath closePath];
     rightlayer.fillColor = fillColor.CGColor;
     rightlayer.backgroundColor = [UIColor clearColor].CGColor;
     rightlayer.path = rightWaterPath.CGPath;
     [self.layer addSublayer:rightlayer];
    
   
}

//- (void)drawRect:(CGRect)rect {
//    UIColor* strokeColor = [UIColor colorWithRed: 0.004 green: 0.478 blue: 0.988 alpha: 1];
//    UIColor* fillColor = [UIColor colorWithRed: 0.004 green: 0.478 blue: 0.988 alpha: 1];
//     //水桶 X:0  Y:0  W:158.8  H:277.71 leftbucketPath
//    UIBezierPath* leftbucketPath = [UIBezierPath bezierPath];
//   [leftbucketPath moveToPoint: CGPointMake(77.72, 0)];
//    [leftbucketPath addLineToPoint: CGPointMake(57.76, 0)];
//    [leftbucketPath addLineToPoint: CGPointMake(57.76, 22.33)];
//    [leftbucketPath addLineToPoint: CGPointMake(60.56, 22.33)];
//    [leftbucketPath addLineToPoint: CGPointMake(60.56, 37.3)];
//    [leftbucketPath addLineToPoint: CGPointMake(57.76, 37.3)];
//    [leftbucketPath addLineToPoint: CGPointMake(57.76, 40.88)];
//    [leftbucketPath addLineToPoint: CGPointMake(58.07, 40.87)];
//    [leftbucketPath addCurveToPoint: CGPointMake(27.36, 49.49) controlPoint1: CGPointMake(47.3, 41.25) controlPoint2: CGPointMake(36.78, 44.21)];
//    [leftbucketPath addCurveToPoint: CGPointMake(23.17, 52.08) controlPoint1: CGPointMake(26.16, 50.17) controlPoint2: CGPointMake(24.81, 50.98)];
//    [leftbucketPath addLineToPoint: CGPointMake(22.98, 52.21)];
//    [leftbucketPath addCurveToPoint: CGPointMake(5.19, 71.53) controlPoint1: CGPointMake(15.68, 57.2) controlPoint2: CGPointMake(9.59, 63.81)];
//    [leftbucketPath addCurveToPoint: CGPointMake(1.56, 73.16) controlPoint1: CGPointMake(3.42, 72.03) controlPoint2: CGPointMake(3.19, 71.51)];
//    [leftbucketPath addCurveToPoint: CGPointMake(0.01, 78.17) controlPoint1: CGPointMake(-0.06, 74.81) controlPoint2: CGPointMake(0.01, 78.17)];
//    [leftbucketPath addLineToPoint: CGPointMake(0.01, 90.11)];
//    [leftbucketPath addCurveToPoint: CGPointMake(1.56, 94.89) controlPoint1: CGPointMake(0.01, 90.11) controlPoint2: CGPointMake(-0.06, 93.43)];
//    [leftbucketPath addLineToPoint: CGPointMake(1.55, 94.88)];
//    [leftbucketPath addCurveToPoint: CGPointMake(5.12, 95.95) controlPoint1: CGPointMake(2.53, 95.75) controlPoint2: CGPointMake(3.83, 96.14)];
//    [leftbucketPath addLineToPoint: CGPointMake(5.17, 129.36)];
//    [leftbucketPath addLineToPoint: CGPointMake(5.14, 129.36)];
//    [leftbucketPath addCurveToPoint: CGPointMake(1.58, 130.47) controlPoint1: CGPointMake(3.86, 129.27) controlPoint2: CGPointMake(2.59, 129.66)];
//    [leftbucketPath addCurveToPoint: CGPointMake(0.01, 134.78) controlPoint1: CGPointMake(-0.06, 131.83) controlPoint2: CGPointMake(0.01, 134.78)];
//    [leftbucketPath addLineToPoint: CGPointMake(0.01, 150.01)];
//    [leftbucketPath addLineToPoint: CGPointMake(0.01, 149.98)];
//    [leftbucketPath addCurveToPoint: CGPointMake(1.52, 154.57) controlPoint1: CGPointMake(-0.05, 151.64) controlPoint2: CGPointMake(0.49, 153.27)];
//    [leftbucketPath addLineToPoint: CGPointMake(1.57, 154.63)];
//    [leftbucketPath addCurveToPoint: CGPointMake(5.18, 155.92) controlPoint1: CGPointMake(2.48, 155.65) controlPoint2: CGPointMake(3.84, 156.14)];
//    [leftbucketPath addLineToPoint: CGPointMake(5.17, 237.28)];
//    [leftbucketPath addLineToPoint: CGPointMake(5.23, 237.27)];
//    [leftbucketPath addCurveToPoint: CGPointMake(1.82, 238.77) controlPoint1: CGPointMake(3.98, 237.47) controlPoint2: CGPointMake(2.81, 237.99)];
//    [leftbucketPath addLineToPoint: CGPointMake(1.85, 238.74)];
//    [leftbucketPath addCurveToPoint: CGPointMake(0.01, 242.39) controlPoint1: CGPointMake(0.81, 239.69) controlPoint2: CGPointMake(0.16, 240.99)];
//    [leftbucketPath addLineToPoint: CGPointMake(0.01, 266.46)];
//    [leftbucketPath addCurveToPoint: CGPointMake(3.62, 275.35) controlPoint1: CGPointMake(0.01, 266.46) controlPoint2: CGPointMake(-0.33, 272.54)];
//    [leftbucketPath addCurveToPoint: CGPointMake(14.46, 277.68) controlPoint1: CGPointMake(7.57, 278.15) controlPoint2: CGPointMake(14.46, 277.68)];
//    [leftbucketPath addLineToPoint: CGPointMake(79.33, 277.68)];
//    [fillColor setFill];
//    [leftbucketPath fill];
//    [strokeColor setStroke];
//    leftbucketPath.lineWidth = 3;
//    leftbucketPath.miterLimit = 4;
//    leftbucketPath.lineJoinStyle = kCGLineJoinRound;
//    [leftbucketPath stroke];
//
//
//    //// 路径_24410 Drawing
//    UIBezierPath* righttbucketPath = [UIBezierPath bezierPath];
//    [righttbucketPath moveToPoint: CGPointMake(77.72, 0)];
//    [righttbucketPath addLineToPoint: CGPointMake(100.35, 0)];
//    [righttbucketPath addLineToPoint: CGPointMake(100.35, 22.33)];
//    [righttbucketPath addLineToPoint: CGPointMake(97.55, 22.33)];
//    [righttbucketPath addLineToPoint: CGPointMake(97.55, 37.3)];
//    [righttbucketPath addLineToPoint: CGPointMake(100.35, 37.3)];
//    [righttbucketPath addLineToPoint: CGPointMake(100.35, 40.88)];
//    [righttbucketPath addCurveToPoint: CGPointMake(152.94, 71.57) controlPoint1: CGPointMake(100.35, 40.88) controlPoint2: CGPointMake(135.1, 40.62)];
//    [righttbucketPath addCurveToPoint: CGPointMake(156.55, 73.16) controlPoint1: CGPointMake(154.69, 72.03) controlPoint2: CGPointMake(154.92, 71.51)];
//    [righttbucketPath addCurveToPoint: CGPointMake(158.1, 78.17) controlPoint1: CGPointMake(158.17, 74.81) controlPoint2: CGPointMake(158.1, 78.17)];
//    [righttbucketPath addLineToPoint: CGPointMake(158.1, 90.11)];
//    [righttbucketPath addCurveToPoint: CGPointMake(156.55, 94.89) controlPoint1: CGPointMake(158.1, 90.11) controlPoint2: CGPointMake(158.17, 93.43)];
//    [righttbucketPath addLineToPoint: CGPointMake(156.56, 94.88)];
//    [righttbucketPath addCurveToPoint: CGPointMake(152.99, 95.95) controlPoint1: CGPointMake(155.58, 95.75) controlPoint2: CGPointMake(154.28, 96.14)];
//    [righttbucketPath addLineToPoint: CGPointMake(152.94, 129.36)];
//    [righttbucketPath addLineToPoint: CGPointMake(152.97, 129.36)];
//    [righttbucketPath addCurveToPoint: CGPointMake(156.53, 130.47) controlPoint1: CGPointMake(154.25, 129.27) controlPoint2: CGPointMake(155.52, 129.66)];
//    [righttbucketPath addCurveToPoint: CGPointMake(158.1, 134.78) controlPoint1: CGPointMake(158.17, 131.83) controlPoint2: CGPointMake(158.1, 134.78)];
//    [righttbucketPath addLineToPoint: CGPointMake(158.1, 150.01)];
//    [righttbucketPath addLineToPoint: CGPointMake(158.1, 149.98)];
//    [righttbucketPath addCurveToPoint: CGPointMake(156.58, 154.57) controlPoint1: CGPointMake(158.16, 151.65) controlPoint2: CGPointMake(157.62, 153.28)];
//    [righttbucketPath addLineToPoint: CGPointMake(156.54, 154.63)];
//    [righttbucketPath addCurveToPoint: CGPointMake(152.93, 155.92) controlPoint1: CGPointMake(155.63, 155.65) controlPoint2: CGPointMake(154.27, 156.14)];
//    [righttbucketPath addLineToPoint: CGPointMake(152.94, 237.28)];
//    [righttbucketPath addLineToPoint: CGPointMake(152.88, 237.27)];
//    [righttbucketPath addCurveToPoint: CGPointMake(156.29, 238.77) controlPoint1: CGPointMake(154.12, 237.47) controlPoint2: CGPointMake(155.3, 237.99)];
//    [righttbucketPath addLineToPoint: CGPointMake(156.26, 238.75)];
//    [righttbucketPath addCurveToPoint: CGPointMake(158.1, 242.39) controlPoint1: CGPointMake(157.3, 239.69) controlPoint2: CGPointMake(157.95, 240.99)];
//    [righttbucketPath addLineToPoint: CGPointMake(158.1, 266.46)];
//    [righttbucketPath addCurveToPoint: CGPointMake(154.49, 275.35) controlPoint1: CGPointMake(158.1, 266.46) controlPoint2: CGPointMake(158.43, 272.54)];
//    [righttbucketPath addCurveToPoint: CGPointMake(143.65, 277.68) controlPoint1: CGPointMake(150.54, 278.15) controlPoint2: CGPointMake(143.65, 277.68)];
//    [righttbucketPath addLineToPoint: CGPointMake(78.77, 277.68)];
//    [fillColor setFill];
//    [righttbucketPath fill];
//    [strokeColor setStroke];
//    righttbucketPath.lineWidth = 3;
//    righttbucketPath.miterLimit = 4;
//    righttbucketPath.lineJoinStyle = kCGLineJoinRound;
//    [righttbucketPath stroke];
//
//
//    //水波  X:5  Y:113  W:148.72  H:154.41
//    CGContextRef context = UIGraphicsGetCurrentContext();
//
//    //// Color Declarations
//    UIColor* fillColor3 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
//    //保存图像上下文状态
//    CGContextSaveGState(context);
//    CGContextSetAlpha(context, 0.2);
//    //leftWaterPath
//    UIBezierPath* leftWaterPath = [UIBezierPath bezierPath];
//    [leftWaterPath moveToPoint: CGPointMake(5, 118.69)];
//    [leftWaterPath addCurveToPoint: CGPointMake(47.92, 118.69) controlPoint1: CGPointMake(5, 118.69) controlPoint2: CGPointMake(18.71, 125.39)];
//    [leftWaterPath addCurveToPoint: CGPointMake(113.22, 118.69) controlPoint1: CGPointMake(77.12, 111.99) controlPoint2: CGPointMake(87.58, 110.27)];
//    [leftWaterPath addCurveToPoint: CGPointMake(153.72, 118.69) controlPoint1: CGPointMake(138.86, 127.11) controlPoint2: CGPointMake(153.72, 118.69)];
//    [leftWaterPath addLineToPoint: CGPointMake(153.72, 255.04)];
//    [leftWaterPath addCurveToPoint: CGPointMake(150.22, 263.77) controlPoint1: CGPointMake(153.72, 255.04) controlPoint2: CGPointMake(153.41, 260.68)];
//    [leftWaterPath addCurveToPoint: CGPointMake(140.94, 267.4) controlPoint1: CGPointMake(147.03, 266.86) controlPoint2: CGPointMake(140.94, 267.4)];
//    [leftWaterPath addLineToPoint: CGPointMake(18.11, 267.4)];
//    [leftWaterPath addCurveToPoint: CGPointMake(8.62, 263.97) controlPoint1: CGPointMake(18.11, 267.4) controlPoint2: CGPointMake(11.9, 266.87)];
//    [leftWaterPath addCurveToPoint: CGPointMake(5, 255.81) controlPoint1: CGPointMake(5.34, 261.07) controlPoint2: CGPointMake(5, 255.81)];
//    [leftWaterPath addLineToPoint: CGPointMake(5, 118.69)];

//    [leftWaterPath closePath];
//    [fillColor3 setFill];
//    [leftWaterPath fill];
//
//    CGContextRestoreGState(context);
//
//
//    //// 路径_24413 Drawing
//    CGContextSaveGState(context);
//    CGContextSetAlpha(context, 0.2);
//
//    UIBezierPath* rightWaterPath = [UIBezierPath bezierPath];
//    [rightWaterPath moveToPoint: CGPointMake(5, 118.69)];
//    [rightWaterPath addCurveToPoint: CGPointMake(47.92, 118.69) controlPoint1: CGPointMake(5, 118.69) controlPoint2: CGPointMake(16.94, 109.95)];
//    [rightWaterPath addCurveToPoint: CGPointMake(113.22, 118.69) controlPoint1: CGPointMake(78.9, 127.43) controlPoint2: CGPointMake(85.18, 128.01)];
//    [rightWaterPath addCurveToPoint: CGPointMake(153.72, 118.69) controlPoint1: CGPointMake(141.26, 109.37) controlPoint2: CGPointMake(153.72, 118.69)];
//    [rightWaterPath addLineToPoint: CGPointMake(153.72, 253.24)];
//    [rightWaterPath addCurveToPoint: CGPointMake(150.23, 263.88) controlPoint1: CGPointMake(153.72, 253.24) controlPoint2: CGPointMake(153.92, 260.34)];
//    [rightWaterPath addCurveToPoint: CGPointMake(138.98, 267.41) controlPoint1: CGPointMake(146.54, 267.42) controlPoint2: CGPointMake(138.98, 267.41)];
//    [rightWaterPath addLineToPoint: CGPointMake(17.22, 267.41)];
//    [rightWaterPath addCurveToPoint: CGPointMake(8.42, 263.77) controlPoint1: CGPointMake(17.22, 267.41) controlPoint2: CGPointMake(11.48, 266.65)];
//    [rightWaterPath addCurveToPoint: CGPointMake(5, 255.86) controlPoint1: CGPointMake(5.37, 260.88) controlPoint2: CGPointMake(5, 255.86)];
//    [rightWaterPath addLineToPoint: CGPointMake(5, 118.69)];
//    [rightWaterPath closePath];
//    [fillColor3 setFill];
//    [rightWaterPath fill];
//
//    CGContextRestoreGState(context);
//}

- (void)dealloc{
    NSLog(@"水页面销毁");
}

@end

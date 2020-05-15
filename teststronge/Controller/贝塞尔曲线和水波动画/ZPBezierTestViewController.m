//
//  ZPBezierTestViewController.m
//  teststronge
//
//  Created by OS on 2020/3/30.
//  Copyright © 2020 OS. All rights reserved.
//

#import "ZPBezierTestViewController.h"
#import "ZPBezierView.h"
#import "ZPWater.h"

@interface ZPBezierTestViewController ()

@end

@implementation ZPBezierTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self test];
//    [self configView];
//    ZPWater *view = [[ZPWater alloc]initWithFrame:self.view.bounds];
//    view.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:view];
    
    [self test2];
    [self test3];
    [self test4];
}

- (void)test6{
    
}
    
- (void)test2{
    //空心矩形
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.frame = self.view.bounds;
    UIBezierPath *SquerPath = [UIBezierPath bezierPathWithRect:CGRectMake(60, 10, 50, 50)];
    layer.strokeColor = [UIColor greenColor].CGColor;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.lineWidth = 2.0;
    layer.path = SquerPath.CGPath;
    [self.view.layer addSublayer:layer];
    
    //空心圆
    CAShapeLayer *circlelayer = [CAShapeLayer layer];
    circlelayer.frame = self.view.bounds;
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(110, 10, 50, 50)];
    circlelayer.strokeColor = [UIColor greenColor].CGColor;
    circlelayer.fillColor = [UIColor clearColor].CGColor;
    circlelayer.lineWidth = 2.0;
    circlelayer.path = circlePath.CGPath;
    [self.view.layer addSublayer:circlelayer];
    
}

- (void)test3{
    //弧线
    CGPoint startPoint = CGPointMake(50, 300);
    CGPoint endPoint = CGPointMake(300, 300);
    CGPoint controlPoint = CGPointMake(170, 200);
    CAShapeLayer *layer1 = [CAShapeLayer layer];
    layer1.frame = CGRectMake(startPoint.x, startPoint.y, 5, 5);
    layer1.backgroundColor = [UIColor yellowColor].CGColor;

    CAShapeLayer *layer2 = [CAShapeLayer layer];
    layer2.frame = CGRectMake(endPoint.x, endPoint.y, 5, 5);
    layer2.backgroundColor =[UIColor redColor].CGColor;

    CAShapeLayer *layer3 = [CAShapeLayer layer];
    layer3.frame = CGRectMake(controlPoint.x, controlPoint.y, 5, 5);
    layer3.backgroundColor = [UIColor redColor].CGColor;
    
    CAShapeLayer *arcLayer = [CAShapeLayer layer];
    arcLayer.frame = self.view.bounds;
    UIBezierPath *arcPath = [UIBezierPath bezierPath];
    [arcPath moveToPoint:startPoint];
//    arcLayer.strokeColor = [UIColor blackColor].CGColor;
//    arcLayer.fillColor = [UIColor clearColor].CGColor;
    arcLayer.strokeColor = [UIColor blueColor].CGColor;
    arcLayer.fillColor = [UIColor clearColor].CGColor;
    [arcPath addQuadCurveToPoint:endPoint controlPoint:controlPoint];
    arcLayer.path = arcPath.CGPath;
    [self.view.layer addSublayer:arcLayer];
    [self.view.layer addSublayer:layer1];
    [self.view.layer addSublayer:layer2];
    [self.view.layer addSublayer:layer3];
}

- (void)test4{
    //弧线动画
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"strokeEnd";
    animation.fromValue = 0;
    animation.toValue = @(1);
    animation.duration = 2;
    [self.view.layer addAnimation:animation forKey:@"strokeEnd"];
}

- (void)test5{
    //半弧
    CGSize viewSize = CGSizeMake(300, 400);
    CGFloat layerHeight = viewSize.height * 0.2;
    CAShapeLayer *layer = [CAShapeLayer layer];
    UIBezierPath *path = [UIBezierPath bezierPath];
//    path moveToPoint:CGPointMake(0, <#CGFloat y#>)
}

//水桶 X:0  Y:0  W:158.8  H:277.71
- (void)test{
    UIColor* strokeColor = [UIColor colorWithRed: 0.004 green: 0.478 blue: 0.988 alpha: 1];
    UIColor* fillColor = [UIColor colorWithRed: 0.004 green: 0.478 blue: 0.988 alpha: 1];
    // 路径_24409 Drawing
    UIBezierPath* _24409Path = [UIBezierPath bezierPath];
   [_24409Path moveToPoint: CGPointMake(78.7, 0)];
   [_24409Path addLineToPoint: CGPointMake(58.49, 0)];
   [_24409Path addLineToPoint: CGPointMake(58.49, 22.33)];
   [_24409Path addLineToPoint: CGPointMake(61.33, 22.33)];
   [_24409Path addLineToPoint: CGPointMake(61.33, 37.3)];
   [_24409Path addLineToPoint: CGPointMake(58.49, 37.3)];
   [_24409Path addLineToPoint: CGPointMake(58.49, 40.88)];
   [_24409Path addLineToPoint: CGPointMake(58.8, 40.87)];
   [_24409Path addCurveToPoint: CGPointMake(27.71, 49.49) controlPoint1: CGPointMake(47.9, 41.25) controlPoint2: CGPointMake(37.25, 44.21)];
   [_24409Path addCurveToPoint: CGPointMake(23.46, 52.08) controlPoint1: CGPointMake(26.49, 50.17) controlPoint2: CGPointMake(25.13, 50.98)];
   [_24409Path addLineToPoint: CGPointMake(23.27, 52.21)];
   [_24409Path addCurveToPoint: CGPointMake(5.26, 71.53) controlPoint1: CGPointMake(15.88, 57.2) controlPoint2: CGPointMake(9.72, 63.81)];
   [_24409Path addCurveToPoint: CGPointMake(1.58, 73.16) controlPoint1: CGPointMake(3.47, 72.03) controlPoint2: CGPointMake(3.23, 71.51)];
   [_24409Path addCurveToPoint: CGPointMake(0.01, 78.17) controlPoint1: CGPointMake(-0.06, 74.81) controlPoint2: CGPointMake(0.01, 78.17)];
   [_24409Path addLineToPoint: CGPointMake(0.01, 90.11)];
   [_24409Path addCurveToPoint: CGPointMake(1.58, 94.89) controlPoint1: CGPointMake(0.01, 90.11) controlPoint2: CGPointMake(-0.06, 93.43)];
   [_24409Path addLineToPoint: CGPointMake(1.57, 94.88)];
   [_24409Path addCurveToPoint: CGPointMake(5.19, 95.95) controlPoint1: CGPointMake(2.56, 95.75) controlPoint2: CGPointMake(3.88, 96.14)];
   [_24409Path addLineToPoint: CGPointMake(5.24, 129.36)];
   [_24409Path addLineToPoint: CGPointMake(5.21, 129.36)];
   [_24409Path addCurveToPoint: CGPointMake(1.6, 130.47) controlPoint1: CGPointMake(3.91, 129.27) controlPoint2: CGPointMake(2.62, 129.66)];
   [_24409Path addCurveToPoint: CGPointMake(0.01, 134.78) controlPoint1: CGPointMake(-0.06, 131.83) controlPoint2: CGPointMake(0.01, 134.78)];
   [_24409Path addLineToPoint: CGPointMake(0.01, 150.01)];
   [_24409Path addLineToPoint: CGPointMake(0.01, 149.98)];
   [_24409Path addCurveToPoint: CGPointMake(1.54, 154.57) controlPoint1: CGPointMake(-0.05, 151.64) controlPoint2: CGPointMake(0.5, 153.27)];
   [_24409Path addLineToPoint: CGPointMake(1.59, 154.63)];
   [_24409Path addCurveToPoint: CGPointMake(5.25, 155.92) controlPoint1: CGPointMake(2.51, 155.65) controlPoint2: CGPointMake(3.89, 156.14)];
   [_24409Path addLineToPoint: CGPointMake(5.24, 237.28)];
   [_24409Path addLineToPoint: CGPointMake(5.29, 237.27)];
   [_24409Path addCurveToPoint: CGPointMake(1.84, 238.77) controlPoint1: CGPointMake(4.03, 237.47) controlPoint2: CGPointMake(2.85, 237.99)];
   [_24409Path addLineToPoint: CGPointMake(1.87, 238.74)];
   [_24409Path addCurveToPoint: CGPointMake(0.01, 242.39) controlPoint1: CGPointMake(0.82, 239.69) controlPoint2: CGPointMake(0.16, 240.99)];
   [_24409Path addLineToPoint: CGPointMake(0.01, 266.46)];
   [_24409Path addCurveToPoint: CGPointMake(3.67, 275.35) controlPoint1: CGPointMake(0.01, 266.46) controlPoint2: CGPointMake(-0.33, 272.54)];
   [_24409Path addCurveToPoint: CGPointMake(14.65, 277.68) controlPoint1: CGPointMake(7.67, 278.15) controlPoint2: CGPointMake(14.65, 277.68)];
   [_24409Path addLineToPoint: CGPointMake(80.34, 277.68)];
   [fillColor setFill];
   [_24409Path fill];
   [strokeColor setStroke];
   _24409Path.lineWidth = 3;
   _24409Path.miterLimit = 4;
   _24409Path.lineJoinStyle = kCGLineJoinRound;
   [_24409Path stroke];


   //// 路径_24410 Drawing
   UIBezierPath* _24410Path = [UIBezierPath bezierPath];
   [_24410Path moveToPoint: CGPointMake(77.39, 0)];
   [_24410Path addLineToPoint: CGPointMake(100.31, 0)];
   [_24410Path addLineToPoint: CGPointMake(100.31, 22.33)];
   [_24410Path addLineToPoint: CGPointMake(97.47, 22.33)];
   [_24410Path addLineToPoint: CGPointMake(97.47, 37.3)];
   [_24410Path addLineToPoint: CGPointMake(100.31, 37.3)];
   [_24410Path addLineToPoint: CGPointMake(100.31, 40.88)];
   [_24410Path addCurveToPoint: CGPointMake(153.57, 71.57) controlPoint1: CGPointMake(100.31, 40.88) controlPoint2: CGPointMake(135.5, 40.62)];
   [_24410Path addCurveToPoint: CGPointMake(157.22, 73.16) controlPoint1: CGPointMake(155.34, 72.03) controlPoint2: CGPointMake(155.58, 71.51)];
   [_24410Path addCurveToPoint: CGPointMake(158.79, 78.17) controlPoint1: CGPointMake(158.87, 74.81) controlPoint2: CGPointMake(158.79, 78.17)];
   [_24410Path addLineToPoint: CGPointMake(158.79, 90.11)];
   [_24410Path addCurveToPoint: CGPointMake(157.22, 94.89) controlPoint1: CGPointMake(158.79, 90.11) controlPoint2: CGPointMake(158.86, 93.43)];
   [_24410Path addLineToPoint: CGPointMake(157.23, 94.88)];
   [_24410Path addCurveToPoint: CGPointMake(153.61, 95.95) controlPoint1: CGPointMake(156.24, 95.75) controlPoint2: CGPointMake(154.92, 96.14)];
   [_24410Path addLineToPoint: CGPointMake(153.57, 129.36)];
   [_24410Path addLineToPoint: CGPointMake(153.59, 129.36)];
   [_24410Path addCurveToPoint: CGPointMake(157.21, 130.47) controlPoint1: CGPointMake(154.89, 129.27) controlPoint2: CGPointMake(156.18, 129.66)];
   [_24410Path addCurveToPoint: CGPointMake(158.79, 134.78) controlPoint1: CGPointMake(158.87, 131.83) controlPoint2: CGPointMake(158.79, 134.78)];
   [_24410Path addLineToPoint: CGPointMake(158.79, 150.01)];
   [_24410Path addLineToPoint: CGPointMake(158.79, 149.98)];
   [_24410Path addCurveToPoint: CGPointMake(157.26, 154.57) controlPoint1: CGPointMake(158.85, 151.65) controlPoint2: CGPointMake(158.3, 153.28)];
   [_24410Path addLineToPoint: CGPointMake(157.21, 154.63)];
   [_24410Path addCurveToPoint: CGPointMake(153.55, 155.92) controlPoint1: CGPointMake(156.29, 155.65) controlPoint2: CGPointMake(154.91, 156.14)];
   [_24410Path addLineToPoint: CGPointMake(153.57, 237.28)];
   [_24410Path addLineToPoint: CGPointMake(153.51, 237.27)];
   [_24410Path addCurveToPoint: CGPointMake(156.96, 238.77) controlPoint1: CGPointMake(154.77, 237.47) controlPoint2: CGPointMake(155.95, 237.99)];
   [_24410Path addLineToPoint: CGPointMake(156.93, 238.75)];
   [_24410Path addCurveToPoint: CGPointMake(158.79, 242.39) controlPoint1: CGPointMake(157.98, 239.69) controlPoint2: CGPointMake(158.64, 240.99)];
   [_24410Path addLineToPoint: CGPointMake(158.79, 266.46)];
   [_24410Path addCurveToPoint: CGPointMake(155.13, 275.35) controlPoint1: CGPointMake(158.79, 266.46) controlPoint2: CGPointMake(159.13, 272.54)];
   [_24410Path addCurveToPoint: CGPointMake(144.16, 277.68) controlPoint1: CGPointMake(151.14, 278.15) controlPoint2: CGPointMake(144.16, 277.68)];
   [_24410Path addLineToPoint: CGPointMake(78.46, 277.68)];
   [fillColor setFill];
   [_24410Path fill];
   [strokeColor setStroke];
   _24410Path.lineWidth = 3;
   _24410Path.miterLimit = 4;
   _24410Path.lineJoinStyle = kCGLineJoinRound;
   [_24410Path stroke];
}

//     #CAShapeLayer和drawRect的比较
//    - 1.drawRect：属于CoreGraphics框架，占用CPU，性能消耗大
//    - 2.CAShapeLayer：属于CoreAnimation框架，通过GPU来渲染图形，节省性能。动画渲染直接提交给手机GPU，不消耗内存
    //使用CAShapeLayer与贝塞尔曲线可以实现不在view的drawRect方法中画出有一些想要的图形

// 277.71 - 148.72 - 154.41
//水波  X:5  Y:113  W:148.72  H:154.41
- (void)waterBackView{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();

    //// Color Declarations
    UIColor* fillColor3 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    //保存图像上下文状态
    CGContextSaveGState(context);
    CGContextSetAlpha(context, 0.2);

    UIBezierPath* _24412Path = [UIBezierPath bezierPath];
    [_24412Path moveToPoint: CGPointMake(5, 118.69)];
    [_24412Path addCurveToPoint: CGPointMake(47.92, 118.69) controlPoint1: CGPointMake(5, 118.69) controlPoint2: CGPointMake(18.71, 125.39)];
    [_24412Path addCurveToPoint: CGPointMake(113.22, 118.69) controlPoint1: CGPointMake(77.12, 111.99) controlPoint2: CGPointMake(87.58, 110.27)];
    [_24412Path addCurveToPoint: CGPointMake(153.72, 118.69) controlPoint1: CGPointMake(138.86, 127.11) controlPoint2: CGPointMake(153.72, 118.69)];
    [_24412Path addLineToPoint: CGPointMake(153.72, 255.04)];
    [_24412Path addCurveToPoint: CGPointMake(150.22, 263.77) controlPoint1: CGPointMake(153.72, 255.04) controlPoint2: CGPointMake(153.41, 260.68)];
    [_24412Path addCurveToPoint: CGPointMake(140.94, 267.4) controlPoint1: CGPointMake(147.03, 266.86) controlPoint2: CGPointMake(140.94, 267.4)];
    [_24412Path addLineToPoint: CGPointMake(18.11, 267.4)];
    [_24412Path addCurveToPoint: CGPointMake(8.62, 263.97) controlPoint1: CGPointMake(18.11, 267.4) controlPoint2: CGPointMake(11.9, 266.87)];
    [_24412Path addCurveToPoint: CGPointMake(5, 255.81) controlPoint1: CGPointMake(5.34, 261.07) controlPoint2: CGPointMake(5, 255.81)];
    [_24412Path addLineToPoint: CGPointMake(5, 118.69)];
    [_24412Path closePath];
    [fillColor3 setFill];
    [_24412Path fill];
    
    CGContextRestoreGState(context);
    
    
    //保存图像上下文状态
    CGContextSaveGState(context);
    CGContextSetAlpha(context, 0.2);

    UIBezierPath* _24413Path = [UIBezierPath bezierPath];
    [_24413Path moveToPoint: CGPointMake(5, 118.69)];
    [_24413Path addCurveToPoint: CGPointMake(47.92, 118.69) controlPoint1: CGPointMake(5, 118.69) controlPoint2: CGPointMake(16.94, 109.95)];
    [_24413Path addCurveToPoint: CGPointMake(113.22, 118.69) controlPoint1: CGPointMake(78.9, 127.43) controlPoint2: CGPointMake(85.18, 128.01)];
    [_24413Path addCurveToPoint: CGPointMake(153.72, 118.69) controlPoint1: CGPointMake(141.26, 109.37) controlPoint2: CGPointMake(153.72, 118.69)];
    [_24413Path addLineToPoint: CGPointMake(153.72, 253.24)];
    [_24413Path addCurveToPoint: CGPointMake(150.23, 263.88) controlPoint1: CGPointMake(153.72, 253.24) controlPoint2: CGPointMake(153.92, 260.34)];
    [_24413Path addCurveToPoint: CGPointMake(138.98, 267.41) controlPoint1: CGPointMake(146.54, 267.42) controlPoint2: CGPointMake(138.98, 267.41)];
    [_24413Path addLineToPoint: CGPointMake(17.22, 267.41)];
    [_24413Path addCurveToPoint: CGPointMake(8.42, 263.77) controlPoint1: CGPointMake(17.22, 267.41) controlPoint2: CGPointMake(11.48, 266.65)];
    [_24413Path addCurveToPoint: CGPointMake(5, 255.86) controlPoint1: CGPointMake(5.37, 260.88) controlPoint2: CGPointMake(5, 255.86)];
    [_24413Path addLineToPoint: CGPointMake(5, 118.69)];
    [_24413Path closePath];
    [fillColor3 setFill];
    [_24413Path fill];

    CGContextRestoreGState(context);
}

- (void)ruler{
    UIColor* strokeColor = [UIColor colorWithRed: 0.004 green: 0.478 blue: 0.988 alpha: 1];
    UIColor* textForeground = [UIColor colorWithRed: 0.004 green: 0.478 blue: 0.988 alpha: 1];
    //// Label Drawing
    CGRect labelRect = CGRectMake(10, 202, 6.67, 18);
    NSMutableParagraphStyle* labelStyle = [[NSMutableParagraphStyle alloc] init];
    labelStyle.alignment = NSTextAlignmentLeft;
    NSDictionary* labelFontAttributes = @{NSFontAttributeName: [UIFont fontWithName: @"ArialMT" size: 12], NSForegroundColorAttributeName: textForeground, NSParagraphStyleAttributeName: labelStyle};

    [@"0" drawInRect: labelRect withAttributes: labelFontAttributes];

}

- (void)configView{
//    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:<#(CGPoint)#> radius:<#(CGFloat)#> startAngle:<#(CGFloat)#> endAngle:<#(CGFloat)#> clockwise:<#(BOOL)#>];
    ZPBezierView *view = [[ZPBezierView alloc]initWithFrame:self.view.bounds];
    view.backgroundColor = [UIColor whiteColor];
//    [self.view addSubview:view];
//    path.lineCapStyle这个线段起点是终点的样式，这个样式有三种：
//    （
//    1、kCGLineCapButt该属性值指定不绘制端点， 线条结尾处直接结束。这是默认值。
//    2、kCGLineCapRound 该属性值指定绘制圆形端点， 线条结尾处绘制一个直径为线条宽度的半圆。
//    3、kCGLineCapSquare 该属性值指定绘制方形端点。 线条结尾处绘制半个边长为线条宽度的正方形。需要说明的是，这种形状的端点与“butt”形状的端点十分相似，只是采用这种形式的端点的线条略长一点而已
//    ）
//    4、path.lineJoinStyle这个属性是用来设置两条线连结点的样式，同样它也有三种样式供我们选择
//    (
//    1、kCGLineJoinMiter 斜接
//    2、kCGLineJoinRound 圆滑衔接
//    3、kCGLineJoinBevel 斜角连接
//    ）
//    5、[path stroke];用 stroke 得到的是不被填充的 view ，[path fill]; 用 fill 得到的内部被填充的 view
    

    CAShapeLayer *faceLayer = [CAShapeLayer layer];
    faceLayer.strokeColor = [UIColor redColor].CGColor;
    UIView *squerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 300, 400)];
    UIBezierPath *squerPath = [UIBezierPath bezierPath];
    squerPath.lineWidth = 2.0;
    squerPath.lineCapStyle = kCGLineCapRound; //线条拐角
    squerPath.lineJoinStyle = kCGLineJoinRound; //终点处理
    [squerPath moveToPoint:CGPointMake(200.0, 50.0)];//起点
    // Draw the lines
    [squerPath addLineToPoint:CGPointMake(300.0, 100.0)];
    [squerPath addLineToPoint:CGPointMake(260, 200)];
    [squerPath addLineToPoint:CGPointMake(100.0, 200)];
    [squerPath addLineToPoint:CGPointMake(100, 70.0)];
    [squerPath closePath];
    faceLayer.path = squerPath.CGPath;
    [squerView.layer addSublayer:faceLayer];
//    squerView.layer.mask = faceLayer;
//    [squerView setLayer:faceLayer path:squerPath];
//    [squerView setlayer]
    [self.view addSubview:squerView];
}

/**
 添加一段圆弧
 @param center 中心点
 @param radius 半径
 @param startAngle 开始角度
 @param endAngle 结束角度
 @param clockwise 是否顺时针
 */
//- (void)addArcWithCenter:(CGPoint)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle clockwise:(BOOL)clockwise NS_AVAILABLE_IOS(4_0);

/**
 添加一段二次贝塞尔曲线
 @param endPoint 结束点
 @param controlPoint 控制点
 */
//- (void)addQuadCurveToPoint:(CGPoint)endPoint controlPoint:(CGPoint)controlPoint;

/**
 添加一段三次贝塞尔曲线
 @param endPoint 结束点
 @param controlPoint1 控制点1
 @param controlPoint2 控制点2
 */
//- (void)addCurveToPoint:(CGPoint)endPoint controlPoint1:(CGPoint)controlPoint1 controlPoint2:(CGPoint)controlPoint2;

/**
  ** lineView:       需要绘制成虚线的view
  ** lineLength:     虚线的宽度
  ** lineSpacing:    虚线的间距
  ** lineColor:      虚线的颜色
  **/
+ (void)drawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor
{
      CAShapeLayer *shapeLayer = [CAShapeLayer layer];
      [shapeLayer setFrame:lineView.bounds];
      [shapeLayer setPosition:CGPointMake(CGRectGetWidth(lineView.frame) / 2, CGRectGetHeight(lineView.frame))];
      [shapeLayer setFillColor:[UIColor clearColor].CGColor];
      //  设置虚线颜色为blackColor
      [shapeLayer setStrokeColor:lineColor.CGColor];
      //  设置虚线宽度
      [shapeLayer setLineWidth:CGRectGetHeight(lineView.frame)];
      [shapeLayer setLineJoin:kCALineJoinRound];
      //  设置线宽，线间距
      [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:lineLength], [NSNumber numberWithInt:lineSpacing], nil]];
      //  设置路径
      CGMutablePathRef path = CGPathCreateMutable();
      CGPathMoveToPoint(path, NULL, 0, 0);
      CGPathAddLineToPoint(path, NULL,CGRectGetWidth(lineView.frame), 0);
      [shapeLayer setPath:path];
      CGPathRelease(path);
      //  把绘制好的虚线添加上来
      [lineView.layer addSublayer:shapeLayer];
  }

- (void)dealloc{
    NSLog(@"页面销毁");
}
@end

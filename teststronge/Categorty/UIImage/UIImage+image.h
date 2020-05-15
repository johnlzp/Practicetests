//
//  UIImage+image.h
//  quanzi
//
//  Created by 朱恒志 on 2017/8/18.
//  Copyright © 2017年 mi@prime. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (image)

//instancetype 默认会识别当前是哪个类或者对象调用，就会转换成相应的类的对象
//加载最原始的图片（没有渲染的图片）
+(instancetype)imageWithOriginalName:(NSString *)imageName;

//切圆角
- (instancetype )zp_circleImage;
//使用贝塞尔曲线UIBezierPath和Core Graphics框架画出一个圆角
+ (instancetype)zp_circleImage:(NSString *)name;
//截图方式(性能较好，基本不掉帧)
- (UIImage *)zpdrawRectWithRoundedCornercornerRadius:(CGFloat)cornerRadius viewSize:(CGSize)viewSize;
- (UIImage *)zpdrawRectWithRounded:(CGFloat)cornerRadius corner:(UIRectCorner)corner viewSize:(CGSize)viewSize;

//颜色作为图片使用
+ (UIImage *)gxz_imageWithColor:(UIColor *)color;
//颜色作为图片使用(可以根据大小来画图片)
+ (UIImage *)pureColorImageWithSize:(CGSize)size color:(UIColor *)color cornRadius:(CGFloat)cornRadius;

/**根据给定的size的宽高比自动缩放原图片、自动判断截取位置,进行图片截取*/
+(UIImage *)clipImage:(UIImage *)image toRect:(CGSize)size;

/**图片大小和质量的压缩,*/
- (NSData *)zipNSDataWithImage:(UIImage *)sourceImage;
+(UIImage *)imageFromImage:(UIImage *)image inRect:(CGRect)rect;
@end

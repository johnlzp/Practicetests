//
//  UIColor+Hex.h
//  LeBen-Takeout
//
//  Created by lsfb on 2018/12/19.
//  Copyright © 2018年 单丶依. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface UIColor (Hex)

+ (UIColor *)colorWithHexString:(NSString *)color;

//从十六进制字符串获取颜色，
//color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

 

@end


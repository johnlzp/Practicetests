//
//  UILabel+ZPExtension.h
//  quanzi
//
//  Created by 刘佳 on 17/11/28.
//  Copyright © 2017年 mi@prime. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (ZPExtension)

/**
 *  改变行间距
 */
+ (void)changeLineSpaceForLabel:(UILabel *)label WithSpace:(float)space;

/**
 *  改变字间距
 */
+ (void)changeWordSpaceForLabel:(UILabel *)label WithSpace:(float)space;

/**
 *  改变行间距和字间距
 */
+ (void)changeSpaceForLabel:(UILabel *)label withLineSpace:(float)lineSpace WordSpace:(float)wordSpace;

/**改变label中数字的字体和颜色*/
+ (void)changNumberForLabel:(UILabel *)label withTextColor:(UIColor *)color font:(CGFloat)font;


/**
 改变label中的汉字的字体和颜色
 */
+ (void)changChineseForLabel:(UILabel *)label withTextColor:(UIColor *)color font:(CGFloat)font;

/**改变label中指定范围的字体和颜色*/
+ (void)changColorFontForLabel:(UILabel *)label withTextColor:(UIColor *)color font:(CGFloat)font rang:(NSRange)rang;

/**两端对齐（这种设置需要label设置完了text和frame的时候在使用这个方法）*/
- (void)textAlignmentLeftAndRight;

/**指定Label以最后的冒号对齐的width两端对齐*/
- (void)textAlignmentLeftAndRightWith:(CGFloat)labelWidth;
/**
 *此方法是用来判断一个字符串是不是整型.
 *如果传进的字符串是一个字符,可以用来判断它是不是数字
 */
+ (BOOL)isPureInt:(NSString *)string;


/**让label文字置顶*/
- (void)alignTop;

/**让label文字置底*/
- (void)alignBottom;

/**获取文本大小*/
+ (CGSize)getNoteText:(NSString *)texts font:(NSInteger)font width:(CGFloat)width;
/**获取带行间距的文本大小*/
+ (CGSize)getNoteText:(NSString *)texts font:(NSInteger)font space:(NSInteger)space width:(CGFloat)width;
@end

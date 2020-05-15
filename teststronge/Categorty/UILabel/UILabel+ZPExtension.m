//
//  UILabel+ZPExtension.m
//  quanzi
//
//  Created by 刘佳 on 17/11/28.
//  Copyright © 2017年 mi@prime. All rights reserved.
//

#import "UILabel+ZPExtension.h"
#import <CoreText/CoreText.h>
@implementation UILabel (ZPExtension)

+ (void)changeLineSpaceForLabel:(UILabel *)label WithSpace:(float)space {
    NSString *labelText = label.text;
    if (!labelText) {
        return;
    }
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:space];
    [paragraphStyle setAlignment:label.textAlignment];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    label.attributedText = attributedString;
    [label sizeToFit];
    
}

+ (void)changeWordSpaceForLabel:(UILabel *)label WithSpace:(float)space {
    
    NSString *labelText = label.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(space)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setAlignment:label.textAlignment];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    label.attributedText = attributedString;
    [label sizeToFit];
    
}

+ (void)changeSpaceForLabel:(UILabel *)label withLineSpace:(float)lineSpace WordSpace:(float)wordSpace {
    
    NSString *labelText = label.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(wordSpace)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpace];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    label.attributedText = attributedString;
    [label sizeToFit];
    
}

+ (void)changNumberForLabel:(UILabel *)label withTextColor:(UIColor *)color font:(CGFloat)font{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:label.text];
    NSString *temp = nil;
    for(int i =0; i < [attributedString length]; i++) {
        temp = [label.text substringWithRange:NSMakeRange(i, 1)];
        if ([self isPureInt:temp]) {
            [attributedString setAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                             color, NSForegroundColorAttributeName,
                                             [UIFont systemFontOfSize:font],NSFontAttributeName, nil]
                                      range:NSMakeRange(i, 1)];
        }
    }
    label.attributedText = attributedString;
}

+ (void)changChineseForLabel:(UILabel *)label withTextColor:(UIColor *)color font:(CGFloat)font{
//    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:label.text];
//    NSString *temp = nil;
//    for(int i =0; i < [attributedString length]; i++) {
//        temp = [label.text substringWithRange:NSMakeRange(i, 1)];
//        if ([temp isChinese]) {
//            [attributedString setAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
//                                             color, NSForegroundColorAttributeName,
//                                             [UIFont systemFontOfSize:font],NSFontAttributeName, nil]
//                                      range:NSMakeRange(i, 1)];
//        }
//    }
//    label.attributedText = attributedString;
}

+ (void)changColorFontForLabel:(UILabel *)label withTextColor:(UIColor *)color font:(CGFloat)font rang:(NSRange)rang{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]initWithString:label.text];
    [attributedString setAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                     color, NSForegroundColorAttributeName,
                                     [UIFont systemFontOfSize:font],NSFontAttributeName, nil]
                              range:rang];
    label.attributedText = attributedString;
}

/**
 *此方法是用来判断一个字符串是不是整型.
 *如果传进的字符串是一个字符,可以用来判断它是不是数字
 */
+ (BOOL)isPureInt:(NSString *)string {
    NSScanner *scan = [NSScanner scannerWithString:string];
    int value;
    return [scan scanInt:&value] && [scan isAtEnd];
}

- (void)textAlignmentLeftAndRight{
    [self textAlignmentLeftAndRightWith:CGRectGetWidth(self.frame)];
}

- (void)textAlignmentLeftAndRightWith:(CGFloat)labelWidth{
    if(self.text==nil||self.text.length==0) {
        return;
    }CGSize size = [self.text boundingRectWithSize:CGSizeMake(labelWidth,MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingTruncatesLastVisibleLine|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:self.font} context:nil].size;
    NSInteger length = (self.text.length-1);
    NSString* lastStr = [self.text substringWithRange:NSMakeRange(self.text.length-1,1)];
    if([lastStr isEqualToString:@":"]||[lastStr isEqualToString:@"："]) {
        length = (self.text.length-2);
    }
    CGFloat margin = (labelWidth - size.width)/length;
    NSNumber*number = [NSNumber numberWithFloat:margin];
    NSMutableAttributedString* attribute = [[NSMutableAttributedString alloc]initWithString:self.text];
    [attribute addAttribute:NSKernAttributeName value:number range:NSMakeRange(0,length)];
    self.attributedText= attribute;
}

-(void)alignTop
{
    // 对应字号的字体一行显示所占宽高
    CGSize fontSize = [self.text sizeWithAttributes:@{NSFontAttributeName:self.font}];
    // 多行所占 height*line
    double height = self.frame.size.height;
    // 显示范围实际宽度
    double width = self.frame.size.width;
    // 对应字号的内容实际所占范围
    CGSize stringSize = [self.text boundingRectWithSize:CGSizeMake(width, height) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:@{NSFontAttributeName:self.font} context:nil].size;
    // 剩余空行
    NSInteger line = (height - stringSize.height) / fontSize.height;
    // 用回车补齐
    for (int i = 0; i < line; i++) {
        
        self.text = [self.text stringByAppendingString:@"\n "];
    }
}
-(void)alignBottom
{
    CGSize fontSize = [self.text sizeWithAttributes:@{NSFontAttributeName:self.font}];
    double height = fontSize.height*self.numberOfLines;
    double width = self.frame.size.width;
    CGSize stringSize = [self.text boundingRectWithSize:CGSizeMake(width, height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:self.font} context:nil].size;
    
    NSInteger line = (height - stringSize.height) / fontSize.height;
    // 前面补齐换行符
    for (int i = 0; i < line; i++) {
        self.text = [NSString stringWithFormat:@" \n%@", self.text];
    }
}

+ (CGSize)getNoteText:(NSString *)texts font:(NSInteger)font width:(CGFloat)width{
    NSString *text = texts;
    if (!text) {
        text = @"";
    }
    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    style.lineBreakMode = NSLineBreakByWordWrapping;
    style.alignment = NSTextAlignmentLeft;
    NSAttributedString *string = [[NSAttributedString alloc]initWithString:text attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font], NSParagraphStyleAttributeName:style}];
    CGSize size =  [string boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil].size;
    return size;
}

+ (CGSize)getNoteText:(NSString *)texts font:(NSInteger)font space:(NSInteger)space width:(CGFloat)width{
    NSString *text = texts;
    if (!text) {
        text = @"";
    }
    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    style.lineBreakMode = NSLineBreakByWordWrapping;
    style.alignment = NSTextAlignmentLeft;
    style.lineSpacing = space;
    NSAttributedString *string = [[NSAttributedString alloc]initWithString:text attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font],
                                                                                             NSParagraphStyleAttributeName:style}];
    CGSize size =  [string boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil].size;
    return size;
}
@end

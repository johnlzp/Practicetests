//
//  UIBarButtonItem+ZPExtension.h
//  百思不得姐-自己做
//
//  Created by 刘佳 on 16/9/16.
//  Copyright © 2016年 刘佳. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (ZPExtension)

+ (instancetype)itemsWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action;

+(instancetype)itemsWithImage:(NSString *)image selectImage:(NSString *)selectImage target:(id)target action:(SEL)action;

+(instancetype)itemsWithImage:(NSString *)image highImage:(NSString *)highImage text:(NSString *)text font:(NSInteger)font textColor:(UIColor*)textColor target:(id)target action:(SEL)action;

+(instancetype)itemsWithtext:(NSString *)text hiText:(NSString *)hiText textColor:(UIColor*)textColor font:(NSInteger)font target:(id)target action:(SEL)action;
+(instancetype)rightitemsWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action;
@end

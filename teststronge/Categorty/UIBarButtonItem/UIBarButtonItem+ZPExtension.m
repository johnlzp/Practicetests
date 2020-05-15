//
//  UIBarButtonItem+ZPExtension.m
//  百思不得姐-自己做
//
//  Created by 刘佳 on 16/9/16.
//  Copyright © 2016年 刘佳. All rights reserved.
//

#import "UIBarButtonItem+ZPExtension.h"

@implementation UIBarButtonItem (ZPExtension)

+(instancetype)itemsWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    //[button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    //[button setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    UIImage *imageObject=[UIImage imageNamed:image];
    [button setImage:imageObject
        forState:UIControlStateNormal];
    CGRect rectButton=button.frame;
    rectButton.origin=CGPointZero;
    rectButton.size=imageObject.size;
    if (rectButton.size.width<44) {
        rectButton.size.width=44;
    }
    if (rectButton.size.height<44) {
        rectButton.size.height=44;
    }
    button.frame = rectButton;
    [button addTarget:target action:action
        forControlEvents:UIControlEventTouchUpInside];
    button.contentHorizontalAlignment=
        UIControlContentHorizontalAlignmentLeft;
    [button setEnlargeEdgeWithTop:5 right:3 bottom:5 left:2];
//    UIView *views = [[UIView alloc]init];
//    views.frame = button.frame;
//    [views addSubview:button];
    return [[UIBarButtonItem alloc]initWithCustomView:button];
}

+(instancetype)itemsWithImage:(NSString *)image selectImage:(NSString *)selectImage target:(id)target action:(SEL)action{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:selectImage] forState:UIControlStateSelected];
//    button.frame = CGRectMake(0, 0, button.currentBackgroundImage.size.width, button.currentBackgroundImage.size.height);
    button.frame = CGRectMake(0, 0, (44), (44));
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
//    UIView *views = [[UIView alloc]init];
//    views.frame = button.frame;
//    [views addSubview:button];
    return [[UIBarButtonItem alloc]initWithCustomView:button];
}

+(instancetype)itemsWithImage:(NSString *)image highImage:(NSString *)highImage text:(NSString *)text font:(NSInteger)font textColor:(UIColor*)textColor target:(id)target action:(SEL)action{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    [button setTitle:text forState:UIControlStateNormal];
    [button setTitleColor:textColor forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:font];
//    button.frame = CGRectMake(0, 0, button.currentBackgroundImage.size.width, button.currentBackgroundImage.size.height);
    button.frame = CGRectMake(0, 0, (44), (44));
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    //    UIView *views = [[UIView alloc]init];
    //    views.frame = button.frame;
    //    [views addSubview:button];
    return [[UIBarButtonItem alloc]initWithCustomView:button];
}

+(instancetype)itemsWithtext:(NSString *)text hiText:(NSString *)hiText textColor:(UIColor*)textColor font:(NSInteger)font target:(id)target action:(SEL)action{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:text forState:UIControlStateNormal];
    [button setTitle:hiText forState:UIControlStateSelected];
    [button setTitleColor:textColor forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:font];
    button.frame = CGRectMake(0, 0, (44), (44));
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];

    return [[UIBarButtonItem alloc]initWithCustomView:button];
}
+(instancetype)rightitemsWithImage:(NSString *)image highImage:(NSString *)highImage target:(id)target action:(SEL)action{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    //[button setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    //[button setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    UIImage *imageObject=[UIImage imageNamed:image];
    [button setImage:imageObject
            forState:UIControlStateNormal];
    CGRect rectButton=button.frame;
    rectButton.origin=CGPointZero;
    rectButton.size=imageObject.size;
    if (rectButton.size.width<44) {
        rectButton.size.width=44;
    }
    if (rectButton.size.height<44) {
        rectButton.size.height=44;
    }
    button.frame = rectButton;
    [button addTarget:target action:action
     forControlEvents:UIControlEventTouchUpInside];
    button.contentHorizontalAlignment=
    UIControlContentHorizontalAlignmentRight;
    
    [button setEnlargeEdgeWithTop:5 right:3 bottom:5 left:2];
    //    UIView *views = [[UIView alloc]init];
    //    views.frame = button.frame;
    //    [views addSubview:button];
    return [[UIBarButtonItem alloc]initWithCustomView:button];
}
@end

//
//  UIButton+FillColor.m
//  CiHua
//
//  Created by zgscwjm on 2019/3/6.
//  Copyright © 2019年 LSFB. All rights reserved.
//

#import "UIButton+FillColor.h"

@implementation UIButton (FillColor)
-(void) setBackgroundColor:(UIColor *)color forState:(UIControlState)state {
    [self setBackgroundImage:[UIImage gxz_imageWithColor:color] forState:state];
}


@end

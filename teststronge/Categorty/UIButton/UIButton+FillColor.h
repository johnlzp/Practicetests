//
//  UIButton+FillColor.h
//  CiHua
//
//  Created by zgscwjm on 2019/3/6.
//  Copyright © 2019年 LSFB. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (FillColor)


/**
 根据按钮状态设置按钮颜色

 @param color 按钮颜色
 @param state 按钮状态
 */
-(void) setBackgroundColor:(UIColor *)color forState:(UIControlState)state;
@end

NS_ASSUME_NONNULL_END

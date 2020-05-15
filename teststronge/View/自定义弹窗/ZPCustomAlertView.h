//
//  ZPCustomAlertView.h
//  teststronge
//
//  Created by OS on 2019/9/19.
//  Copyright © 2019 OS. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZPCustomAlertView : UIView


/**
 @param title 标题(不要标题设置为nil)
 @param content 内容
 @param buttonTitlesArray 按钮文字数组
 @param buttonBlock 按钮的点击事件
 @return ZPCustomAlertView
 */
+ (instancetype)showWithTitle:(NSString *)title content:(NSString *)content buttonTitlesArray:(NSArray *)buttonTitlesArray buttonBlock:(void(^)(NSInteger index))buttonBlock;

@end

NS_ASSUME_NONNULL_END

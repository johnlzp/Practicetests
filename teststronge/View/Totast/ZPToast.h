//
//  ZPToast.h
//  teststronge
//
//  Created by OS on 2019/9/18.
//  Copyright © 2019 OS. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZPToast : UIView

/**纯文本*/
+ (void)TextToastWithMessage:(NSString *)message;
/**图片 + 文本*/
+ (void)TextToastWithMessage:(NSString *)message image:(NSString *)image;
/**图片 + 文本持续时间*/
+ (void)TextToastWithMessage:(NSString *)message image:(NSString *)image duration:(NSTimeInterval)duration;

/**点赞*/
+ (void)zanImageToast;
/**点赞  持续时间*/
+ (void)showZanWithDuration:(NSTimeInterval)duration;

#pragma mark - 初始化设置(需要在初始化之前配置)
/** 设置toast的默认背景颜色 */
+ (void)setDefaultBackgroundColor:(UIColor *)defaultBackgroundColor;
/** 设置默认字体颜色，未设置为白色 */
+ (void)setDefaultTextColor:(UIColor *)defaultTextColor;
/** 设置toast展示的默认时间，未设置为2秒 */
+ (void)setDefaultDuration:(NSTimeInterval)defaultDuration;
/** 设置toast消失的默认时间，未设置为0.3秒 */
+ (void)setDefaultFadeDuration:(NSTimeInterval)defaultFadeDuration;
@end

NS_ASSUME_NONNULL_END

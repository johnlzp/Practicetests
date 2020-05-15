//
//  UITabBar+ZPDot.h
//  CiHua
//
//  Created by OS on 2019/5/16.
//  Copyright © 2019 LSFB. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITabBar (ZPDot)
/*!
 * @brief   显示小红点
 * @param   index 将要显示小红点的tabbarItem的索引(第一个item的索引为0)
 * @return
 */
- (void)showDotAtIndex:(NSInteger)index;
/*!
 * @brief   隐藏小红点
 * @param   index 将要隐藏小红点的tabbarItem的索引(第一个item的索引为0)
 * @return
 */
- (void)hiddenDotAtIndex:(NSInteger)index;
@end

NS_ASSUME_NONNULL_END

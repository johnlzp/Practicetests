//
//  UITabBar+ZPDot.m
//  CiHua
//
//  Created by OS on 2019/5/16.
//  Copyright © 2019 LSFB. All rights reserved.
//

#import "UITabBar+ZPDot.h"

@implementation UITabBar (ZPDot)
- (void)showDotAtIndex:(NSInteger)index
{
    NSMutableArray *array = [NSMutableArray array];
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [array addObject:view];
        }
    }
    if (index >= array.count) {
        return;
    }
    UIView *tabBarButton = array[index];
    CGFloat selectedImageWidth = 0;
    CGFloat topMargin = 0;
    
    for (UIView *view in tabBarButton.subviews) {
        if ([view isKindOfClass:NSClassFromString(@"UITabBarSwappableImageView")]) {
            selectedImageWidth = view.frame.size.width;
            topMargin = view.frame.origin.y;
        }
    }
    
    for (UIView *view in tabBarButton.subviews) {
        if (view.tag == 999) {
            [view removeFromSuperview];
        }
    }
    UIView *dot = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMidX(tabBarButton.bounds) + selectedImageWidth / 2 + 2.5, topMargin, 2.5 * 2, 2.5 * 2)];
    dot.backgroundColor = [UIColor redColor];
    dot.layer.cornerRadius = 2.5;
    dot.tag = 999;
    [tabBarButton addSubview:dot];
}

- (void)hiddenDotAtIndex:(NSInteger)index
{
    NSMutableArray *array = [NSMutableArray array];
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [array addObject:view];
        }
    }
    if (index >= array.count) {
        return;
    }
    UIView *tabBarButton = array[index];
    for (UIView *view in tabBarButton.subviews) {
        if (view.tag == 999) {
            [view removeFromSuperview];
        }
    }
}
@end

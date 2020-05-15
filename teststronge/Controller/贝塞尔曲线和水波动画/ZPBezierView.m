//
//  ZPBezierView.m
//  teststronge
//
//  Created by OS on 2020/3/30.
//  Copyright © 2020 OS. All rights reserved.
//

#import "ZPBezierView.h"

@implementation ZPBezierView


- (void)drawRect:(CGRect)rect {
//    [super drawRect:rect];
    // Drawing code
    UIColor *color = [UIColor redColor];
    [color set]; //设置线条颜色
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(10, 10, 36, 36) cornerRadius:18.0];
    circlePath.lineWidth = 2.0;
    circlePath.lineCapStyle = kCGLineCapRound;
    circlePath.lineJoinStyle = kCGLineJoinRound;
    [circlePath stroke];
}


@end

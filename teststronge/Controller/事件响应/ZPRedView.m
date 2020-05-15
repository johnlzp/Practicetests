//
//  ZPRedView.m
//  teststronge
//
//  Created by OS on 2020/1/10.
//  Copyright © 2020 OS. All rights reserved.
//

#import "ZPRedView.h"

@implementation ZPRedView
 
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"redView %s",__func__);
}

//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
//    return self;
//}

//点击任何地方只有红色视图响应， 
//因为这里相当于是重写了方法，但是没有调用父类的方法，也就不会将点击事件向上传递，全都会被红色view拦截
//之所以子视图(绿色view)不响应是因为：
//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
//    return self;
//}

@end

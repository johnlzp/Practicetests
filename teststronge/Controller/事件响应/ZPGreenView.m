//
//  ZPGreenView.m
//  teststronge
//
//  Created by OS on 2020/1/10.
//  Copyright © 2020 OS. All rights reserved.
//

#import "ZPGreenView.h"

@implementation ZPGreenView

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"greenView %s",__func__);
}

//点击重叠部分，只让红色响应，绿色不响应
//同级
//a:控制器，因为重写了hitTest：withEvent：方法返回的是父视图，所以点击事件发生后，keywindow找到了最适合的响应的视图（green），但是因为重写了green的响应链，本该green处理的响应者链抛向了父视图
//b:控制器，同上
//c:控制器，
//a1:控制器，因为这个范围已经超过父视图，所以green无法影响，redview无法响应，所以控制器view是随适合的view，
//b1:red， 最适合的响应的视图（green），但是重写了hitTest：withEvent：方法返回的是父视图，所以是由red响应
//c1:red，最适合的响应的视图（red）
//注意：实现这个需求不能重写redview的hitTest：withEvent：方法，因为如果重写父控件的hitTest:withEvent:方法，并在该方法中返回父控件本身，会导致点击白色view的时候，事件传递所以会继续遍历子视图的hitTest：withEvent：方法，但是子视图(redview)在该方法中返回的是自身，并且没有实现[super hitest]所以响应链是不会继续向上传递的，所以所有的点击都会被redview响应,
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    return [self superview];//[self superview]和 nil效果是一样的
//    return [super hitTest:point withEvent:event];
}

//点击任何地方只有绿色视图响应，
//因为这里相当于是重写了方法，但是没有调用父类的方法，也就不会将点击事件向上传递，全都会被绿色view拦截
//- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
//    return self;
//}

@end

//
//  ZPBottomPopupView.m
//  teststronge
//
//  Created by 刘佳 on 2020/5/20.
//  Copyright © 2020 OS. All rights reserved.
//

#import "ZPBottomPopupView.h"
@interface ZPBottomPopupView()<UIGestureRecognizerDelegate>

@end
@implementation ZPBottomPopupView
+ (instancetype)showWithBottomPopupView{
    ZPBottomPopupView *view = [[ZPBottomPopupView alloc]initWithBottomPopupView];
    view.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.4];
    [[UIApplication sharedApplication].delegate.window addSubview:view];
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(view.superview);
    }];
    [view layoutIfNeeded];
    [UIView animateWithDuration:0.25 animations:^{
        [view.customView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(0);
        }];
        [view layoutIfNeeded];
    }];
    
    return view;
}

- (instancetype)initWithBottomPopupView{
    if (self = [super init]) {
        [self configCustomView];
    }
    return self;
}

- (void)configCustomView{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismiss)];
    tap.delegate = self;
    [self addGestureRecognizer:tap];
    UIView *customView = [UIView new];
    [self addSubview:customView];
    self.customView = customView;
    customView.backgroundColor = [UIColor redColor];
    [customView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(171 + Height_StatusBar + Height_NabiBar);
        make.bottom.mas_equalTo(171 + Height_StatusBar + Height_NabiBar);
    }];
}

- (void)dismiss{
    [UIView animateWithDuration:0.25 animations:^{
        [self.customView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(self.customView.height);
        }];
        [self layoutIfNeeded];
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    if ([touch.view isDescendantOfView:self.customView]) {
        return NO;
    }
    return YES;
}
@end

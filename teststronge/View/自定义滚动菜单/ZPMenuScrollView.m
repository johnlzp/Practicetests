//
//  ZPMenuScrollView.m
//  teststronge
//
//  Created by OS on 2019/9/18.
//  Copyright © 2019 OS. All rights reserved.
//

#import "ZPMenuScrollView.h"

@implementation ZPMenuScrollView{
    UIView *_lastView;
    UIView *_lineView;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _currentButtonIndex = 0;
        self.showsHorizontalScrollIndicator = NO;
    }
    return self;
}

- (void)setTitleArray:(NSArray *)titleArray{
    _titleArray = titleArray;
    for (UIView *subView in self.subviews) {
        [subView removeFromSuperview];
    }
    
    // 将lastView置空
    _lastView = nil;
    [titleArray enumerateObjectsUsingBlock:^(NSString *  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIButton *menuBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        if (self->_lastView) {
            menuBtn.frame = CGRectMake(CGRectGetMaxX(self->_lastView.frame) + 15, 0, 100, self.height);
        }else{
            menuBtn.frame = CGRectMake(0, 0, 100, self.height);
        }
        [menuBtn setTitle:obj forState:UIControlStateNormal];
        menuBtn.tag = 200 + idx;
        [menuBtn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [menuBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        menuBtn.titleLabel.font = [UIFont boldSystemFontOfSize:14.0];
        [menuBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        [menuBtn sizeToFit];
        [self addSubview:menuBtn];
        
        if (idx == 0) {
            menuBtn.selected = YES;
            UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, self.height - 2, menuBtn.titleLabel.width, 2)];
            NSMutableDictionary *dict = [NSMutableDictionary dictionary];
            dict[NSFontAttributeName] = menuBtn.titleLabel.font;
            self->_lineView.width =  [menuBtn.titleLabel.text sizeWithAttributes:dict].width;
            lineView.backgroundColor = [UIColor redColor];
            self->_lineView = lineView;
            [self addSubview:lineView];
        }
        self->_lastView = menuBtn;
    }];
    
    self.contentSize = CGSizeMake(CGRectGetMaxX(_lastView.frame), 0);
    if (CGRectGetMaxX(self->_lastView.frame) < self.width) {
        int i = 0;
        for (UIButton *button in self.subviews) {
            if ([button isMemberOfClass:[UIButton class]]) {
                button.width = self.width / _titleArray.count;
                button.x = i * button.width;
                button.titleLabel.adjustsFontSizeToFitWidth = YES; // 开启，防极端情况
                if (i == 0) {
                    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
                    dict[NSFontAttributeName] = button.titleLabel.font;
                    self->_lineView.width =  [button.titleLabel.text sizeWithAttributes:dict].width;
                    _lineView.centerX = button.centerX;
                    _lineView.y = self.height - 2;
                }
                i ++;
            }
        }
    }
    
    
    _lastView = (UIButton *)[self viewWithTag:200 + 0];
}

- (void)setCurrentButtonIndex:(NSInteger)currentButtonIndex{
    _currentButtonIndex = currentButtonIndex;
    UIButton *btn = [self viewWithTag:200 + currentButtonIndex];
    if (_lastView) {
        UIButton *lastBtn = (UIButton *)_lastView;
        lastBtn.selected = NO;
    }
    btn.selected = YES;
    _lastView = btn;
    if (CGRectGetMaxX(_lastView.frame) > self.width) {//超过了一个屏幕才移动
        //按钮移动到中间来
        if (btn.x >= self.width / 2 && btn.centerX <= self.contentSize.width - self.width / 2) {
            [UIView animateWithDuration:0.25 animations:^{
                self.contentOffset = CGPointMake(btn.centerX - self.width / 2, 0);
            }];
        }else if(btn.x <= self.width / 2){//最左边 
            [UIView animateWithDuration:0.25 animations:^{
                self.contentOffset = CGPointMake(0, 0);
            }];
        }else{//最右边
            [UIView animateWithDuration:0.3 animations:^{
                self.contentOffset = CGPointMake(self.contentSize.width - self.width, 0);
            }];
        }
    }
    
    [UIView animateWithDuration:0.25 animations:^{
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSFontAttributeName] = btn.titleLabel.font;
        self->_lineView.width =  [btn.titleLabel.text sizeWithAttributes:dict].width;
        self->_lineView.center = CGPointMake(btn.center.x, self->_lineView.center.y);
    }];
}

#pragma mark - action
- (void)btnClick:(UIButton *)btn{
    if (!btn.selected) {
        btn.selected = YES;
        UIButton *lastBtn = (UIButton *)_lastView;
        lastBtn.selected = NO;
        _lastView = btn;
        
        if (CGRectGetMaxX(_lastView.frame) > self.width) {//超过了一个屏幕才移动
            //按钮移动到中间来
            if (btn.x >= self.width / 2 && btn.centerX <= self.contentSize.width - self.width / 2) {
                [UIView animateWithDuration:0.25 animations:^{
                    self.contentOffset = CGPointMake(btn.centerX - self.width / 2, 0);
                }];
            }else if(btn.x <= self.width / 2){//最左边
                [UIView animateWithDuration:0.25 animations:^{
                    self.contentOffset = CGPointMake(0, 0);
                }];
            }else{//最右边
                [UIView animateWithDuration:0.3 animations:^{
                    self.contentOffset = CGPointMake(self.contentSize.width - self.width, 0);
                }];
            }
        }
        
        [UIView animateWithDuration:0.25 animations:^{
            NSMutableDictionary *dict = [NSMutableDictionary dictionary];
            dict[NSFontAttributeName] = btn.titleLabel.font;
            self->_lineView.width =  [btn.titleLabel.text sizeWithAttributes:dict].width;
            self->_lineView.center = CGPointMake(btn.center.x, self->_lineView.center.y);
        }];
        if ([self.MenuClickDelegate respondsToSelector:@selector(MenuScrollView:currentIndex:)]) {
            [self.MenuClickDelegate MenuScrollView:self currentIndex:btn.tag - 200];
        }
    }
}

@end

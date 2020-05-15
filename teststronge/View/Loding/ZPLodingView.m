//
//  ZPLodingView.m
//  teststronge
//
//  Created by OS on 2019/9/27.
//  Copyright © 2019 OS. All rights reserved.
//

#import "ZPLodingView.h"
#import <Masonry.h>

#define ZPLodingDefaultView  [UIApplication sharedApplication].delegate.window

@interface ZPLodingView()
@property (nonatomic,strong)UIImageView *imageView;
@property (nonatomic,strong)UILabel *infoLabel;
@end
@implementation ZPLodingView 

+ (void)show{
    [ZPLodingView showOnView:ZPLodingDefaultView withInfo:@""];
}

+ (void)showWithInfo:(NSString *)info{
    [ZPLodingView showOnView:ZPLodingDefaultView withInfo:info];
}

+ (void)showOnView:(UIView *)superView{
    [ZPLodingView showOnView:superView withInfo:@""];
}

+ (void)showOnView:(UIView *)superView withInfo:(NSString *)info {
    [ZPLodingView removeFromView:superView];
    
    ZPLodingView *lodingView = [[ZPLodingView alloc]initWithInfo:info];
    [superView addSubview:lodingView];
    [lodingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.width.height.mas_equalTo(superView);
    }];
}

+ (void)remove{
    [ZPLodingView removeFromView:ZPLodingDefaultView];
}

+ (void)removeFromView:(UIView *)superView{
    for (UIView *view in superView.subviews) {
        if ([view isMemberOfClass:[ZPLodingView class]]) {
            [view removeFromSuperview];
        }
    }
}

- (instancetype)initWithInfo:(NSString *)info{
    if (self = [super init]) {
        self.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.2];;
        //------- imageView -------//
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"loading"]];
        [self addSubview:imageView];
        self.imageView = imageView;
        [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(30, 30));
            make.centerX.mas_equalTo(self);
            if ([info isEqualToString:@""]) {
                //没有文字
                make.centerY.mas_equalTo(self);
            }else{
                //有文字
                make.centerY.mas_equalTo(self.mas_centerY).mas_offset(- 20);
            }
        }];
        
        //------- Label -------//
        self.infoLabel = [[UILabel alloc]init];
        self.infoLabel.text = info;
        self.infoLabel.font = [UIFont systemFontOfSize:14];
        self.infoLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:self.infoLabel];
        [self.infoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.mas_lessThanOrEqualTo(220);
            make.centerX.mas_equalTo(self);
            make.top.mas_equalTo(self.imageView.mas_bottom).mas_offset(20);
        }];
        
        //------- 旋转动画 -------//
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        animation.fromValue = [NSNumber numberWithFloat:0.f];
        animation.toValue = [NSNumber numberWithFloat: M_PI *2];
        animation.duration = 1;
        animation.fillMode = kCAFillModeForwards;
        animation.repeatCount = MAXFLOAT;
        animation.removedOnCompletion = NO;
        [self.imageView.layer addAnimation:animation forKey:nil];
    }
    return self;
}
@end

//
//  ZPTestbottomPopView.m
//  teststronge
//
//  Created by 刘佳 on 2020/5/20.
//  Copyright © 2020 OS. All rights reserved.
//

#import "ZPTestbottomPopView.h"
#import "ZPBottomPopupView.h"
@interface ZPTestbottomPopView()
@property(nonatomic,strong)ZPBottomPopupView *popupsView;
@property(nonatomic,strong)UIView *xxview;
@end
@implementation ZPTestbottomPopView

+ (instancetype)ShowTestBottomPopView{
    ZPTestbottomPopView *alert = [[ZPTestbottomPopView alloc]initWithTestBottomPopView];
    return alert;
}

- (instancetype)initWithTestBottomPopView{
    if (self = [super init]) {
        [self config];
    }
    return self;
}

- (void)config{
    self.popupsView = [[ZPBottomPopupView alloc]initWithBottomPopupView];
    self.popupsView.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.4];
    [[UIApplication sharedApplication].delegate.window addSubview:self.popupsView];
    [self.popupsView mas_makeConstraints:^(MASConstraintMaker *make) {
       make.edges.mas_equalTo(self.popupsView.superview);
    }];
    [self.popupsView layoutIfNeeded];
    [UIView animateWithDuration:0.25 animations:^{
       [self.popupsView.customView mas_updateConstraints:^(MASConstraintMaker *make) {
           make.bottom.mas_equalTo(0);
       }];
       [self.popupsView layoutIfNeeded];
    }];
    
    NSArray *titleArr = @[@"拍摄",@"从手机相册选择"];
    for (int i = 0; i < titleArr.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.popupsView.customView addSubview:button];
        [button setTitle:titleArr[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setBackgroundColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchDown];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
           make.left.right.mas_equalTo(0);
           make.top.mas_equalTo(2 + i * 43);
           make.height.mas_equalTo(43);
        }];
    }
    UIView *grayView = [UIView new];
    grayView.backgroundColor = [UIColor colorWithHexString:@"#F6F6F6"];
    [self.popupsView.customView addSubview:grayView];
    [grayView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(2 + titleArr.count * 43);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(5);
    }];
    UIButton *cancelbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.popupsView.customView addSubview:cancelbutton];
    [cancelbutton setTitle:@"取消" forState:UIControlStateNormal];
    [cancelbutton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [cancelbutton setBackgroundColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [cancelbutton addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchDown];
    [cancelbutton mas_makeConstraints:^(MASConstraintMaker *make) {
       make.left.right.mas_equalTo(0);
       make.top.mas_equalTo(grayView.mas_bottom);
       make.height.mas_equalTo(43);
    }];
}

- (void)dismiss{
    [self.popupsView dismiss];
}

@end

//
//  ZPSettingNavDemo2VC.m
//  teststronge
//
//  Created by OS on 2020/1/15.
//  Copyright © 2020 OS. All rights reserved.
//

#import "ZPSettingNavDemo2VC.h"

@interface ZPSettingNavDemo2VC ()
@property (nonatomic,strong)UIView *navView;
@property (nonatomic,strong)UILabel *titleLabel;
@end

@implementation ZPSettingNavDemo2VC

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(40, 150, 50, 30);
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    [btn setTitle:@"push" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:btn];
    
    
    self.title = @"demo2";
    self.navView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, Height_StatusBar+Height_NabiBar)];
    self.navView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:self.navView];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (self.isTransparent) {
        [self.navigationController setNavigationBarHidden:YES animated:YES];
    }
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if (self.isTransparent) {
        [self.navigationController setNavigationBarHidden:NO animated:YES];
    }
}

- (void)btnClick:(UIButton *)btn{
    
}

@end

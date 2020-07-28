//
//  ZPSettingNavViewController.m
//  teststronge
//
//  Created by OS on 2020/1/14.
//  Copyright © 2020 OS. All rights reserved.
//

#import "ZPSettingNavViewController.h"
#import "ZPSettingNavDemo2VC.h"
@interface ZPSettingNavViewController ()<UIGestureRecognizerDelegate>
@property (nonatomic,strong)UIView *navView;
@property (nonatomic,strong)UILabel *titleLabel;
@property (nonatomic,strong)NSMutableArray *arrays;
@end

@implementation ZPSettingNavViewController  

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.navigationController.navigationBar.translucent = YES;
    
    
//    self.edgesForExtendedLayout = UIRectEdgeNone; 
//    self.navigationController.navigationBar.barTintColor = [UIColor yellowColor];
//    [self.transitionCoordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
//    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
//    } completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
//
//    }];
//    self.navigationController.interactivePopGestureRecognizer.delegate = self;
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self configView];
//    self.view.backgroundColor = [UIColor redColor];
    [self.navigationController.navigationBar navBarBackGroundColor:[UIColor redColor] image:[UIImage new] isOpaque:YES];
    self.arrays = [NSMutableArray arrayWithArray:@[@"a",@"b"]];
    [self.arrays addObjectsFromArray:@[@"c"]];
    NSLog(@"%@",self.arrays);
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:1 forKey:@"a"];
    NSArray *arr
    for (int a in arr) {
        
    }

//    dict
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage gxz_imageWithColor:[UIColor yellowColor]] forBarMetrics:UIBarMetricsDefault];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
//    [self.navigationController setNavigationBarHidden:NO animated:YES];
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
//    [self.navigationController.navigationBar setBackgroundImage:[UIImage gxz_imageWithColor:[UIColor whiteColor]] forBarMetrics:UIBarMetricsDefault];
}

- (void)configView{
    self.title = @"标题";
    
    UIBarButtonItem *item = [UIBarButtonItem itemsWithImage:@"sign_success" highImage:@"sign_success" target:self action:@selector(leftClick)];
    self.navigationItem.leftBarButtonItem = item;
    
    self.navView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, Height_StatusBar+Height_NabiBar)];
    self.navView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.navView];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(40, 150, 50, 30);
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    [btn setTitle:@"push" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:btn];
}

- (void)btnClick:(UIButton *)btn{
    ZPSettingNavDemo2VC *vc = [ZPSettingNavDemo2VC new];
//    vc.isTransparent = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)leftClick{
    [self.navigationController popViewControllerAnimated:YES];
}
@end

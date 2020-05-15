//
//  ViewController.m
//  teststronge
//
//  Created by OS on 2019/9/18.
//  Copyright © 2019 OS. All rights reserved.
//

#import "ViewController.h"
#import "ZPMenuScrollView.h"
#import "ZPToast.h"
#import "ZPCustomAlertView.h"
#import "ZPLodingView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    ZPMenuScrollView *scrollView = [[ZPMenuScrollView alloc]initWithFrame:CGRectMake(0, 100, SCREEN_WIDTH, 30)];
    scrollView.titleArray = @[@"菜单一",@"菜单二",@"fds一",@"菜ff一",@"qerqwer",@"a",@"菜单一",@"菜单二",@"fds一",@"菜ff一",@"qerqwer",@"a",@"菜单一",@"菜单二",@"fds一",@"菜ff一",@"qerqwer",@"a"];
//    scrollView.currentButtonIndex = 1;
    [self.view addSubview:scrollView];
    
//    [ZPToast setDefaultDuration:5.0];
//    [ZPToast TextToastWithMessage:@"重置"];
//    [ZPToast TextToastWithMessage:@"兑换成功" image:@"sign"];
//    [ZPToast zanImageToast];

}

- (void)test{
    
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
//    [ZPCustomAlertView showWithTitle:@"购买成功" content:@"花了100元" buttonTitlesArray:@[@"确认",@"购买"] buttonBlock:^(NSInteger index) {
//
//    }];
//    [ZPLodingView showWithInfo:@"上传中。。。"];
//    [ZPLodingView show];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [ZPLodingView remove];
//    });
    
}

@end

//
//  ZPNestedViewController.m
//  teststronge
//
//  Created by OS on 2019/12/20.
//  Copyright © 2019 OS. All rights reserved.
//

#import "ZPNestedViewController.h"
#import "ZPTableView.h"
#import "ZPDemoViewController.h"
#import "ZPPageHomeView.h"
@interface ZPNestedViewController ()
@property (nonatomic,strong)ZPTableView *baseTableView;
@end

@implementation ZPNestedViewController
 
- (void)viewDidLoad {
    [super viewDidLoad];
    [self configView];
    self.navigationController.navigationBar.translucent = NO;
    //摘自 MCHoveringView  https://github.com/MuYanQin/MCHoveringView
}

- (void)configView{
    
    ZPDemoViewController *vc1 = [ZPDemoViewController new];
    [self addChildViewController:vc1];
    if (@available(iOS 11.0, *)) {
        ZPPageHomeView *pageView = [[ZPPageHomeView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.view.safeAreaLayoutGuide.layoutFrame.size.height) vcArray:@[vc1]];
        [self.view addSubview:pageView];
    } 
}

@end

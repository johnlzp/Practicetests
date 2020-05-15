//
//  ZPNavigationViewController.m
//  teststronge
//
//  Created by OS on 2020/1/14.
//  Copyright © 2020 OS. All rights reserved.
//

#import "ZPNavigationViewController.h"

@interface ZPNavigationViewController ()<UIGestureRecognizerDelegate>

@end

@implementation ZPNavigationViewController

+ (void)load{
    UINavigationBar *bar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[self]];
    [bar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
//    [bar setShadowImage:[UIImage new]];
    [bar setShadowImage:[UIImage gxz_imageWithColor:[UIColor colorWithHexString:@"#D7D7D7"]]];
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSFontAttributeName] = [UIFont boldSystemFontOfSize:18];
    dict[NSForegroundColorAttributeName] = RGBA_COLOR(35, 35, 35, 1);
    [bar setTitleTextAttributes:dict];
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    
//    //<UIScreenEdgePanGestureRecognizer: 0x7fad6ac47370; state = Possible; delaysTouchesBegan = YES; view = <UILayoutContainerView 0x7fad6af91570>; target= <(action=handleNavigationTransition:, target=<_UINavigationInteractiveTransition 0x7fad6ac48190>)>>
//    //添加一个可以全局滑动的手势，并且保持target和action与原有的手势相同.
//    UIPanGestureRecognizer *gest = [[UIPanGestureRecognizer alloc]initWithTarget:self.interactivePopGestureRecognizer.delegate action:@selector(handleNavigationTransition:)];
//    [self.view addGestureRecognizer:gest];
//    //全局手势什么时候触发，只能由非根控制器触发
//    gest.delegate = self;
//    //禁止之前的手势
//    self.interactivePopGestureRecognizer.enabled = NO;

}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {

    //设置返回按钮
    if (self.viewControllers.count > 0) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
        [button addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
        [button setImage:[UIImage imageNamed:@"sign_exchange"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"sign_exchange"] forState:UIControlStateHighlighted];
        //重新覆盖逻辑
        button.size = CGSizeMake(44, 44);
        button.contentHorizontalAlignment=
            UIControlContentHorizontalAlignmentLeft;
        
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
        viewController.hidesBottomBarWhenPushed = YES;
        viewController.tabBarController.tabBar.hidden = YES;
    }
    [super pushViewController:viewController animated:animated];
}

- (void)click{
    
    [self popViewControllerAnimated:YES];
}
#pragma mark - UIGestureRecognizerDelegate
////决定是否开启滑动手势
//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
//    
//    return self.childViewControllers.count > 1;
//}

@end

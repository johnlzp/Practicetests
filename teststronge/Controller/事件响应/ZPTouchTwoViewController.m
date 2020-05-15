//
//  ZPTouchTwoViewController.m
//  teststronge
//
//  Created by OS on 2020/4/16.
//  Copyright © 2020 OS. All rights reserved.
//

#import "ZPTouchTwoViewController.h"

@interface ZPTouchTwoViewController ()

@end

@implementation ZPTouchTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self printResponderChain];
    [super touchesBegan:touches withEvent:event];
    NSLog(@"控制器 %s",__func__);
}
 
- (void)printResponderChain
{
    UIResponder *responder = self;
    printf("%s",[NSStringFromClass([responder class]) UTF8String]);
    while (responder.nextResponder) {
        responder = responder.nextResponder;
        printf(" --> %s",[NSStringFromClass([responder class]) UTF8String]);
    }
}

- (IBAction)blueClick:(id)sender {
    NSLog(@"蓝色点击");
}

- (IBAction)orangeClick:(id)sender {
    NSLog(@"橙色点击");
}
- (IBAction)redClick:(id)sender {
    NSLog(@"红色点击");
}

@end

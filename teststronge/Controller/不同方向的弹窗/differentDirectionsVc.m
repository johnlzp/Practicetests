//
//  differentDirectionsVc.m
//  teststronge
//
//  Created by 刘佳 on 2020/5/20.
//  Copyright © 2020 OS. All rights reserved.
//

#import "differentDirectionsVc.h"
#import "ZPBottomPopupView.h"
#import "ZPTestbottomPopView.h"

@interface differentDirectionsVc ()

@end

@implementation differentDirectionsVc

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

#pragma action
- (IBAction)bottomPopupClick:(id)sender {
    [ZPTestbottomPopView ShowTestBottomPopView];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

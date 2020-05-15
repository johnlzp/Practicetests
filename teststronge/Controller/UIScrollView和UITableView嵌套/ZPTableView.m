//
//  ZPTableView.m
//  teststronge
//
//  Created by OS on 2019/12/20.
//  Copyright © 2019 OS. All rights reserved.
//

#import "ZPTableView.h"
@interface ZPTableView()<UIGestureRecognizerDelegate>

@end
@implementation ZPTableView

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initTableView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    if (self = [super initWithFrame:frame style:style] ) {
        [self initTableView];
    }
    return self;
}

- (void)initTableView{
    self.canResponseMutiGesture = NO;
}

- (void)setCanResponseMutiGesture:(BOOL)canResponseMutiGesture{
    _canResponseMutiGesture = canResponseMutiGesture;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
//    NSLog(@"是否响应多个%ld",self.canResponseMutiGesture);
    self.canResponseMutiGesture = YES;
    return self.canResponseMutiGesture;
}
 

 
@end

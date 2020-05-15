//
//  ZPTest1.m
//  teststronge
//
//  Created by OS on 2020/4/16.
//  Copyright © 2020 OS. All rights reserved.
//

#import "ZPTest1.h"

@implementation ZPTest1

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self printResponderChain];
    [super touchesBegan:touches withEvent:event];
    NSLog(@"tst1");
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
@end

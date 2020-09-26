//
//  ZPBallResultScrollView.m
//  teststronge
//
//  Created by 刘佳 on 2020/9/26.
//  Copyright © 2020 OS. All rights reserved.
//

#import "ZPBallResultScrollView.h"
@interface ZPBallResultScrollView()

@end
@implementation ZPBallResultScrollView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.scrollEnabled = NO;
    }
    return self;
}

- (void)configViewWith:(NSArray *)array{
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    for (int i = 0; i < array.count; i++) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(i * 39, 0, 30, 30)];
        label.backgroundColor = [UIColor redColor];
        label.text = array[i];
        label.layer.cornerRadius = 15;
        label.layer.masksToBounds = TRUE;
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
    }
    self.contentSize = CGSizeMake(array.count * 39, 0);
}

@end

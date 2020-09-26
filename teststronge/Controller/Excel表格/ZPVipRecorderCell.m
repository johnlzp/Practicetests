//
//  ZPVipRecorderCell.m
//  teststronge
//
//  Created by 刘佳 on 2020/9/26.
//  Copyright © 2020 OS. All rights reserved.
//

#import "ZPVipRecorderCell.h"

@implementation ZPVipRecorderCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.contentView.backgroundColor = [UIColor colorWithHexString:@"#E6E6E6"];
        self.leftView = [UIView new];
        self.leftView.backgroundColor = [UIColor colorWithHexString:@"#E6E6E6"];
        [self.contentView addSubview:self.leftView];
        [self.leftView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(1);
            make.bottom.mas_equalTo(-1);
            make.top.mas_equalTo(0);
            make.width.mas_equalTo([self getViewWidth:61]);
        }];
        
        self.rightView = [UIView new];
        self.rightView.backgroundColor = [UIColor colorWithHexString:@"#E6E6E6"];
        [self.contentView addSubview:self.rightView];
        [self.rightView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.leftView.mas_right).offset(1);
            make.bottom.top.mas_equalTo(self.leftView);
            make.right.mas_equalTo(-1);
        }];
    }
    return self;
}

- (CGFloat)getViewWidth:(CGFloat)width{
    CGFloat w = (width / 351.0) * SCREEN_WIDTH;
    return w;
}

- (UILabel *)labelWithText:(NSString *)text{
    UILabel *label = [UILabel new];
    label.text = text;
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:14];
    label.textColor = [UIColor blackColor];
    return label;
}
@end

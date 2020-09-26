//
//  ZPExcelCell.m
//  teststronge
//
//  Created by 刘佳 on 2020/9/26.
//  Copyright © 2020 OS. All rights reserved.
//

#import "ZPExcelCell.h"
@interface ZPExcelCell()

//加入缩水
@property(nonatomic,strong)UIButton *joinWaterBtn;
@end
@implementation ZPExcelCell

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {        
        [self configLeftView];
        [self configRightViewWithArray:@[@" 1,3,5,7", @" 2,3,4"]];
    }
    return self;
}

- (UIButton *)joinWaterBtn{
    if (!_joinWaterBtn) {
        _joinWaterBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_joinWaterBtn setTitle:@"加入缩水" forState:UIControlStateNormal];
        _joinWaterBtn.titleLabel.font = [UIFont systemFontOfSize:14];
        _joinWaterBtn.backgroundColor = [UIColor whiteColor];
        [_joinWaterBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _joinWaterBtn.hidden = YES;
        [self.contentView addSubview:_joinWaterBtn];
        [_joinWaterBtn mas_makeConstraints:^(MASConstraintMaker *make) {
           make.width.mas_equalTo([self getViewWidth:85]);
           make.bottom.top.mas_equalTo(self.leftView);
           make.right.mas_equalTo(-1);
        }];
    }
    return _joinWaterBtn;
}


- (void)configLeftView{
    UILabel *titleLabel = [self labelWithText:@"前区杀码"];
    [self.leftView addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.leftView);
    }];
}

- (void)configRightViewWithArray:(NSArray *)array{
    for (int i = 0; i < array.count; i++) {
        UILabel *titleLabel = [self labelWithText:@"杀三码"];
        [self.rightView addSubview:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(31);
            make.left.mas_equalTo(0);
            make.top.mas_equalTo(i * 32);
            make.width.mas_equalTo([self getViewWidth:48]);
        }];
        
        UILabel *valueLabel = [self labelWithText:array[i]];
        [self.rightView addSubview:valueLabel];
        [valueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.height.mas_equalTo(titleLabel);
            make.left.mas_equalTo(titleLabel.mas_right).offset(1);
//            if (self.isCurrent) {//开通了会员
//                make.right.mas_equalTo(-[self getViewWidth:85]);
//            }else{
            make.right.mas_equalTo(-1);
//            }
            
        }];
    }
    
//    [self addJoinBtn:NO];
}

- (void)setIsCurrent:(BOOL)isCurrent{
    _isCurrent = isCurrent;
    [self addJoinBtn:isCurrent];
}

- (void)addJoinBtn:(BOOL)isJoinVip{
    self.joinWaterBtn.hidden = !isJoinVip;
    [self.rightView mas_updateConstraints:^(MASConstraintMaker *make) {
        if (isJoinVip) {//本期预测
//            make.right.mas_equalTo(self.joinWaterBtn.mas_left).offset(-1);
            make.right.mas_equalTo( - ([self getViewWidth:85] + 1));
        }else{
            make.right.mas_equalTo(-1);
        }
    }];
    
}


@end

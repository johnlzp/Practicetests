//
//  ZPCustomAlertView.m
//  teststronge
//
//  Created by OS on 2019/9/19.
//  Copyright © 2019 OS. All rights reserved.
//

#import "ZPCustomAlertView.h"
#import <Masonry.h>
// 主按钮字体颜色
#define MAIN_BUTTON_COLOR [UIColor orangeColor]
// 主按钮font
#define MAIN_BUTTON_FONT [UIFont boldSystemFontOfSize:18]
// 普通按钮字体颜色
#define NORMAL_BUTTON_COLOR [UIColor blackColor]
// 普通按钮font
#define NORMAL_BUTTON_FONT [UIFont systemFontOfSize:18]

// 灰色线的颜色
#define LINE_COLOR [UIColor lightGrayColor]

static NSInteger const buttonTag = 1000;
@interface ZPCustomAlertView()
/**内容view*/
@property (nonatomic,strong)UIView *contentView;
@property (nonatomic,copy)void(^buttonBlock)(NSInteger index);

@end
@implementation ZPCustomAlertView

+ (instancetype)showWithTitle:(NSString *)title content:(NSString *)content buttonTitlesArray:(NSArray *)buttonTitlesArray buttonBlock:(void(^)(NSInteger index))buttonBlock{

    ZPCustomAlertView *alertView = [[ZPCustomAlertView alloc]initWithTitle:title content:content buttonTitlesArray:buttonTitlesArray buttonBlock:buttonBlock];
    [[UIApplication sharedApplication].delegate.window addSubview:alertView];
    [alertView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(alertView.superview);
    }];
    alertView.alpha = 0;
    alertView.contentView.transform = CGAffineTransformScale(alertView.contentView.transform, 1.2, 1.2);
    [UIView animateWithDuration:0.2 animations:^{
        alertView.alpha = 1;
        alertView.contentView.transform = CGAffineTransformIdentity;
    }];
    
    return alertView;
}

- (instancetype)initWithTitle:(NSString *)title content:(NSString *)content buttonTitlesArray:(NSArray *)buttonTitlesArray buttonBlock:(void(^)(NSInteger index))buttonBlock{
    if (self = [super init]) {
        self.buttonBlock = buttonBlock;
        //========== UI ==========//
        UIView *contentView = [UIView new];
        contentView.layer.cornerRadius = 8;
        contentView.backgroundColor = [UIColor whiteColor];
        [self addSubview:contentView];
        self.contentView = contentView;
        [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(60);
            make.right.mas_offset(-60);
            make.center.mas_equalTo(self);
        }];
        
        //------- title -------//
        UILabel *titleLabel = [[UILabel alloc]init];
        titleLabel.font = [UIFont systemFontOfSize:18.0];
        titleLabel.numberOfLines = 0;
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.text = title;
        [self.contentView addSubview:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_offset(20);
            make.left.mas_offset(12);
            make.right.mas_offset(-12);
        }];
        
        //------- content -------//
        UILabel *contentLabel = [UILabel new];
        contentLabel.textAlignment = NSTextAlignmentCenter;
        contentLabel.numberOfLines = 0;
        contentLabel.text = content;
        [self.contentView addSubview:contentLabel];
        [contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_offset(12);
            make.right.mas_offset(-12);
        }];
        if (!title || title == nil) {//没有标题
            contentLabel.font = [UIFont systemFontOfSize:18.0];
            contentLabel.textColor = [UIColor blackColor];
            [contentLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(20);
            }];
        }else{
            contentLabel.font = [UIFont boldSystemFontOfSize:16];
            contentLabel.textColor = [UIColor grayColor];
            [contentLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(titleLabel.mas_bottom).mas_offset(15);
            }];
        }
        
        //------- line -------//
        UIView *grayLine = [UIView new];
        grayLine.backgroundColor = LINE_COLOR;
        [self.contentView addSubview:grayLine];
        [grayLine mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_offset(0);
            make.height.mas_equalTo(1);
            make.top.mas_equalTo(contentLabel.mas_bottom).mas_offset(20);
        }];
        
        //------- buttons -------//
        if (buttonTitlesArray.count == 0) {
            NSAssert(nil, @"弹窗按钮数量不能为0");
        }else if (buttonTitlesArray.count == 1){
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.titleLabel.font = MAIN_BUTTON_FONT;
            [button setTitleColor:MAIN_BUTTON_COLOR forState:UIControlStateNormal];
            [button setTitle:buttonTitlesArray.firstObject forState:UIControlStateNormal];
            [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
            button.tag = buttonTag;
            [self.contentView addSubview:button];
            [button mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.left.right.mas_offset(0);
                make.top.mas_equalTo(grayLine.mas_bottom);
            }];
        }else{
            NSMutableArray *array = [NSMutableArray array];
            [buttonTitlesArray enumerateObjectsUsingBlock:^(NSString *  _Nonnull str, NSUInteger i, BOOL * _Nonnull stop) {
                UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
                [button setTitle:str forState:UIControlStateNormal];
                [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
                button.tag = buttonTag + i;
                [self.contentView addSubview:button];
                [array addObject:button];
                if (i == buttonTitlesArray.count - 1) {//默认最后一个是主按钮
                    button.titleLabel.font = MAIN_BUTTON_FONT;
                    [button setTitleColor:MAIN_BUTTON_COLOR forState:UIControlStateNormal];
                }else{
                    button.titleLabel.font = NORMAL_BUTTON_FONT;
                    [button setTitleColor:NORMAL_BUTTON_COLOR forState:UIControlStateNormal];
                    UIView *lineView = [UIView new];
                    lineView.backgroundColor = LINE_COLOR;
                    [button addSubview:lineView];
                    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
                        make.bottom.top.mas_offset(0);
                        make.right.mas_offset(-0.5);
                        make.width.mas_equalTo(1);
                    }];
                }
            }];
            
            [array mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:0 leadSpacing:0 tailSpacing:0];
            [array mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(grayLine.mas_bottom);
                make.bottom.mas_offset(0);
                make.height.mas_equalTo(50);
            }];
        }
    }
    return self;
}

#pragma mark - action
- (void)buttonClick:(UIButton *)btn{
    !self.buttonBlock ? :self.buttonBlock(btn.tag - buttonTag);
    [self removeFromSuperview];
}

-(void)dealloc{
    NSLog(@"弹窗销毁");
}
@end

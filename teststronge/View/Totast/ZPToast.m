//
//  ZPToast.m
//  teststronge
//
//  Created by OS on 2019/9/18.
//  Copyright © 2019 OS. All rights reserved.
//

#import "ZPToast.h"
#import <Masonry.h>
typedef enum :NSUInteger{
    ZPTextToast,
    ZPImageToast,
    ZPImageAndTextToast,
}ZPTostType;

/**toast初始化背景颜色*/
static UIColor *ZPToastInitalBackGroundColor;
/**toast初始化文本颜色*/
static UIColor *ZPToastInitalTextColor;
/**toast初始化展示时间*/
static NSTimeInterval ZPToastInitalDuration;
/**toast初始化消失时间*/
static NSTimeInterval ZPToastInitalFadeDuration;

/**toast默认背景颜色*/
static UIColor *ZPToastDefaultBackGroundColor;
/**toast默认文本颜色*/
static UIColor *ZPToastDefaultTextColor;
/**toast默认展示时间*/
static NSTimeInterval ZPToastDefaultDuration;
/**toast默认消失时间*/
static NSTimeInterval ZPToastDefaultFadeDuration;

@interface ZPToast()

@property (nonatomic, strong) UILabel      *messageLabel;
@property (nonatomic, strong) UIImageView  *imageView;

@end
@implementation ZPToast

+ (void)initialize{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ZPToastInitalBackGroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.9];
        ZPToastInitalTextColor = [UIColor whiteColor];
        ZPToastInitalDuration = 2;
        ZPToastInitalFadeDuration = 0.3;
        
        ZPToastDefaultBackGroundColor = ZPToastInitalBackGroundColor;
        ZPToastDefaultTextColor =  ZPToastInitalTextColor;
        ZPToastDefaultDuration = ZPToastInitalDuration;
        ZPToastDefaultFadeDuration = ZPToastInitalFadeDuration;
    });
}

- (instancetype)init{
    if (self = [super init]) {
        self.messageLabel = [UILabel new];
        self.messageLabel.textAlignment = NSTextAlignmentCenter;
        self.messageLabel.textColor = ZPToastDefaultTextColor ? :ZPToastInitalTextColor;
        self.messageLabel.numberOfLines = 0;
        self.imageView = [UIImageView new];
        [self addSubview:self.messageLabel];
        [self addSubview:self.imageView];
        
        self.layer.cornerRadius = 5;
        self.backgroundColor = ZPToastDefaultBackGroundColor ? :ZPToastInitalBackGroundColor;
        
    }
    return self;
}

#pragma mark - 创建UI
/**纯文本UI*/
- (void)setupTextToastWithMessage:(NSString *)message{
    self.messageLabel.text = message;
    self.messageLabel.font = [UIFont systemFontOfSize:15.0];
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(self.messageLabel).mas_offset(-20);
        make.bottom.right.mas_equalTo(self.messageLabel).mas_offset(20);
        make.center.mas_equalTo(self.superview);
    }];
    
    [self.messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        //不能超过140
        make.width.mas_lessThanOrEqualTo(140);
        make.center.mas_equalTo(self.messageLabel.superview);
        
    }];
}

/**图片 + 文本 UI*/
- (void)setupTextToastWithMessage:(NSString *)message image:(NSString *)image{
    self.messageLabel.text = message;
    self.messageLabel.font = [UIFont systemFontOfSize:15.0];
    self.imageView.image = [UIImage imageNamed:image];
    
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.superview);
        make.width.mas_equalTo(140);
    }];
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(34, 34));
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(self.imageView.superview).mas_offset(20);
    }];
    
    [self.messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.messageLabel.superview);
        make.width.mas_lessThanOrEqualTo(130);
        make.top.mas_equalTo(self.imageView.mas_bottom).mas_offset(20);
        make.bottom.mas_offset(-18);
    }];
}

/**点赞 UI*/
- (void)setupImageToast{
    self.backgroundColor = [UIColor whiteColor];
    self.imageView.image = [UIImage imageNamed:@"zan"];
    self.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2-20, [UIScreen mainScreen].bounds.size.height/2-20, 40, 40);
    self.imageView.frame = self.bounds;
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    animation.values = @[@1.0 , @1.5];
    animation.duration = 0.3;
    animation.calculationMode = kCAAnimationCubic;
    [self.layer addAnimation:animation forKey:@"transform.scale"];
}


- (void)p_setpMessage:(NSString *)message image:(NSString *)image toastType:(ZPTostType)toastType{
    switch (toastType) {
            case ZPTextToast:
        {
            [self setupTextToastWithMessage:message];
        }
            break;
            case ZPImageToast:
        {
            [self setupImageToast];
        }
            break;
            case ZPImageAndTextToast:
        {
            [self setupTextToastWithMessage:message image:image];
        }
            break;
            
        default:
            break;
    }
}

/**纯文本*/
+ (void)TextToastWithMessage:(NSString *)message{
    [ZPToast showMessage:message image:nil duration:ZPToastDefaultDuration fade:ZPToastDefaultFadeDuration toastType:ZPTextToast];
}

/**文本 + 图片*/
+ (void)TextToastWithMessage:(NSString *)message image:(NSString *)image{
    [ZPToast showMessage:message image:image duration:ZPToastDefaultDuration fade:ZPToastDefaultFadeDuration toastType:ZPImageAndTextToast];
}

+ (void)TextToastWithMessage:(NSString *)message image:(NSString *)image duration:(NSTimeInterval)duration{
    [ZPToast showMessage:message image:image duration:duration fade:ZPToastDefaultFadeDuration toastType:ZPImageAndTextToast];
}

+ (void)zanImageToast{
    [ZPToast showMessage:nil image:nil duration:ZPToastDefaultDuration fade:ZPToastDefaultFadeDuration toastType:ZPImageToast];
}

+ (void)showZanWithDuration:(NSTimeInterval)duration{
    [ZPToast showMessage:nil image:nil duration:duration fade:ZPToastDefaultFadeDuration toastType:ZPImageToast];
}

+ (void)showMessage:(NSString *)message image:(NSString *)image duration:(NSTimeInterval)duration fade:(NSTimeInterval)fade toastType:(ZPTostType)toastType{
    dispatch_async(dispatch_get_main_queue(), ^{
        ZPToast *toast = [[ZPToast alloc]init];
        [[UIApplication sharedApplication].delegate.window addSubview:toast];
        [toast p_setpMessage:message image:image toastType:toastType];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:fade animations:^{
                toast.alpha = 0;
            } completion:^(BOOL finished) {
                [toast removeFromSuperview];
            }];
        });
    });
}

#pragma mark - 默认值设置
/** 设置toast的默认背景颜色 */
+ (void)setDefaultBackgroundColor:(UIColor *)defaultBackgroundColor{
    ZPToastDefaultBackGroundColor = defaultBackgroundColor;
}

/** 设置默认字体颜色，未设置为白色 */
+ (void)setDefaultTextColor:(UIColor *)defaultTextColor{
    ZPToastDefaultTextColor = defaultTextColor;
}

/** 设置toast展示的默认时间，未设置为2秒 */
+ (void)setDefaultDuration:(NSTimeInterval)defaultDuration{
    ZPToastDefaultDuration = defaultDuration;
}

/** 设置toast消失的默认时间，未设置为0.3秒 */
+ (void)setDefaultFadeDuration:(NSTimeInterval)defaultFadeDuration{
    ZPToastDefaultFadeDuration = defaultFadeDuration;
}
@end

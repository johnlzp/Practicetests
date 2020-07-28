//
//  ZPBottomPopupView.h
//  teststronge
//
//  Created by 刘佳 on 2020/5/20.
//  Copyright © 2020 OS. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZPBottomPopupView : UIView
@property(nonatomic,strong)UIView *customView;

+ (instancetype)showWithBottomPopupView;
- (instancetype)initWithBottomPopupView;
- (void)dismiss;
@end

NS_ASSUME_NONNULL_END

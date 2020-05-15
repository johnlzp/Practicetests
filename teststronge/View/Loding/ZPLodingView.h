//
//  ZPLodingView.h
//  teststronge
//
//  Created by OS on 2019/9/27.
//  Copyright © 2019 OS. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZPLodingView : UIView

+ (void)show;
+ (void)showWithInfo:(NSString *)info;
+ (void)showOnView:(UIView *)superView;
+ (void)showOnView:(UIView *)superView withInfo:(NSString *)info;

/**如果添加loding在了指定superView 那么删除也需要指定superView删除*/
+ (void)remove;
+ (void)removeFromView:(UIView *)superView;

 
@end

NS_ASSUME_NONNULL_END

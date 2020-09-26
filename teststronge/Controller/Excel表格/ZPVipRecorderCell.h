//
//  ZPVipRecorderCell.h
//  teststronge
//
//  Created by 刘佳 on 2020/9/26.
//  Copyright © 2020 OS. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZPVipRecorderCell : UICollectionViewCell
@property(nonatomic,strong)UIView *rightView;
@property(nonatomic,strong)UIView *leftView;

- (CGFloat)getViewWidth:(CGFloat)width;
- (UILabel *)labelWithText:(NSString *)text;
@end

NS_ASSUME_NONNULL_END

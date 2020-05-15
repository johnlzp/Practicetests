//
//  ZPMenuScrollView.h
//  teststronge
//
//  Created by OS on 2019/9/18.
//  Copyright © 2019 OS. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class ZPMenuScrollView;
@protocol ZPMenuScrollDelegate <NSObject>

/**菜单按钮点击时的回掉*/
- (void)MenuScrollView:(ZPMenuScrollView *)view currentIndex:(NSInteger)currentIndex;

@end

@interface ZPMenuScrollView : UIScrollView
@property (nonatomic,weak)id<ZPMenuScrollDelegate> MenuClickDelegate;
@property (nonatomic,strong)NSArray *titleArray;
@property (nonatomic,assign)NSInteger currentButtonIndex;
@end

NS_ASSUME_NONNULL_END

//
//  ZPTableView.h
//  teststronge
//
//  Created by OS on 2019/12/20.
//  Copyright © 2019 OS. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
 
@interface ZPTableView : UITableView
/**是否同时响应多个手势 默认NO*/
@property (nonatomic, assign) BOOL canResponseMutiGesture;
//**获取tableView偏移量的Block*/
@property (nonatomic , copy) void(^scrollViewDidScrollBlock)(UIScrollView * scrollView);
 
@end

NS_ASSUME_NONNULL_END

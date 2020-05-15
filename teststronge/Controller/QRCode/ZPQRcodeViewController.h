//
//  ZPQRcodeViewController.h
//  CiHua
//
//  Created by OS on 2019/5/8.
//  Copyright © 2019 LSFB. All rights reserved.
//

#import "ZPBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^scanCode)(NSString *scanCode);
@interface ZPQRcodeViewController : ZPBaseViewController
@property(copy,nonatomic) scanCode scanCallBack;
@end

NS_ASSUME_NONNULL_END

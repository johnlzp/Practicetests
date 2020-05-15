//
//  ZPNetWorkManager.h
//  teststronge
//
//  Created by OS on 2020/1/13.
//  Copyright © 2020 OS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMNetworking.h"

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSInteger, XMNetworkErrorCode) {
    kXMSuccessCode = 0,      //!< 接口请求成功
    kXMErrorCode = 1,        //!< 接口请求失败
    kXMUnknownCode = -1,     //!< 未知错误
};
@interface ZPNetWorkManager : NSObject

+ (void)setup;
@end

NS_ASSUME_NONNULL_END

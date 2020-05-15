//
//  ZPNetWorkManager.m
//  teststronge
//
//  Created by OS on 2020/1/13.
//  Copyright © 2020 OS. All rights reserved.
//

#import "ZPNetWorkManager.h"
NSString * const XMNetworkErrorDomain = @"XMNetworkErrorDomain";

static NSError * XMNetworkErrorGenerator(NSInteger code, NSString *msg) {
    NSDictionary *userInfo = @{NSLocalizedDescriptionKey: msg.length > 0 ? msg : @""};
    NSError * __autoreleasing error = [NSError errorWithDomain:XMNetworkErrorDomain code:code userInfo:userInfo];
    return error;
}

@implementation ZPNetWorkManager

+ (void)setup{
    [XMCenter setupConfig:^(XMConfig * _Nonnull config) {
        config.generalHeaders = @{};
        config.callbackQueue = dispatch_get_main_queue();
#ifdef DEBUG
        config.consoleLog = YES;
#endif
    }];
    // 请求预处理插件
    [XMCenter setRequestProcessBlock:^(XMRequest *request) {
        // 在这里对所有的请求进行统一的预处理，如业务数据加密等
        NSMutableDictionary *headers = [[NSMutableDictionary alloc] initWithDictionary:request.headers];
        request.headers = headers;
        request.responseSerializerType = kXMResponseSerializerJSON;
        request.requestSerializerType = kXMRequestSerializerJSON;
    }];
    
    // 响应后处理插件
    // 如果 Block 的返回值不为空，则 responseObject 会被替换为 Block 的返回值
    [XMCenter setResponseProcessBlock:^id(XMRequest *request, id responseObject, NSError *__autoreleasing * error) {
        // 在这里对请求的响应结果进行统一处理，如业务数据解密等
        if (![request.server isEqualToString:@"www.baidu.com"]) {
            return nil;
        }
        if ([responseObject isKindOfClass:[NSDictionary class]] && [[responseObject allKeys] count] > 0) {
            NSInteger code = [responseObject[@"code"] integerValue];
            if (code != kXMSuccessCode) {
                // 网络请求成功，但接口返回的 Code 表示失败，这里给 *error 赋值，后续走 failureBlock 回调
                *error = XMNetworkErrorGenerator(code, responseObject[@"msg"]);
            } else {
                // 返回的 Code 表示成功，对数据进行加工过滤，返回给上层业务
                NSDictionary *resultData = responseObject[@"data"];
                return resultData;
            }
        }
        return nil;
    }];
    
     // 错误统一过滤处理
    [XMCenter setErrorProcessBlock:^(XMRequest *request, NSError *__autoreleasing * error) {
        // 比如对不同的错误码统一错误提示等
//            if ((* error).code == 500) {
//            }
        NSLog(@"");
    }];
}

@end

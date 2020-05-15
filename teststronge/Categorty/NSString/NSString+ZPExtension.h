//
//  NSString+ZPExtension.h
//  CiHua
//
//  Created by OS on 2019/3/7.
//  Copyright © 2019年 LSFB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ZPExtension)


/**
 判断是否是中文
 */
- (BOOL)isChinese;
/**字典转化字符串*/
+ (NSString*)dictionaryToJson:(NSDictionary *)dic;
/**字符串转字典*/
+ (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;
/**字符串转base64（加密）*/
+ (NSString *)base64StringFromText:(NSString *)text;

/**base64转字符串（解密）*/
+ (NSString *)textFromBase64String:(NSString *)base64;

/**base64编码*/
+ (NSString *)base64EncodeString:(NSString *)string;

/**base64解码*/
+ (NSString *)base64DecodeString:(NSString *)string;
@end

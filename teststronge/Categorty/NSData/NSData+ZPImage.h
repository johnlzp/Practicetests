//
//  NSData+ZPImage.h
//  CiHua
//
//  Created by OS on 2019/4/7.
//  Copyright © 2019年 LSFB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (ZPImage)
+ (NSDictionary*)returnDictionaryWithDataPath:(NSData*)data;
//图片压缩
+ (NSData *)resetSizeOfImageData:(UIImage *)sourceImage maxSize:(NSInteger)maxSize;
@end

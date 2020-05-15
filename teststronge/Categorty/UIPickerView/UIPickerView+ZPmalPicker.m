//
//  UIPickerView+ZPmalPicker.m
//  CiHua
//
//  Created by OS on 2019/6/28.
//  Copyright © 2019 LSFB. All rights reserved.
//

#import "UIPickerView+ZPmalPicker.h"

@implementation UIPickerView (ZPmalPicker)

- (void)clearSpearatorLine
{
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if (obj.frame.size.height < 1)
        {
            [obj setBackgroundColor:[UIColor clearColor]];
        }
    }];
}

@end

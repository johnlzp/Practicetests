//
//  ZPExcelCell.h
//  teststronge
//
//  Created by 刘佳 on 2020/9/26.
//  Copyright © 2020 OS. All rights reserved.
//

#import "ZPVipRecorderCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZPExcelCell : ZPVipRecorderCell
//是否是本期预测
@property(nonatomic,assign)BOOL isCurrent;
@end

NS_ASSUME_NONNULL_END

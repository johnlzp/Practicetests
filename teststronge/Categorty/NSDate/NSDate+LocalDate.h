//
//  NSDate+LocalDate.h
//  CiHua
//
//  Created by zgscwjm on 2019/3/8.
//  Copyright © 2019年 LSFB. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (LocalDate)

+(NSInteger) localDateYear;
+(NSInteger) localDateMonth;
+(NSInteger) localDateDay;

//获取NSDate的年份
+ (NSInteger)getLoaclYear:(NSDate *)date;
+ (NSInteger)getLoaclMonth:(NSDate *)date;
+ (NSInteger)getLoaclDay:(NSDate *)date;

/** 根据指定格式返回时间*/
+ (NSString *)getNowTimeTimestampWith:(NSString *)temp;

/** 处理时间成时间戳，返回字符串 */
+ (NSString *)dealDateTime:(NSString *)dateTimeStr;
/**获取当前时间戳*/
+ (NSString *)getNowTimeTimestamp;
/**获取当前的时间*/
+ (NSString*)getCurrentTimes;
/**获取当前是几号*/
+ (int )currentDayDate;
/**判断今天是星期几*/
+ (NSString *) getweekDayStringWithDate:(NSDate *) date;

//获取当前精确到毫秒的时间
+ (NSString *)getTimeNow;
//计算N天后的日期
+ (NSDate *)getTimeAfterNowWithDay:(int)day date:(NSDate *)date;
//计算相差多少天
+ (NSInteger)getDifferenceByDate:(NSDate *)date;

/**按指定格式，将字符串转为时间戳*/
+(NSInteger)timeSwitchTimestamp:(NSString *)formatTime andFormatter:(NSString *)format;
/**按指定格式，将时间戳转化为字符串*/
+(NSString *)timestampSwitchTime:(NSInteger)timestamp andFormatter:(NSString *)format;

/**比较两个时间(xxxx年xx月xx日)的差值*/
+ (NSDateComponents *)compareWithDate:(NSString *)fromeStr toDate:(NSString *)toStr;
@end

NS_ASSUME_NONNULL_END

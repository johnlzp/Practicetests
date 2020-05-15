//
//  NSDate+LocalDate.m
//  CiHua
//
//  Created by zgscwjm on 2019/3/8.
//  Copyright © 2019年 LSFB. All rights reserved.
//

#import "NSDate+LocalDate.h"

@implementation NSDate (LocalDate)


+(NSInteger) localDateYear {
 NSDate *currentDate =   [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
 return    [calendar component:NSCalendarUnitYear fromDate:currentDate];
}

+(NSInteger) localDateMonth {
    NSDate *currentDate =   [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    return    [calendar component:NSCalendarUnitMonth fromDate:currentDate];
}

+(NSInteger) localDateDay {
    NSDate *currentDate =   [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    return    [calendar component:NSCalendarUnitDay fromDate:currentDate];
}

+ (NSInteger)getLoaclYear:(NSDate *)date{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    [formatter setDateFormat:@"yyyy"];
    NSInteger currentYear=[[formatter stringFromDate:date] integerValue];
    
    return currentYear;
}

+ (NSInteger)getLoaclMonth:(NSDate *)date{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    [formatter setDateFormat:@"MM"];
    NSInteger currentMonth=[[formatter stringFromDate:date]integerValue];
    return currentMonth;
    
}

+ (NSInteger)getLoaclDay:(NSDate *)date{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"dd"];
    NSInteger currentDay=[[formatter stringFromDate:date] integerValue];
    return currentDay;
}

/** 处理时间成时间戳，返回字符串 */
+(NSString *)dealDateTime:(NSString *)dateTimeStr{
    NSDateFormatter * formatter = [[NSDateFormatter alloc]init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterMediumStyle];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    //设置时区
    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Beijing"]];
    NSDate * date = [formatter dateFromString:dateTimeStr];
    NSString * dateTime = [NSString stringWithFormat:@"%ld",(long)[date timeIntervalSince1970]];
    return dateTime;
}

//根据指定格式返回时间
+ (NSString *)getNowTimeTimestampWith:(NSString *)temp{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:temp];
    NSDate *datenow = [NSDate date];
    NSString *currentTimeString = [formatter stringFromDate:datenow];
    return currentTimeString;
}

//获取当前时间戳
+ (NSString *)getNowTimeTimestamp{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    NSDate *datenow = [NSDate date];
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]*1000];
    return timeSp;
    
}

//获取当前的时间
+ (NSString*)getCurrentTimes{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *datenow = [NSDate date];
    NSString *currentTimeString = [formatter stringFromDate:datenow];
    return currentTimeString;
    
}

//获取当前精确到毫秒的时间
+ (NSString *)getTimeNow
{
    NSString* timeNow;
    NSDateFormatter * formatter = [[NSDateFormatter alloc ] init];
    //[formatter setDateFormat:@"YYYY.MM.dd.hh.mm.ss"];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss:SSS"];
    NSString *date = [formatter stringFromDate:[NSDate date]];
    timeNow = [[NSString alloc] initWithFormat:@"%@", date];

    return timeNow;
}


+ (int )currentDayDate{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *now;
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    now=[NSDate date];
    comps = [calendar components:unitFlags fromDate:now];
    return comps.day;
}

+ (NSString *) getweekDayStringWithDate:(NSDate *) date{
    NSCalendar * calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar]; // 指定日历的算法
    NSDateComponents *comps = [calendar components:NSWeekdayCalendarUnit fromDate:date];
    // 1 是周日，2是周一 3.以此类推
    NSNumber * weekNumber = @([comps weekday]);
    NSInteger weekInt = [weekNumber integerValue];
    NSString *weekDayString = @"(周一)";
    switch (weekInt)
    {
        case 1:
        {
            weekDayString = @"07";
        }
        break;
        case 2:
        {
            weekDayString = @"01";
        }
        break;
        case 3:
        {
            weekDayString = @"02";
        }
        break;
        case 4:
        {
            weekDayString = @"03";
        }
        break;
        case 5:
        {
            weekDayString = @"04";
        }
        break;
        case 6:
        {
            weekDayString = @"05";
        }
        break;
        case 7:
        {
            weekDayString = @"06";
        }break;
        default:
        break;
    }
    return weekDayString;
}
    
+ (NSDate *)getTimeAfterNowWithDay:(int)day date:(NSDate *)date{
    NSDate *nowDate = date;
    NSDate *theDate;
    if(day!=0){
        NSTimeInterval  oneDay = 24*60*60*1;  //1天的长度
        theDate = [nowDate initWithTimeIntervalSinceNow: oneDay*day];
    }else{
        theDate = nowDate;
    }
    return theDate;
}

+ (NSInteger)getDifferenceByDate:(NSDate *)date{
    //获得当前时间
    NSDate *now = [NSDate date];
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设定时间格式
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//    NSDate *oldDate = [dateFormatter dateFromString:date];
    NSDate *oldDate = date;
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    unsigned int unitFlags = NSDayCalendarUnit;
    NSDateComponents *comps = [gregorian components:unitFlags fromDate:oldDate  toDate:now  options:0];
    return [comps day];
}

//按指定格式，将字符串转为时间戳
+(NSInteger)timeSwitchTimestamp:(NSString *)formatTime andFormatter:(NSString *)format{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:format]; //(@"YYYY-MM-dd hh:mm:ss") ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    
    [formatter setTimeZone:timeZone];
    NSDate* date = [formatter dateFromString:formatTime]; //------------将字符串按formatter转成nsdate
    
    //时间转时间戳的方法:
    
    NSInteger timeSp = [[NSNumber numberWithDouble:[date timeIntervalSince1970]] integerValue];
    return timeSp;
}

//按指定格式，将时间戳转化为字符串
+(NSString *)timestampSwitchTime:(NSInteger)timestamp andFormatter:(NSString *)format{
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    
    [formatter setDateFormat:format]; // （@"YYYY-MM-dd hh:mm:ss"）----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [formatter setTimeZone:timeZone];
    
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:timestamp];
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    
    return confromTimespStr;
    
}

+ (NSDateComponents *)compareWithDate:(NSString *)fromeStr toDate:(NSString *)toStr{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"YYYY-MM-dd  HH:mm:ss"];
    NSDate *fromeTime = [dateFormatter dateFromString:fromeStr];
    NSDate *toTime = [dateFormatter dateFromString:toStr];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit type = NSCalendarUnitWeekOfYear | NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *cmps = [calendar components:type fromDate:fromeTime toDate:toTime options:0];
    return cmps;
}

//+ (NSString *)dateWeekWithDateString:(NSString *)dateString
//{
//    NSTimeInterval time=[dateString doubleValue];
//    NSDate *date=[NSDate dateWithTimeIntervalSince1970:time];
//    NSCalendar *gregorian = [[NSCalendar alloc]
//                             initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
//    NSDateComponents *weekdayComponents =
//    [gregorian components:NSCalendarUnitWeekday fromDate:date];
//    NSInteger _weekday = [weekdayComponents weekday];
//    NSString *weekStr;
//    if (_weekday == 1) {
//        weekStr = @"星期日";
//    }else if (_weekday == 2){
//        weekStr = @"星期一";
//    }else if (_weekday == 3){
//        weekStr = @"星期二";
//    }else if (_weekday == 4){
//        weekStr = @"星期三";
//    }else if (_weekday == 5){
//        weekStr = @"星期四";
//    }else if (_weekday == 6){
//        weekStr = @"星期五";
//    }else if (_weekday == 7){
//        weekStr = @"星期六";
//    }
//    return weekStr;
//}
 
@end

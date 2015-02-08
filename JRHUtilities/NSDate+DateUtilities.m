//
//  NSDate+LBXUtilities.m
//  Longboxed-iOS
//
//  Created by johnrhickey on 8/10/14.
//  Copyright (c) 2014 Longboxed. All rights reserved.
//

#import "NSDate+DateUtilities.h"

@implementation NSDate (DateUtilities)

+ (NSString *)fuzzyTimeBetweenStartDate:(NSDate *)startDate andEndDate:(NSDate *)endDate
{    
    //http://stackoverflow.com/questions/1052951/fuzzy-date-algorithm-in-objective-c
    //Calculate the delta in seconds between the two dates
    NSTimeInterval delta = [endDate timeIntervalSinceDate:startDate];
    
    if (delta < 0) {
        int days = floor((double)delta/DAY);
        return days >= -1 ? @"tomorrow" : [NSString stringWithFormat:@"in %d days", abs(days)];
    }
    
    if (delta < 24 * HOUR)
    {
        return @"today";
    }
    if (delta < 48 * HOUR)
    {
        return @"yesterday";
    }
    if (delta < 30 * DAY)
    {
        int days = floor((double)delta/DAY);
        return [NSString stringWithFormat:@"%d days ago", days];
    }
    if (delta < 12 * MONTH)
    {
        int months = floor((double)delta/MONTH);
        return months <= 1 ? @"1 month ago" : [NSString stringWithFormat:@"%d months ago", months];
    }
    else
    {
        int years = floor((double)delta/MONTH/12.0);
        return years <= 1 ? @"1 year ago" : [NSString stringWithFormat:@"%d years ago", years];
    }
}

+ (NSDate *)getThisWednesdayOfDate:(NSDate *)date
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *componentsDay = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitWeekOfMonth|NSCalendarUnitWeekday fromDate:date];
    [componentsDay setWeekday:4];
    return [calendar dateFromComponents:componentsDay];
}

+ (NSDate *)getNextWednesdayOfDate:(NSDate *)date
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *components = [NSDateComponents new];
    [components setWeekOfMonth:1];
    NSDate *newDate = [calendar dateByAddingComponents:components toDate:date options:0];
    NSDateComponents *componentsDay = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitWeekOfMonth|NSCalendarUnitWeekday fromDate:newDate];
    [componentsDay setWeekday:4];
    return [calendar dateFromComponents:componentsDay];
}



@end

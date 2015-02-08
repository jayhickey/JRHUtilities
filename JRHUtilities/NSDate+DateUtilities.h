//
//  NSDate+LBXUtilities.h
//  Longboxed-iOS
//
//  Created by johnrhickey on 8/10/14.
//  Copyright (c) 2014 Longboxed. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (DateUtilities)

#define SECOND 1
#define MINUTE (60 * SECOND)
#define HOUR (60 * MINUTE)
#define DAY (24 * HOUR)
#define MONTH (30 * DAY)

+ (NSString *)fuzzyTimeBetweenStartDate:(NSDate *)startDate andEndDate:(NSDate *)endDate;
+ (NSDate *)getThisWednesdayOfDate:(NSDate *)date;
+ (NSDate *)getNextWednesdayOfDate:(NSDate *)date;

@end

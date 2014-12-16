//
//  NSString+StringUtilities.h
//  Longboxed-iOS
//
//  Created by johnrhickey on 12/9/14.
//  Copyright (c) 2014 Longboxed. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (StringUtilities)

+ (NSString *)getHashOfImage:(UIImage *)image;
+ (NSString *)localTimeZoneStringWithDate:(NSDate *)date;
+ (NSString *)regexOutHTMLJunk:(NSString *)string;
+ (NSString *)diskUsage;
+ (NSString *)appVersion;
+ (NSString *)appBuildNumber;
+ (NSString *)feedbackEmailTemplate;

@end

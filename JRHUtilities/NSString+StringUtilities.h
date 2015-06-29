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

+ (NSString *)randomStringWithLength:(int)len;
+ (NSString *)getHashOfImage:(UIImage *)image;
+ (NSString *)localTimeZoneStringWithDate:(NSDate *)date;
+ (NSString *)HTMLEncodeString:(NSString *)string;
+ (NSString *)convertToMACAddress:(NSString *)string;
+ (NSString *)diskUsage;
+ (NSString *)appVersion;
+ (NSString *)appBuildNumber;
+ (NSString *)feedbackEmailTemplate;

// Depreciated Methods
+ (NSString *)fixHTMLAttributes:(NSString *)string __deprecated_msg("This method is not thread-safe. Use https://github.com/mwaterfall/MWFeedParser instead");

@end

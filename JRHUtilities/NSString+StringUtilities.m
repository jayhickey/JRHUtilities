//
//  NSString+StringUtilities.m
//  Longboxed-iOS
//
//  Created by johnrhickey on 12/9/14.
//  Copyright (c) 2014 Longboxed. All rights reserved.
//

#import "NSString+StringUtilities.h"
#import <CommonCrypto/CommonDigest.h>
#import <sys/utsname.h>

@implementation NSString (StringUtilities)

+ (NSString *)getHashOfImage:(UIImage *)image
{
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    NSData *imageData = [NSData dataWithData:UIImagePNGRepresentation(image)];
    CC_MD5([imageData bytes], (uint)[imageData length], result);
    return [NSString stringWithFormat:
            @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

+ (NSString *)localTimeZoneStringWithDate:(NSDate *)date
{
    NSDateFormatter *formatter = [NSDateFormatter new];
    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
    [formatter setDateStyle:NSDateFormatterLongStyle];
    
    NSNumberFormatter *numFormatter = [[NSNumberFormatter alloc] init];
    [numFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [numFormatter setMinimumFractionDigits:2];
    return [formatter stringFromDate:date];
}

+ (NSString *)fixHTMLAttributes:(NSString *)string
{
    return [[NSAttributedString alloc] initWithData:[_issue.issueDescription dataUsingEncoding:NSUTF8StringEncoding]
                                                                            options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType, NSCharacterEncodingDocumentAttribute: [NSNumber numberWithInt:NSUTF8StringEncoding]}
                                                                documentAttributes:nil
                                                                             error:nil].string;
}

+ (NSString *)diskUsage
{
    NSUInteger diskUsage = [NSURLCache sharedURLCache].currentDiskUsage;
    // Less than 0.5 MB/ 500 Kb
    if (diskUsage < 500000) {
        return @"Less than 0.5 MB";
    }
    return [NSString stringWithFormat:@"%0.2f MB", diskUsage/1000000.0];
}

+ (NSString *)appVersion
{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    return [infoDictionary objectForKey:@"CFBundleShortVersionString"];
}

+ (NSString *)appBuildNumber
{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
   return [infoDictionary objectForKey:@"CFBundleVersion"];
}

+ (NSString *)feedbackEmailTemplate
{
    struct utsname systemInfo;
    uname(&systemInfo);
    return [NSString stringWithFormat:@"<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><hr><center>Developer Support Information</center><br><BLOCKQUOTE><li>Device: %@<br><li>iOS: %@<br><li>Version: %@ (%@)</BLOCKQUOTE><br><br>", [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding], [[UIDevice currentDevice] systemVersion], [NSString appVersion], [NSString appBuildNumber]];
}

@end

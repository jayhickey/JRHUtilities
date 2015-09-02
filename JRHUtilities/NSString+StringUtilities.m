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

+ (NSString *)randomStringWithLength:(int)len
{
    
    NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    NSMutableString *randomString = [NSMutableString stringWithCapacity: len];
    
    for (int i=0; i<len; i++) {
        [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random_uniform((uint32_t)[letters length])]];
    }
    
    return randomString;
}

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
    return [[[NSMutableAttributedString alloc] initWithData:[string dataUsingEncoding:NSUTF8StringEncoding]
                                                    options:@{NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType, NSCharacterEncodingDocumentAttribute: [NSNumber numberWithInt:NSUTF8StringEncoding]}
                                         documentAttributes:nil
                                                      error:nil] string];
}

+ (NSString *)HTMLEncodeString:(NSString *)string
{
    return [[[[[string stringByReplacingOccurrencesOfString: @"&" withString: @"&amp;"]
               stringByReplacingOccurrencesOfString: @"\"" withString: @"&quot;"]
              stringByReplacingOccurrencesOfString: @"'" withString: @"&#39;"]
             stringByReplacingOccurrencesOfString: @">" withString: @"&gt;"]
            stringByReplacingOccurrencesOfString: @"<" withString: @"&lt;"];
}

+ (NSString *)convertToMACAddress:(NSString *)string
{
    if ((string.length != 12) || [string containsString:@":"]) return string;
    
    NSMutableString *mutableAddress = [[NSMutableString alloc] initWithString:string];
    int interval = 2;
    for(int i = 0; i < 5 ; i++){
        [mutableAddress insertString:@":" atIndex:(i == 0 ? interval : interval * (i + 1) + i )];
    }
    return [NSString stringWithString:mutableAddress];
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

#ifndef WATCH

+ (NSString *)feedbackEmailTemplate
{
    struct utsname systemInfo;
    uname(&systemInfo);
    return [NSString stringWithFormat:@"<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><hr><center>Developer Support Information</center><br><BLOCKQUOTE><li>Device: %@<br><li>iOS: %@<br><li>Version: %@ (%@)</BLOCKQUOTE><br><br>", [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding], [[UIDevice currentDevice] systemVersion], [NSString appVersion], [NSString appBuildNumber]];
}

#endif

@end

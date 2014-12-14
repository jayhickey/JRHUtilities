//
//  NSString+URLQuery.h
//  Longboxed-iOS
//
//  Created by johnrhickey on 7/7/14.
//  Copyright (c) 2014 Longboxed. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (URLQuery)

// URL Encode a string for sending as a parameter in a URL string
// Example: http://www.longboxed.com/api/v1/issues/?date=2014-06-25
+ (NSString*)addQueryStringToUrlString:(NSString *)urlString withDictionary:(NSDictionary *)dictionary;

@end

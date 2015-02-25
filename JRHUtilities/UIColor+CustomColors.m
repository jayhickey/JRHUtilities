//
//  UIColor+CustomColors.m
//  JRHUtilities
//
//  Created by johnrhickey on 2/24/15.
//  Copyright (c) 2015 Jay Hickey. All rights reserved.
//

#import "UIColor+CustomColors.h"

@implementation UIColor (CustomColors)

+ (UIColor *)colorWithHex:(NSString *)hexString
{
    int red, green, blue;
    sscanf([hexString UTF8String], "#%2X%2X%2X", &red, &green, &blue);
    return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:1];
}

@end

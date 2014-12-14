//
//  UIFontDescriptor+AvenirNext.h
//  Longboxed-iOS
//
//  Created by johnrhickey on 8/6/14.
//  Copyright (c) 2014 Longboxed. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFontDescriptor (AvenirNext)

+(UIFontDescriptor *)preferredAvenirNextFontDescriptorWithTextStyle:(NSString *)style;
+(UIFontDescriptor *)preferredAvenirNextDemiBoldFontDescriptorWithTextStyle:(NSString *)style;
+(UIFontDescriptor *)preferredAvenirNextBoldFontDescriptorWithTextStyle:(NSString *)style;
+(UIFontDescriptor *)preferredAvenirNextCondensedMediumFontDescriptorWithTextStyle:(NSString *)style;
+(UIFontDescriptor *)preferredAvenirNextCondensedUltraLightFontDescriptorWithTextStyle:(NSString *)style;
+(UIFontDescriptor *)preferredAvenirNextMediumFontDescriptorWithTextStyle:(NSString *)style;

@end

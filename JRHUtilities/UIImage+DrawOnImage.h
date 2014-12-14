//
//  UIImage+DrawInitialsOnImage.h
//
//
//  Created by johnrhickey on 4/23/14.
//
//

#import <UIKit/UIKit.h>

@interface UIImage (DrawOnImage)

+ (UIImage *)imageByDrawingInitialsOnImage:(UIImage *)image withInitials:(NSString *)initials font:(UIFont *)font;

@end

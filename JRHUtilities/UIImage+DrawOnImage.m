//
//  UIImage+DrawInitialsOnImage.m
//
//
//  Created by johnrhickey on 4/23/14.
//
//

#import "UIImage+DrawOnImage.h"

@implementation UIImage (DrawOnImage)

+ (UIImage *)imageByDrawingInitialsOnImage:(UIImage *)image withInitials:(NSString *)initials font:(UIFont *)font
{
    // begin a graphics context of sufficient size
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    
    // draw original image into the context
    [image drawAtPoint:CGPointZero];
    
    // get the context for CoreGraphics
    UIGraphicsGetCurrentContext();
    
    // Remove any leading or trailing whitespace, then put each word in an array
    // From http://nshipster.com/nscharacterset/
    initials = [initials stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSArray *separatedNames = [initials componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    separatedNames = [separatedNames filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"self <> ''"]];
    
    if ([separatedNames count] > 0) {
        NSMutableString *combinedInitials = [[NSMutableString alloc] initWithString:[separatedNames[0] substringToIndex:1]];
        if ([separatedNames count] > 1) {
            [combinedInitials appendString:[separatedNames[1] substringToIndex:1]];
        }
        
        NSMutableParagraphStyle *textStyle = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
        textStyle.lineBreakMode = NSLineBreakByWordWrapping;
        textStyle.alignment = NSTextAlignmentCenter;
        UIFont *textFont = font;
        
        NSDictionary *attributes = @{NSFontAttributeName: textFont};
        
        // Create the CGRect to the size of the text box
        CGSize size = [combinedInitials sizeWithAttributes:attributes];
        if (size.width < image.size.width)
        {
            CGRect textRect = CGRectMake(0, (image.size.height - size.height)/2, image.size.width, image.size.height);
            
            [combinedInitials drawInRect:textRect withAttributes:@{NSFontAttributeName:textFont, NSParagraphStyleAttributeName:textStyle, NSForegroundColorAttributeName:[UIColor blackColor]}];
        }
    }
    // make image out of bitmap context
    UIImage *retImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // free the context
    UIGraphicsEndImageContext();
    
    return retImage;
}

@end

//
//  NSArray+ArrayUtilities.m
//  JRHUtilities
//
//  Created by johnrhickey on 10/14/15.
//  Copyright © 2015 Jay Hickey. All rights reserved.
//

#import "NSArray+ArrayUtilities.h"

@implementation NSArray (ArrayUtilities)

- (id)safeObjectAtIndex:(NSUInteger)index {
    @synchronized(self) {
        if(index >= [self count]) return nil;
        return [self objectAtIndex:index];
    }
}

@end

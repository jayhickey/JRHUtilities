//
//  NSMutableArray+Randomize.m
//  Longboxed-iOS
//
//  Created by johnrhickey on 11/3/14.
//  Copyright (c) 2014 Longboxed. All rights reserved.
//

#import "NSMutableArray+Randomize.h"

@implementation NSMutableArray (Randomize)

- (void)shuffle
{
    NSUInteger count = [self count];
    for (NSUInteger i = 0; i < count; ++i) {
        NSInteger remainingCount = count - i;
        NSInteger exchangeIndex = i + arc4random_uniform((u_int32_t)remainingCount);
        [self exchangeObjectAtIndex:i withObjectAtIndex:exchangeIndex];
    }
}

@end

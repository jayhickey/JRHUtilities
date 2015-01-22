//
//  NSDictionary+DictionaryUtilities.m
//  Pods
//
//  Created by johnrhickey on 1/21/15.
//
//

#import "NSDictionary+DictionaryUtilities.h"

@implementation NSDictionary (DictionaryUtilities)


+ (id)dictionaryWithKeysAndObjects:(id)firstKey, ...
{
    va_list args;
    va_start(args, firstKey);
    NSMutableArray *keys = [NSMutableArray array];
    NSMutableArray *values = [NSMutableArray array];
    for (id key = firstKey; key != nil; key = va_arg(args, id)) {
        id value = va_arg(args, id);
        [keys addObject:key];
        [values addObject:value];
    }
    va_end(args);
    
    return [self dictionaryWithObjects:values forKeys:keys];
}

@end

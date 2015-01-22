//
//  NSDictionary+DictionaryUtilities.h
//  Pods
//
//  Created by johnrhickey on 1/21/15.
//
//

#import <Foundation/Foundation.h>

@interface NSDictionary (DictionaryUtilities)

/**
 Creates and initializes a dictionary with key value pairs, with the keys specified
 first instead of the objects.
 */
+ (id)dictionaryWithKeysAndObjects:(id)firstKey, ... NS_REQUIRES_NIL_TERMINATION;

@end

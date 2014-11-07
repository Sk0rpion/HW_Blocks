//
//  NSArray+FunctionalExtension.m
//  HW_Blocks
//
//  Created by Alexander on 05.04.14.
//  Copyright (c) 2014 Alexander. All rights reserved.
//

#import "NSArray+FunctionalExtension.h"

@implementation NSArray (FunctionalExtension)

- (NSArray*)ex_map:(id(^)(id obj))mapBlock
{
    NSMutableArray *array = [NSMutableArray new];
    for(int i = 0; i < [self count]; i++){
        [array addObject:mapBlock([self objectAtIndex:i])];
    }
    return array;
}

- (NSArray*)ex_filter:(BOOL(^)(id obj))filterBlock
{
    NSMutableArray *array = [NSMutableArray new];
    for(int i = 0; i < [self count]; i++){
        if(filterBlock([self objectAtIndex:i])){
            [array addObject:[self objectAtIndex:i]];
        }
    }
    return array;
}

- (id)ex_sum:(id)initialValue withBlock:(id(^)(id sum, id obj))sumBlock
{
    id sum = initialValue;
    for(int i = 0; i < [self count]; i++){
        sum = sumBlock(sum, [self objectAtIndex:i]);
    }
    return sum;
}

@end

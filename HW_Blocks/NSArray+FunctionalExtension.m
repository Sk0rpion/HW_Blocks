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
    
    NSArray *newArray = [NSArray new];
    NSMutableArray *advanceArray = [NSMutableArray new];
    
    
    for (id obj in self) {
        [advanceArray addObject:mapBlock(obj)];
    }
    newArray = [advanceArray copy];
    return newArray;
}

- (NSArray*)ex_filter:(BOOL(^)(id obj))filterBlock
{
    NSArray *newArray = [NSArray new];
    NSMutableArray *advanceArray = [NSMutableArray new];
    
    
    for (id obj in self) {
        if (filterBlock(obj) == YES)
            [advanceArray addObject:obj];
        }
    newArray = [advanceArray copy];
    return newArray;
}

- (id)ex_sum:(id)initialValue withBlock:(id(^)(id sum, id obj))sumBlock
{
    id result = initialValue;
    NSLog(@"%@", result);
    for (id obj in self) {
        result = sumBlock(result, obj);
        NSLog(@"%@", result);
    }
    
    return result;
}

@end

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
    NSMutableArray *secArr = [NSMutableArray new];
    
    for (id obj in self) {
        [secArr addObject:mapBlock(obj)];
    }
    newArray = [secArray copy];
    
    return newArray;
}

- (NSArray*)ex_filter:(BOOL(^)(id obj))filterBlock
{
    NSArray *newArray = [NSArray new];
    NSMutableArray *secArray = [NSMutableArray new];
    
    for (id obj in self) {
        if (filterBlock(obj) == YES)
        {
            [secArray addObject:obj];
        }
    }
    newArray = [secArray copy];
    return newArray;
}

- (id)ex_sum:(id)initialValue withBlock:(id(^)(id sum, id obj))sumBlock
{
    id result = initialValue;
    
    for (id obj in self) {
        result = sumBlock(result, obj);
    }
    
    return result;
}

@end

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
    NSMutableArray *arr = [[NSMutableArray alloc] init];
	for (id object in self)
    {
        [arr addObject:mapBlock(object)];
    }
    return arr;
}

- (NSArray*)ex_filter:(BOOL(^)(id obj))filterBlock
{
    NSMutableArray *filtArr = [[NSMutableArray alloc] init];
    for (id object in self)
    {
        if (filterBlock(object))
        {
            [filtArr addObject:(object)];
        }
    }
    return filtArr;
}

- (id)ex_sum:(id)initialValue withBlock:(id(^)(id sum, id obj))sumBlock
{
    id sum = initialValue;
    for (id object in self)
    {
        sum = sumBlock(sum, object);
    }
    return sum;
}

@end

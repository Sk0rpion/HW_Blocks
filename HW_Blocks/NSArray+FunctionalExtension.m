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
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (id obj in self)
        [array addObject:mapBlock(obj)];
    return array;
}

- (NSArray*)ex_filter:(BOOL(^)(id obj))filterBlock
{
    NSMutableArray *mutableArray = [NSMutableArray new];
    for (id i in self)
        if (filterBlock(i))
            [mutableArray addObject:i];
    return mutableArray;
}

- (id)ex_sum:(id)initialValue withBlock:(id(^)(id sum, id obj))sumBlock
{
    id summary = initialValue;
    for (id object in self)
        summary = sumBlock(summary, object);
    return summary;
}

@end

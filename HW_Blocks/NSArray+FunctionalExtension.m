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
    NSMutableArray *arr = [NSMutableArray new];
        for (id i in self) 
        {
            [arr addObject:mapBlock(i)];
        }
    return arr;
}

- (NSArray*)ex_filter:(BOOL(^)(id obj))filterBlock
{
    NSMutableArray *arr = [NSMutableArray new];
        for (id i in self) {
            if (filterBlock(i))
            {
                [arr addObject:i];
            }
        }
    return arr;
}

- (id)ex_sum:(id)initialValue withBlock:(id(^)(id sum, id obj))sumBlock
{
    id sumObj = initialValue;
        for (id i in self) 
        {
            sumObj = sumBlock(sumObj, i);
        }
    return sumObj;
}

@end

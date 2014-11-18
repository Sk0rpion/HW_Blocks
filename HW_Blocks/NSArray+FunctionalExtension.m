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
    for (NSObject *el in self) {
        [arr addObject:mapBlock(el)];
    }
    NSArray *arr2 = [arr copy];
    return arr2;
}

- (NSArray*)ex_filter:(BOOL(^)(id obj))filterBlock
{
    NSMutableArray *arr = [NSMutableArray new];
    for (NSObject *el in self) {
        if (filterBlock(el)) [arr addObject:el];
    }
    return arr;
}

- (id)ex_sum:(id)initialValue withBlock:(id(^)(id sum, id obj))sumBlock
{
    id result = initialValue;
    for (id el in self) {
        result = sumBlock(result,el);
    }
    return result;
}

@end
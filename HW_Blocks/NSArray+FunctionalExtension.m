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
    for (NSObject *obj in self) {
         [arr addObject: mapBlock(obj)];
    }
    NSArray *ans = [arr copy];
    return ans;
}

- (NSArray*)ex_filter:(BOOL(^)(id obj))filterBlock
{
    NSMutableArray *arr = [NSMutableArray new];
    for (NSObject *obj in self) {
        if (filterBlock(obj)) [arr addObject:obj];
    }
    return arr;
}

- (id)ex_sum:(id)initialValue withBlock:(id(^)(id sum, id obj))sumBlock
{
    id result = initialValue;
    for (id obj in self) {
        result = sumBlock(result,obj);
    }
    return result;
}

@end

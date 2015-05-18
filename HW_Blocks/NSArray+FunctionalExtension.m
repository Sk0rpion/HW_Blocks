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
    NSMutableArray *map_arr = [[NSMutableArray alloc] init];
    for (NSObject *i in self) {
        [map_arr addObject:mapBlock(i)];
    }
    return map_arr;
}

- (NSArray*)ex_filter:(BOOL(^)(id obj))filterBlock
{
    NSMutableArray *filt_arr = [[NSMutableArray alloc]init];
    for (NSObject *i in self) {
        if (filterBlock(i) == YES) {
            [filt_arr addObject:i];
        }
    }
    return filt_arr;
}

- (id)ex_sum:(id)initialValue withBlock:(id(^)(id sum, id obj))sumBlock
{
    id result = initialValue;
    for (NSObject *i in self) {
        result = sumBlock(result, i);
    }
    return result;
}

@end

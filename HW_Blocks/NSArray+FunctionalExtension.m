//
//  NSArray+FunctionalExtension.m
//  HW_Blocks
//
//  Created by Alexander on 05.04.14.
//  Copyright (c) 2014 Alexander. All rights reserved.
//

#import "NSArray+FunctionalExtension.h"

@implementation NSArray (FunctionalExtension)

- (NSArray*)ex_map:(id(^)(id obj))mapBlock {
    NSMutableArray *newArray = [NSMutableArray arrayWithCapacity:self.count];
    for (id obj in self) {
        if (mapBlock) {
            [newArray addObject:mapBlock(obj)];
        } else {
            [newArray addObject:[NSNull null]];
        }
    }
    return [NSArray arrayWithArray:newArray];
}

- (NSArray*)ex_filter:(BOOL(^)(id obj))filterBlock {
    NSMutableArray *newArray = [NSMutableArray arrayWithCapacity:self.count];
    for (id obj in self) {
        if (filterBlock && filterBlock(obj)) {
            [newArray addObject:obj];
        }
    }
    return [NSArray arrayWithArray:newArray];
}

- (id)ex_sum:(id)initialValue withBlock:(id(^)(id sum, id obj))sumBlock {
    id sum = initialValue;
    for (id obj in self) {
        if (sumBlock) {
            sum = sumBlock(sum, obj);
        }
    }
    return sum;
}

@end

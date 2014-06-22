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
    for(id i in self){
        [arr addObject:mapBlock(i)];
    }
    return arr;
}

- (NSArray*)ex_filter:(BOOL(^)(id obj))filterBlock
{
    NSMutableArray *arr = [NSMutableArray new];
    for(id i in self){
        if(filterBlock(i)){
            [arr addObject:i];
        }
    }
    return arr;
}

- (id)ex_sum:(id)initialValue withBlock:(id(^)(id sum, id obj))sumBlock
{
    id sum = initialValue;
    for(id obj in self){
        sum = sumBlock(sum, obj);
    }
    return sum;
}

@end

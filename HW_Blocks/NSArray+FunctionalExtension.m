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
    NSArray *array=[NSArray new];
    NSMutableArray *secondArray=[NSMutableArray new];
    for(id obj in self){
        [secondArray addObject:mapBlock(obj)];
    }
    array=[secondArray copy];
    return array;
}

- (NSArray*)ex_filter:(BOOL(^)(id obj))filterBlock
{
    NSArray *array=[NSArray new];
    NSMutableArray *secondArray=[NSMutableArray new];
    for(id obj in self){
        if(filterBlock(obj)){
        [secondArray addObject:obj];
        }
    }
    array=[secondArray copy];
    return array;
}

- (id)ex_sum:(id)initialValue withBlock:(id(^)(id sum, id obj))sumBlock
{
    id sum = initialValue;
    for(id obj in self){
        sum=sumBlock(sum,obj);
    }
    return sum;
}

@end

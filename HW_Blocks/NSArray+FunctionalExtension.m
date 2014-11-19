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
    NSMutableArray *mapArray = [NSMutableArray new];
    [self enumerateObjectsUsingBlock:^(id arrObj, NSUInteger idx, BOOL *stop) {
        
        arrObj = mapBlock(arrObj);
        [mapArray addObject:arrObj];
        
    }];
    return mapArray;
}

- (NSArray*)ex_filter:(BOOL(^)(id obj))filterBlock
{
    NSMutableArray *filterArr = [NSMutableArray new];
    [self enumerateObjectsUsingBlock:^(id arrObj, NSUInteger idx, BOOL *stop) {
        
        if(filterBlock(arrObj)){
            
            [filterArr addObject:arrObj];
        }
    }];
    return filterArr;
}

- (id)ex_sum:(id)initialValue withBlock:(id(^)(id sum, id obj))sumBlock
{
    __block id sumResult = initialValue;
    [self enumerateObjectsUsingBlock:^(id arrObj, NSUInteger idx, BOOL *stop) {
        
        sumResult = sumBlock(sumResult,arrObj);
    }];
    return sumResult;
}

@end

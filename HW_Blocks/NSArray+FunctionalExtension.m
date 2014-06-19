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
    NSMutableArray *resultMap = [[NSMutableArray alloc]init];
    
    for (id objId in self){
        [resultMap addObject:mapBlock(objId)];
        
    }
    return resultMap;
}

- (NSArray*)ex_filter:(BOOL(^)(id obj))filterBlock
{
    NSMutableArray *resultFilter =[[NSMutableArray alloc]init ];
    for (id filterId in self){
        if (filterBlock(filterId) == YES){
            [resultFilter addObject:filterId];
        }
    }
    return resultFilter;
}

- (id)ex_sum:(id)initialValue withBlock:(id(^)(id sum, id obj))sumBlock
{
    id resultSum = initialValue;
    for (id sumID in self){
        resultSum = sumBlock(resultSum,sumID);
    }
    return resultSum;
}

@end

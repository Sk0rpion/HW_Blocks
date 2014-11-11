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
    NSMutableArray *massive = [NSMutableArray new];
    
        for(id obj in self){
            [massive addObject:mapBlock(obj)];
        }

    return massive;
}

- (NSArray*)ex_filter:(BOOL(^)(id obj))filterBlock
{
    NSMutableArray *massive = [NSMutableArray new];
    for (id obj in self){
        if(filterBlock(obj) == YES){
            [massive addObject:mapBlock(obj)];
        }
    }
    return massive;
    
}

- (id)ex_sum:(id)initialValue withBlock:(id(^)(id sum, id obj))sumBlock
{
    id summa = initialValue;
    for (id obj in self){
        summa = sumBlock(sum, obj);
    }
    return summa;
    
}

@end

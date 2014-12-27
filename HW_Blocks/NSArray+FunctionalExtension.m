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
    NSMutableArray *array = [[NSMutableArray alloc]init];
    for( id obj in self){
        [array addObject:mapBlock(obj)];
    }
    
    return array;
}

- (NSArray*)ex_filter:(BOOL(^)(id obj))filterBlock
{
    NSMutableArray *filt = [[NSMutableArray alloc ]init];
    for( id obj in self){
        if (filterBlock(obj)) {
            [filt addObject:obj];
        }
        
    }
    return filt;
}

- (id)ex_sum:(id)initialValue withBlock:(id(^)(id sum, id obj))sumBlock
{
    id temp = initialValue;
    for (id obj in self) {
        temp = sumBlock(temp, obj);
        
    }
    return temp;
}

@end

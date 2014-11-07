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
    NSMutableArray *arr = [[NSMutableArray alloc]init];
    for (int i=0; i<self.count; i++) {
        [arr addObject:mapBlock([self objectAtIndex:i])];
        
    }
    return arr;
}

- (NSArray*)ex_filter:(BOOL(^)(id obj))filterBlock
{
    NSMutableArray *arr = [NSMutableArray new];
    for (int i=0; i<self.count; i++) {
        if(filterBlock([self objectAtIndex:i])){
            [arr addObject:[self objectAtIndex:i]];
        }
        
    }
    return arr;
}

- (id)ex_sum:(id)initialValue withBlock:(id(^)(id sum, id obj))sumBlock
{
    id result = initialValue;
    for (int i=0; i<self.count; i++) {
        result=sumBlock(result,[self objectAtIndex:i]);
    }
    return result;
}

@end

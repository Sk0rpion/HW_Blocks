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
    NSMutableArray *mas = [NSMutableArray new];
    
    for(id obj in self)
    {
        [mas addObject:mapBlock(obj)];
    }
    return mas;
}

- (NSArray*)ex_filter:(BOOL(^)(id obj))filterBlock
{
    NSMutableArray *mas = [NSMutableArray new];
    
    for(id obj in self)
    {
        if(filterBlock(obj))
        {
            [mas addObject:obj];
        }
    }
    return mas;
}

- (id)ex_sum:(id)initialValue withBlock:(id(^)(id sum, id obj))sumBlock
{
    id qw = initialValue;
    
    for(id obj in self)
    {
        qw=sumBlock( qw, obj);
    }
    return qw;
}

@end

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
//    return nil;
    NSMutableArray *result = [[NSMutableArray alloc]init];
    
    for (int i = 0; i < self.count; i++){
        [result addObject:mapBlock([self objectAtIndex:i])];
    }
    
    return result;
}

- (NSArray*)ex_filter:(BOOL(^)(id obj))filterBlock
{
//    return nil;
    NSMutableArray *result = [NSMutableArray new];
    
    for (int i = 0; i < self.count; i++){
        if (filterBlock([self objectAtIndex:i])){
            [result addObject:[self objectAtIndex:i]];
        }
    }
    
    return result;
}

- (id)ex_sum:(id)initialValue withBlock:(id(^)(id sum, id obj))sumBlock
{
//    return nil;
    id result = initialValue;
    
    for(int i = 0; i < self.count; i++){
        result = sumBlock(result, [self objectAtIndex:i]);
    }
    
    return result;
    
}

@end

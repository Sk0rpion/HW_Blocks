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
    NSMutableArray *arr = [NSMutableArray new];
    for (int i = 0; i < self.count; i++) {
        [arr addObject:mapBlock([self objectAtIndex:i])];
    }
    return arr;
}

- (NSArray*)ex_filter:(BOOL(^)(id obj))filterBlock
{
    NSMutableArray *arr = [NSMutableArray new];
    for (int i = 0; i < self.count; i++) {
        if (filterBlock([self objectAtIndex:i])){
            [arr addObject:[self objectAtIndex:i]];
        }
    }
    return arr;
}

/**
 Возвращает обьект, который получился суммированием всех элементов по порядку.
 Внутрь передается функция суммирования.
 
 Например:
 NSArray *arr = @[@"Str1", @"Str2", @"Str3"];
 NSString *result = [arr ex_sum:@"Result: " withBlock:^id(NSString *sum, NSString *obj){
 return [sum stringByAppendingString:obj];
 }];
 
 result == @"Result: Str1Str2Str3" == sumBlock( sumBlock( sumBlock(init, obj1), obj2), obj3)
 
 Пример 2:
 NSNumber *result = [@[@1, @2, @3] ex_sum:@0 withBlock:^id(NSNumber *sum, NSNumber *val){
 return [NSNumber numberWithInteger:(sum.integerValue + val.integerValue)];
 }];
 result == @6
 */
- (id)ex_sum:(id)initialValue withBlock:(id(^)(id sum, id obj))sumBlock
{
    id result = initialValue;
    for (int i = 0; i < self.count; i++) {
        result = sumBlock(result, [self objectAtIndex:i]);
    }
    return result;
}

@end

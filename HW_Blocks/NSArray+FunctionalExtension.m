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
    if (mapBlock) {
        NSMutableArray *array = [[NSMutableArray alloc] init];
        for (id objectToOperateWith in self) {
            [array addObject:(mapBlock(objectToOperateWith))];
        }
        return [NSArray arrayWithArray:array];
    }
    return nil;
}

- (NSArray*)ex_filter:(BOOL(^)(id obj))filterBlock
{
    if(filterBlock) {
        NSMutableArray *array = [[NSMutableArray alloc] init];
        for (id objectToOperateWIth in self) {
            if(filterBlock(objectToOperateWIth)) {
                [array addObject:objectToOperateWIth];
            }
        }
        return [NSArray arrayWithArray:array];
    }
    return nil;
}

- (id)ex_sum:(id)initialValue withBlock:(id(^)(id sum, id obj))sumBlock
{
    if (sumBlock) {
        id summary = initialValue;
        for (id objectToOperateWith in self) {
            summary = sumBlock(summary, objectToOperateWith);
            NSLog(@"%@", [objectToOperateWith description]);
        }
        return summary;
    }
    return initialValue;
}

@end

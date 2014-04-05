//
//  ViewController.m
//  HW_Blocks
//
//  Created by Alexander on 05.04.14.
//  Copyright (c) 2014 Alexander. All rights reserved.
//

#import "ViewController.h"
#import "NSArray+FunctionalExtension.h"

@interface ViewController ()
{}
@property (nonatomic, weak) IBOutlet UILabel *checkMapLabel;
@property (nonatomic, weak) IBOutlet UILabel *checkFilterLabel;
@property (nonatomic, weak) IBOutlet UILabel *checkSumLabel;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self updateLabel:self.checkMapLabel successTest:[self checkMap]];
    [self updateLabel:self.checkFilterLabel successTest:[self checkFilter]];
    [self updateLabel:self.checkSumLabel successTest:[self checkSum]];
}

- (void)updateLabel:(UILabel*)lab successTest:(BOOL)success
{
    lab.text = success? @"✔" : @"✘";
    lab.textColor = success? [UIColor colorWithRed:0.400 green:0.793 blue:0.233 alpha:1.000] : [UIColor colorWithRed:0.766 green:0.113 blue:0.122 alpha:1.000];
}

- (BOOL)checkMap
{
    NSArray *arr, *resultArr, *expectArr;
    
    arr = @[@1, @2, @3];
    expectArr = @[@"2 val", @"4 val", @"6 val"];
    resultArr = [arr ex_map:^id(NSNumber *obj) {
        NSInteger val = obj.integerValue * 2;
        return [NSString stringWithFormat:@"%d val", val];
    }];
    if(![expectArr isEqualToArray:resultArr])
        return NO;
    
    
    arr = @[@"Some strange string", @"Another string"];
    expectArr = @[@([arr[0] length]), @([arr[1] length])];
    resultArr = [arr ex_map:^id(NSString *obj) {
        return @(obj.length);
    }];
    if(![expectArr isEqualToArray:resultArr])
        return NO;
    
    return YES;
}

- (BOOL)checkFilter
{
    NSArray *arr, *resultArr, *expectArr;
    
    arr = @[@1, @2, @3, @4];
    expectArr = @[@2, @4];
    resultArr = [arr ex_filter:^BOOL(NSNumber *obj) {
        return (obj.integerValue % 2 == 0);
    }];
    if(![expectArr isEqualToArray:resultArr])
        return NO;
    
    
    arr = @[@2, @8, @29, @4, @7, @1, @9];
    expectArr = @[@2, @4, @7, @1];
    resultArr = [arr ex_filter:^BOOL(NSNumber *obj) {
        return obj.integerValue <= 7;
    }];
    if(![expectArr isEqualToArray:resultArr])
        return NO;
    
    return YES;
}

- (BOOL)checkSum
{
    NSArray *arr;
    NSNumber *resultVal, *expectVal;
    
    arr = @[@1, @2, @3, @4];
    expectVal = @5;
    resultVal = [arr ex_sum:@(-5) withBlock:^id(NSNumber *sum, NSNumber *obj) {
        return @(sum.integerValue + obj.integerValue);
    }];
    if(![expectVal isEqual:resultVal])
        return NO;
    
    
    return YES;
}

@end

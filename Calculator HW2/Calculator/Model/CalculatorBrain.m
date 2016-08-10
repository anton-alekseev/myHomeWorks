//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Anton Aleksieiev on 8/10/16.
//  Copyright © 2016 Seductive Mobile. All rights reserved.
//

#import "CalculatorBrain.h"


@implementation CalculatorBrain

- (NSMutableArray *)digits {
    if (!_digits) {
        _digits = [[NSMutableArray alloc] init];
    }
    
    return _digits;
}

- (void) addDidgit:(NSNumber *)digit{
    
    [self.digits addObject: digit];
    NSLog(@"%@", self.digits);
    
}
- (NSNumber *) execOperation:(NSString *)operation {
    
        if ([operation isEqualToString:@"+"]) {
            [self performOperationWithBlock:^float(float x, float y) {
                return x + y; }];
        } else if ([operation isEqualToString:@"-"]){
            [self performOperationWithBlock:^float(float x, float y) {
                return y - x; }];
        } else if ([operation isEqualToString:@"*"]){
            [self performOperationWithBlock:^float(float x, float y) {
                return x * y; }];
        } else if ([operation isEqualToString:@"/"]){
            [self performOperationWithBlock:^float(float x, float y) {
                return y / x; }];
        } else if ([operation isEqualToString:@"√"]) {
            [self performUnaryOperationWithBlock:^float(float x) {
                return sqrt(x); }];
        }
    return 0;
}

- (void) performOperationWithBlock:(float (^)(float, float))operation {
    float x, y;
    [self getX:&x y:&y];
    float result = operation(x, y);
    
    [self addDidgit:@(result)];
    
}

- (void) getX:(float *)x y:(float *)y {
    *x = [[self.digits lastObject] floatValue];
    [self.digits removeLastObject];
    
    *y = [[self.digits lastObject] floatValue];
    [self.digits removeLastObject];
}
- (void) performUnaryOperationWithBlock:(float (^)(float))operation {
    float x;
    [self getX:&x];
    float result = operation(x);
    
    [self addDidgit:@(result)];
}

- (void) getX:(float *)x {
    *x = [[self.digits lastObject] floatValue];
    [self.digits removeLastObject];
}

@end

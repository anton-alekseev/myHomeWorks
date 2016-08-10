//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Anton Aleksieiev on 8/10/16.
//  Copyright © 2016 Seductive Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

@property (strong, nonatomic) NSMutableArray<NSNumber *> *digits;

- (void) addDidgit:(NSNumber *)digit;
- (NSNumber *) execOperation:(NSString *)operation;

@end

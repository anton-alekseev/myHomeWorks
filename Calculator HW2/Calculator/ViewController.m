//
//  ViewController.m
//  Calculator
//
//  Created by Kirill Kirikov on 8/3/16.
//  Copyright © 2016 Seductive Mobile. All rights reserved.
//

#import "ViewController.h"
#import "CalculatorBrain.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *result;
@property (assign) BOOL didUserStartTyping;
@property (strong) CalculatorBrain *model;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.model = [[CalculatorBrain alloc] init];
    
    UIButton *sqrtButton = [[UIButton alloc] initWithFrame:CGRectMake(230, 180, 50, 50)];
    [sqrtButton setTitle:@"√" forState:UIControlStateNormal];
    [sqrtButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:sqrtButton];
    [sqrtButton addTarget:self action:@selector(touchOperator:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)touchDigit:(UIButton *)sender {
    
    if (!self.didUserStartTyping) {
        self.result.text = sender.currentTitle;
        self.didUserStartTyping = YES;
    } else {
        self.result.text = [self.result.text stringByAppendingString:sender.currentTitle];
    }
    
}

- (IBAction)touchOperator:(UIButton *)sender {
    NSString *operator = [sender currentTitle];
    [self.model execOperation:operator];
    
    NSNumberFormatter *decimalStyleFormatter = [[NSNumberFormatter alloc] init];
    [decimalStyleFormatter setMaximumFractionDigits:2];
    NSString *resultString = [decimalStyleFormatter stringFromNumber:self.model.digits.lastObject];
    self.result.text = resultString;
    
    self.didUserStartTyping = NO;
}

- (IBAction)touchReturn:(id)sender {
    
    if (self.didUserStartTyping) {
        
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        NSNumber *result = [formatter numberFromString:self.result.text];
        [self.model addDidgit: result];
        self.didUserStartTyping = NO;
    }
    
//    NSLog(@"Digits: %@", self.model.digits);
}


@end

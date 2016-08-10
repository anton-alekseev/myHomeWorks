//
//  ViewController.m
//  Calculator
//
//  Created by Kirill Kirikov on 8/3/16.
//  Copyright © 2016 Seductive Mobile. All rights reserved.
//

#import "ViewController.h"
#import "CalculatorBrain.h"
#import <objc/runtime.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *result;
@property (assign) BOOL didUserStartTyping;
@property (strong) CalculatorBrain *model;
@property (strong) NSString *operator;
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
- (void)putNumberFromTextIntoArray {      //Метод добавляет в массив число преобразованное из текста (из окна результата)
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    NSNumber *number = [formatter numberFromString:self.result.text];
    [self.model addDigit:[number floatValue]];
}

- (void)calculatingResultWithoutNillingOperator{  //Метод считает результат и добавляет его в массив, после чего обнуляет didUserStartTyping и operator
    
    float result = [self.model executeOperation:[self.operator operation]]; //Просчет результата
    self.result.text = [NSString stringWithFormat:@"%f", result];
    
    [self putNumberFromTextIntoArray]; //Добавление результата в массив
    
    self.didUserStartTyping = NO;
}

- (void)calculatingResult{  //Метод считает результат и добавляет его в массив, после чего обнуляет didUserStartTyping и operator
    
    [self calculatingResultWithoutNillingOperator];
    
    self.operator = nil;        //Обнуление оператора
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
    
    [self putNumberFromTextIntoArray];
    
    self.didUserStartTyping = NO;   //Обнуление didUserStartTyping

    if (self.operator == nil) {     //Определение предшествующей операции

        self.operator = [sender currentTitle];          //Сохранение оператора
        
        if ([sender.currentTitle isEqualToString:@"√"]) {       //Определение унарного оператора

            [self putNumberFromTextIntoArray];
            
            [self calculatingResult];
            
        }
    } else {
    
        if ([sender.currentTitle isEqualToString:@"√"]) {   //Определение оператора(унарный или бинарный)
            
            [self calculatingResult];
            
        } else {
            
            [self calculatingResultWithoutNillingOperator];
            
            self.operator = [sender currentTitle];
            
        }
    }
}

- (IBAction)touchReturn:(id)sender {

    [self putNumberFromTextIntoArray];     //Положить число в массив
    
    self.didUserStartTyping = NO;       //Обнуление didUserStartTyping

    [self calculatingResult];
    
}


@end

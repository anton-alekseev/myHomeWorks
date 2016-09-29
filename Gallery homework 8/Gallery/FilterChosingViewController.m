//
//  FilterChosingViewController.m
//  Gallery
//
//  Created by Anton Aleksieiev on 9/28/16.
//  Copyright © 2016 fynjy. All rights reserved.
//

#import "FilterChosingViewController.h"

@interface FilterChosingViewController ()

@end

@implementation FilterChosingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = YES;
    
//    self.view.backgroundColor = [UIColor blackColor];
    
}

-(void) viewWillAppear:(BOOL)animated{
    [self.view setAlpha:0.5];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  CellWithPriorityImageButtonTableViewCell.h
//  ToDoList
//
//  Created by Anton Aleksieiev on 8/17/16.
//  Copyright © 2016 Seductive Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CellWithPriorityImageButtonDelegate <NSObject>

-(void) priorityButtonPressed: (UITableViewCell *) sender;
-(void) titleChanged: (UITextField *) sender;

@end

@interface CellWithPriorityImageButtonTableViewCell : UITableViewCell

@property (strong, nonatomic) id<CellWithPriorityImageButtonDelegate> delegate;

#pragma mark - IBO Outlets

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UIButton *priorityButton;

#pragma mark - IBA Action
- (IBAction)didtouchImageButton:(UIButton *)sender;
- (IBAction)didTouchTitleTextField:(id)sender;


@end



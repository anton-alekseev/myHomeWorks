//
//  CellWithPriorityImageButtonTableViewCell.m
//  ToDoList
//
//  Created by Anton Aleksieiev on 8/17/16.
//  Copyright © 2016 Seductive Mobile. All rights reserved.
//

#import "CellWithPriorityImageButtonTableViewCell.h"

@interface CellWithPriorityImageButtonTableViewCell()



@end

#pragma mark - implementation
@implementation CellWithPriorityImageButtonTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)didtouchImageButton:(UIButton *)sender{
    if (_delegate != nil) {
        [_delegate priorityButtonPressed:self];
    }
}

- (IBAction)didTouchTitleTextField:(id)sender {
    if (_delegate != nil) {
        [_delegate titleChanged:sender];
    }
}


@end

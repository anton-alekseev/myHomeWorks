//
//  ToDoItem.m
//  ToDoList
//
//  Created by Kirill Kirikov on 8/10/16.
//  Copyright © 2016 Seductive Mobile. All rights reserved.
//

#import "ToDoItem.h"

@implementation ToDoItem

- (void) setUpPriority: (NSString *) priority {
    if ([priority isEqualToString:@"Low"]) {
         self.priority = PriorityLow;
    }else if([priority isEqualToString:@"Default"]){
        self.priority =  PriorityDefault;
    }else if([priority isEqualToString:@"High"]){
        self.priority =  PriorityHigh;
    }else if([priority isEqualToString:@"Urgent"]){
        self.priority =  PriorityUrgent;
    }else {
        self.priority =  PriorityNone;
    }
}


@end
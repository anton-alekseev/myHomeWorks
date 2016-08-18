//
//  ToDoItem.h
//  ToDoList
//
//  Created by Kirill Kirikov on 8/10/16.
//  Copyright © 2016 Seductive Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger{
    PriorityNone = 0,
    PriorityLow = 1,
    PriorityDefault = 2,
    PriorityHigh = 3,
    PriorityUrgent = 4,
}Priority;

@interface ToDoItem : NSObject
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *summary;
@property (assign) BOOL isDone;
@property (nonatomic, assign) Priority priority;

- (void) setUpPriority: (NSString *) priority;

@end

//
//  Event.h
//  Gallery
//
//  Created by Anton Aleksieiev on 8/21/16.
//  Copyright © 2016 fynjy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface Event : NSObject

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *eventDescription;
@property (strong, nonatomic) NSDate *openDate;
@property (strong, nonatomic) NSDate *closingDate;
@property (weak, nonatomic) Person *autor;

@end

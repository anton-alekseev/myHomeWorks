//
//  EventsModel.h
//  Gallery
//
//  Created by Anton Aleksieiev on 9/17/16.
//  Copyright © 2016 fynjy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Event.h"

@interface EventsModel : NSObject
+(EventsModel *) sharedModel;
- (NSArray<Event *> *) events;
@end

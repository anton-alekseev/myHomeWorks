//
//  EventsModel.h
//  Gallery
//
//  Created by Anton Aleksieiev on 9/17/16.
//  Copyright © 2016 fynjy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Event.h"

typedef enum : NSUInteger{
    FilterNearMe = 0,
    FilterMostPopular = 1,
    FilterOpening = 2,
    FilterLastChance = 3,
    FilterFollowing = 4,
}Filter;

@interface EventsModel : NSObject

+(EventsModel *) sharedModel;
- (NSArray<Event *> *) events;
- (void) loadDataWithFilter:(Filter)filter andCallback:(void (^)(void))callback;
@end

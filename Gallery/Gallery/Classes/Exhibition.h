//
//  Exhibition.h
//  Gallery
//
//  Created by Anton Aleksieiev on 8/21/16.
//  Copyright © 2016 fynjy. All rights reserved.
//

#import "Event.h"
#import "Masterpiece.h"


@interface Exhibition : Event

@property (strong, nonatomic) NSMutableArray<Masterpiece *> *masterpieces;


- (void) addMasterpiece:(Masterpiece *) masterpiece;
- (void) removeMasterpiece:(Masterpiece *) masterpiece;


@end

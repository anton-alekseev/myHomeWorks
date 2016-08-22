//
//  Gallery.h
//  Gallery
//
//  Created by Anton Aleksieiev on 8/21/16.
//  Copyright © 2016 fynjy. All rights reserved.
//

#import "Venue.h"
#import <CoreLocation/CoreLocation.h>
#import "Exhibition.h"

@interface Gallery : Venue

@property (strong, nonatomic) NSMutableArray<Exhibition *> *exhibitions;
@property (strong, nonatomic) CLLocation *location;

-(void) addExhibition:(Exhibition *) exhibition;
-(void) removeExhibition:(Exhibition *) exhibition;

@end

//
//  Gallery.h
//  Gallery
//
//  Created by Anton Aleksieiev on 8/21/16.
//  Copyright © 2016 fynjy. All rights reserved.
//

#import "Venue.h"
#import <CoreLocation/CoreLocation.h>

@interface Gallery : Venue


- (instancetype)initWithDictionaryFromAPI:(NSDictionary *)data;

@end

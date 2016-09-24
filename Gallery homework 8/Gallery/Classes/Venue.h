//
//  Venue.h
//  Gallery
//
//  Created by Anton Aleksieiev on 8/21/16.
//  Copyright © 2016 fynjy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import <CoreLocation/CoreLocation.h>

@interface Venue : NSObject

@property (strong, nonatomic) NSString *adress;
@property (strong, nonatomic) NSString *city;
@property (strong, nonatomic) NSString *creationTime;
@property (strong, nonatomic) NSString *email;
@property (strong, nonatomic) NSString *facebookPage;
@property (strong, nonatomic) NSString *venueDescription;
@property (strong, nonatomic) NSString *logo;
@property (strong, nonatomic) NSURL *logoURL;
@property (strong, nonatomic) NSString *latitude;
@property (strong, nonatomic) NSString *web;
@property (strong, nonatomic) NSString *longitude;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *idNumber;
@property (strong, nonatomic) NSString *phoneNumber;
@property (strong, nonatomic) NSArray<NSString *> *schedule;
@property (strong, nonatomic) NSString *updateTime;

@property (strong, nonatomic) CLLocation *location;
@property (assign, nonatomic) double distanceFromUserInMeters;

@property (weak, nonatomic) Person *contactPerson;

- (instancetype)initWithDictionary:(NSDictionary *)data;
- (instancetype)initWithDictionaryFromAPI:(NSDictionary *)data;


@end

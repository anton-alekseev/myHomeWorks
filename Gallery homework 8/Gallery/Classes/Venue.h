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

@property (strong, nonatomic) NSString *idNumber;
@property (strong, nonatomic) NSString *creationTime;
@property (strong, nonatomic) NSString *updateTime;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *venueDescription;
@property (strong, nonatomic) NSString *email;
@property (strong, nonatomic) NSString *facebookPage;
@property (strong, nonatomic) NSString *city;
@property (strong, nonatomic) NSArray<NSString *> *schedule;
@property (strong, nonatomic) NSString *adress;
@property (strong, nonatomic) NSString *logo;
@property (strong, nonatomic) NSURL *web;
@property (strong, nonatomic) NSString *phoneNumber;
@property (strong, nonatomic) CLLocation *latitude;
@property (strong, nonatomic) CLLocation *longtitude;
@property (weak, nonatomic) Person *contactPerson;




@end

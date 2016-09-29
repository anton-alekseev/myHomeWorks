//
//  Venue.m
//  Gallery
//
//  Created by Anton Aleksieiev on 8/21/16.
//  Copyright © 2016 fynjy. All rights reserved.
//

#import "Venue.h"

@implementation Venue

- (instancetype)initWithDictionaryFromAPI:(NSDictionary *)data{
    self = [super init];
    if (self) {
        self.adress = data[@"address"];
        self.city = data[@"city"];
        self.creationTime = data[@"createdAt"];
        self.email = data[@"email"];
        self.facebookPage = data[@"facebook"];
        self.web = data[@"link"];
        self.latitude = data[@"latitude"];
        self.longitude = data[@"longitude"];
        self.title = data[@"name"];
        self.idNumber = data[@"objectId"];
        self.phoneNumber = data[@"phone"];
        self.updateTime = data[@"_updated_at"];
        self.schedule = data[@"schedule"];
        double lat = [self.latitude doubleValue], lon = [self.longitude doubleValue];
        if (lat != 0.0 && lon != 0.0) {
            self.location = [[CLLocation alloc]initWithLatitude:lat longitude:lon];
            self.distanceFromUserInMeters = [[[CLLocation alloc] init] distanceFromLocation:self.location];
            self.distanceFromUserInMeters /= 1000.f;
            //temporary
            self.distanceFromUserInMeters -= 3000.f;
        } else {
            self.location = 0;
            self.distanceFromUserInMeters = -1;
        }
    }
    return self;
}


@end

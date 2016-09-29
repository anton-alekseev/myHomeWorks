//
//  Gallery.m
//  Gallery
//
//  Created by Anton Aleksieiev on 8/21/16.
//  Copyright © 2016 fynjy. All rights reserved.
//

#import "Gallery.h"

@implementation Gallery

- (instancetype)initWithDictionaryFromAPI:(NSDictionary *)data
{
    self = [super initWithDictionaryFromAPI:data];
    if (self) {
        self.venueDescription = data[@"galleryDescription"];
        self.logo = data[@"galleryLogo"][@"url"];
        self.logoURL = [NSURL URLWithString:self.logo];
    }
    return self;
}

@end

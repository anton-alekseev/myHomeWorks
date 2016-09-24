//
//  Exhibition.m
//  Gallery
//
//  Created by Anton Aleksieiev on 8/21/16.
//  Copyright © 2016 fynjy. All rights reserved.
//

#import "Exhibition.h"


@implementation Exhibition : Event

- (instancetype)initWithDictionary:(NSDictionary *)data
{
    self = [super initWithDictionary:data];
    if (self) {
        self.numberOfWorks = [data[@"works"] count];
    }
    return self;
}

- (instancetype)initWithDictionaryFromAPI:(NSDictionary *)data
{
    self = [super initWithDictionaryFromAPI:data];
    if (self) {
        self.numberOfWorks = [data[@"works"] count];
    }
    return self;
}

@end

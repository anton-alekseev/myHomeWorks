//
//  Event.m
//  Gallery
//
//  Created by Anton Aleksieiev on 8/21/16.
//  Copyright © 2016 fynjy. All rights reserved.
//

#import "Event.h"

@implementation Event

- (instancetype)initWithDictionaryFromAPI:(NSDictionary *)data{
    self = [super init];
    if (self) {
        self.eventDescription = data[@"about"];
        self.authorDescription = data[@"authorDescription"];
        self.authorName = data[@"authorName"];
        self.creationTime = data[@"createdAt"];
        NSMutableDictionary *date = data[@"dateEnd"];
        if (date[@"iso"]) {
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];
            formatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'";
            if (date[@"iso"] != [NSNull null]){
                NSString *string = date[@"iso"];
                NSDate *finalDate = [formatter dateFromString:string];
                self.closingDate = finalDate;
            }
        }
        date = data[@"dateStart"];
        if (date[@"iso"]) {
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];
            formatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss.SSS'Z'";
            if (date[@"iso"] != [NSNull null]){
                NSString *string = date[@"iso"];
                NSDate *finalDate = [formatter dateFromString:string];
                self.openDate = finalDate;
            }
        }
        self.likesCount = [data[@"likesCount"] intValue];
        self.url = data[@"links"];
        self.title = data[@"name"];
        self.idNumber = data[@"objectId"];
        self.updateTime = data[@"updatedAt"];
        
    }
    return self;
}

@end

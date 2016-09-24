//
//  Event.m
//  Gallery
//
//  Created by Anton Aleksieiev on 8/21/16.
//  Copyright © 2016 fynjy. All rights reserved.
//

#import "Event.h"

@implementation Event

- (instancetype)initWithDictionary: (NSDictionary *) data
{
    self = [super init];
    if (self) {
        self.idNumber = data[@"_id"];
        self.creationTime = data[@"_created_at"];
        self.updateTime = data[@"_updated_at"];
        self.authorName = data[@"authorName"];
        self.title = data[@"name"];
        self.authorDescription = data[@"authorDescription"];
        self.eventDescription = data[@"about"];
        self.likesCount = [data[@"likesCount"] intValue];
        if (data[@"dateStart"]) {
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            formatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
            if (data[@"dateStart"] != [NSNull null]){
                NSString *string = data[@"dateStart"];
                NSDate *date = [formatter dateFromString:string];
                self.openDate = date;
            }
        }
        if (data[@"dateEnd"]) {
                NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                formatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
                if (data[@"dateEnd"] != [NSNull null]){
                    NSString *string = data[@"dateEnd"];
                    NSDate *date = [formatter dateFromString:string];
                    self.closingDate = date;
                }
        }
    }
    return self;
}

- (instancetype)initWithDictionaryFromAPI:(NSDictionary *)data
{
    self = [super init];
    if (self) {
        self.eventDescription = data[@"about"];
        self.authorDescription = data[@"authorDescription"];
        self.authorName = data[@"authorName"];
        self.creationTime = data[@"createdAt"];
        NSDictionary *date = data[@"dateEnd"];
        if (date[@"iso"]) {
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            formatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
            if (date[@"iso"] != [NSNull null]){
                NSString *string = date[@"iso"];
                NSDate *finalDate = [formatter dateFromString:string];
                self.closingDate = finalDate;
            }
        }
        date = data[@"dateStart"];
        if (date[@"iso"]) {
            NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
            formatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
            if (date[@"dateStart"] != [NSNull null]){
                NSString *string = date[@"dateStart"];
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

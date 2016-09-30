//
//  Masterpiece.m
//  Gallery
//
//  Created by Anton Aleksieiev on 8/21/16.
//  Copyright © 2016 fynjy. All rights reserved.
//

#import "Masterpiece.h"

@implementation Masterpiece

- (instancetype)initWithDictionaryFromAPI:(NSDictionary *)data
{
    self = [super init];
    if (self) {
        self.authorName = data[@"author"];
        self.creationDate = data[@"createdAt"];
        self.photo = data[@"imgPicture"][@"url"];
        self.photoURL = [NSURL URLWithString:data[@"imgPicture"][@"url"]];
        self.idOfMasterpiece = data[@"objectId"];
        self.size = data[@"size"];
        self.title = data[@"title"];
        self.type = data[@"type"];
        self.updateDate = data[@"updatedAt"];
        self.year = data[@"year"];
    }
    return self;
}

@end

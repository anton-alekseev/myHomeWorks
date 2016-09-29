//
//  Event.h
//  Gallery
//
//  Created by Anton Aleksieiev on 8/21/16.
//  Copyright © 2016 fynjy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Event : NSObject

@property (strong, nonatomic) NSString *eventDescription;
@property (strong, nonatomic) NSString *authorDescription;
@property (strong, nonatomic) NSString *authorName;
@property (strong, nonatomic) NSString *creationTime;
@property (strong, nonatomic) NSDate *closingDate;
@property (strong, nonatomic) NSDate *openDate;
@property (assign, nonatomic) int likesCount;
@property (strong, nonatomic) NSString *url;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *idNumber;
@property (strong, nonatomic) NSString *updateTime;


- (instancetype)initWithDictionaryFromAPI:(NSDictionary *)data;


@end

//
//  EventsModel.m
//  Gallery
//
//  Created by Anton Aleksieiev on 9/17/16.
//  Copyright © 2016 fynjy. All rights reserved.
//

#import "EventsModel.h"
#import "API.h"

@interface EventsModel()
@property (nonatomic, strong) NSArray <Event *> *events;
@property (strong, nonatomic) API *apiLoader;
@end

@implementation EventsModel

+ (EventsModel *)sharedModel {
    static EventsModel *_sharedModel = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedModel = [[EventsModel alloc] init];
    });
    
    return _sharedModel;
}

- (id)init {
    if (self = [super init]) {
        self.apiLoader = [[API alloc]init];
    }
    return self;
}

- (void) loadDataWithFilter:(Filter)filter andCallback:(void (^)(void))callback {
    __weak typeof(self) weakself = self;
    NSString *task = [[NSString alloc]init];
    switch (filter) {
        case 0:
            task = @"/exhibitions";
            break;
        case 1:
            task = @"/exhibitions/popular";
            break;
        case 2:
            task = @"/exhibitions/opening";
            break;
        case 3:
            task = @"/exhibitions/lastchance";
            break;
        case 4:
            task = @"/exhibitions";
            break;
    }
    [self.apiLoader loadEventsWithTask:task andCallback:^(NSArray<Event *> * events, NSError *error){
            weakself.events = events;
            callback();
        }];
}

@end

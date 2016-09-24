//
//  EventsModel.m
//  Gallery
//
//  Created by Anton Aleksieiev on 9/17/16.
//  Copyright © 2016 fynjy. All rights reserved.
//

#import "EventsModel.h"
#import "DataLoader.h"

@interface EventsModel()
@property (nonatomic, strong) NSArray <Event *> *events;
@property (nonatomic, strong) id<DataLoaderProtocol> dataLoader;
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
//        self.dataLoader = [[LocalDataLoader alloc] init];
        self.dataLoader = [[APIDataLoader alloc]init];
        [self loadData];
    }
    NSLog(@"shared model has been initialized");
    return self;
}

- (void) loadData {
    __weak typeof(self) weakself = self;
    [self.dataLoader loadEventsWithCallback:^(NSArray<Event *> * events, NSError *error) {
        weakself.events = events;
        NSLog(@"Events: %@", events);

        NSLog(@"Error: %@", error);
        
    }];
}

@end

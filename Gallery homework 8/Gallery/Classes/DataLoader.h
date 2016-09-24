//
//  DataLoader.h
//  Gallery
//
//  Created by Anton Aleksieiev on 8/26/16.
//  Copyright © 2016 fynjy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Exhibition.h"

typedef void(^ResultBlock)(id result);
typedef void(^ErrorBlock)(NSError *error);

@protocol DataLoaderProtocol <NSObject>
@optional

- (void) loadEventsWithCallback: (void (^)(NSArray <Event *> *, NSError *error))callback;


@end

@interface LocalDataLoader : NSObject <DataLoaderProtocol>

- (void) loadEventsWithCallback: (void (^)(NSArray <Event *> *, NSError *error))callback;

@end

@interface APIDataLoader : NSObject <DataLoaderProtocol>

- (void) loadEventsWithCallback: (void (^)(NSArray <Event *> *, NSError *error))callback;
@end
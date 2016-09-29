//
//  API.h
//  Gallery
//
//  Created by Anton Aleksieiev on 9/24/16.
//  Copyright © 2016 fynjy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Exhibition.h"

@interface API : NSObject

- (void) loadEventsWithTask:(NSString*)task andCallback:(void (^)(NSArray <Event *> *, NSError *error))callback;

@end

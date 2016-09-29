//
//  APIManager.h
//  Gallery
//
//  Created by Anton Aleksieiev on 9/24/16.
//  Copyright © 2016 fynjy. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface APIManager : AFHTTPSessionManager

+ (APIManager *) sharedManager;

@end

//
//  APIManager.m
//  Gallery
//
//  Created by Anton Aleksieiev on 9/24/16.
//  Copyright © 2016 fynjy. All rights reserved.
//

#import "APIManager.h"
#import <AFNetworking/AFNetworkActivityIndicatorManager.h>

@implementation APIManager

+ (APIManager *) sharedManager{
    static dispatch_once_t pred;
    static APIManager *_sharedManager = nil;
    
    dispatch_once(&pred, ^{
        _sharedManager = [[self alloc] initWithBaseURL:[NSURL URLWithString:@"http://gallery-guru-prod.herokuapp.com"]];
    });
    return _sharedManager;
}

-(id) initWithBaseURL:(NSURL *)url{
    self = [super initWithBaseURL:url];
    if (self) {
        self.requestSerializer  =  [AFJSONRequestSerializer serializer];
        
        self.responseSerializer = [AFJSONResponseSerializer serializer];
        self.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
        
        [[AFNetworkActivityIndicatorManager sharedManager]setEnabled:YES];
    }
    return self;
}


@end

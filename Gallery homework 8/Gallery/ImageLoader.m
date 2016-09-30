//
//  ImageLoader.m
//  Gallery
//
//  Created by Anton Aleksieiev on 9/30/16.
//  Copyright © 2016 fynjy. All rights reserved.
//

#import "ImageLoader.h"

@implementation ImageLoader

+ (ImageLoader *) sharedloader{
    static dispatch_once_t pred;
    static ImageLoader *_sharedloader = nil;
    
    dispatch_once(&pred, ^{
        _sharedloader = [[self alloc] init];
    });
    return _sharedloader;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.imageCache = [[NSMutableDictionary alloc] init];
    }
    return self;
}

-(void) getImagewithUrl:(NSString *)url defaultImage:(NSString *)defaultImage withCallback:(void(^)(UIImage * image)) callback {
    if (self.imageCache[url]) {
        UIImage *image = self.imageCache[url];
        callback(image);
    } else{
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
        __weak typeof(self) weakSelf = self;
        
        NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * data, NSURLResponse * response, NSError * error) {
            if (error == nil) {
                UIImage *dataImage = [UIImage imageWithData:data];
                weakSelf.imageCache[url] = dataImage;
                callback(dataImage);
            } else {
                NSString *mainBudlePathe = [[NSBundle mainBundle] bundlePath];
                NSString *defaultImagePath = [mainBudlePathe stringByAppendingString:defaultImage];
                UIImage *image = [UIImage imageWithContentsOfFile:defaultImagePath];
                callback(image);
            }
        }];
        [task resume];
        
    }
}

@end

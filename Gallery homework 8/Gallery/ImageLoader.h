//
//  ImageLoader.h
//  Gallery
//
//  Created by Anton Aleksieiev on 9/30/16.
//  Copyright © 2016 fynjy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIImage.h>

@interface ImageLoader : NSObject

@property (strong, nonatomic) NSMutableDictionary* imageCache;
+ (ImageLoader *) sharedloader;

-(void) getImagewithUrl:(NSString *)url defaultImage:(NSString *)defaultImage withCallback:(void(^)(UIImage * image)) callback;

@end

//
//  GalleriesDataStorage.m
//  Gallery
//
//  Created by Anton Aleksieiev on 8/21/16.
//  Copyright © 2016 fynjy. All rights reserved.
//

#import "GalleriesDataStorage.h"

@implementation GalleriesDataStorage

- (NSMutableArray *)galleries {
    if (!_galleries) {
        _galleries = [[NSMutableArray alloc] init];
    }
    
    return _galleries;
}

-(void) addGallery:(Gallery *) gallery{
    [self.galleries addObject:gallery];
}
-(void) removeGallery:(Gallery *) gallery{
    [self.galleries removeObject:gallery];
}

@end

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
- (NSMutableArray *)exhibitions {
    if (!_exhibitions) {
        _exhibitions = [[NSMutableArray alloc] init];
    }
    return _exhibitions;
}
- (NSMutableArray *)masterpieces {
    if (!_masterpieces) {
        _masterpieces = [[NSMutableArray alloc] init];
    }
    return _masterpieces;
}

-(void) addGallery:(Gallery *) gallery{
    [self.galleries addObject:gallery];
}
-(void) removeGallery:(Gallery *) gallery{
    [self.galleries removeObject:gallery];
}
-(void) addExhibition:(Exhibition *) exhibition{
    [self.exhibitions addObject:exhibition];
}
-(void) removeExhibition:(Exhibition *) exhibition{
    [self.exhibitions removeObject:exhibition];
}
-(void) addMasterpiece:(Masterpiece *) masterpiece{
    [self.masterpieces addObject:masterpiece];
}
-(void) removeMasterpiece:(Masterpiece *) masterpiece{
    [self.masterpieces removeObject:masterpiece];
}

@end

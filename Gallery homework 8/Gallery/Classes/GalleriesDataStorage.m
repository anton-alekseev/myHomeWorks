//
//  GalleriesDataStorage.m
//  Gallery
//
//  Created by Anton Aleksieiev on 8/21/16.
//  Copyright © 2016 fynjy. All rights reserved.
//

#import "GalleriesDataStorage.h"

@implementation GalleriesDataStorage
- (instancetype)init
{
    self = [super init];
    if (self) {
        NSLog(@"storage has been initialized");
    }
    return self;
}

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
    if (self.exhibitions.count == 0) {
        [self.exhibitions addObject:exhibition];
    } else {
        for(NSInteger i = 0; i < [self.exhibitions count]; i++){
            if ([self.exhibitions objectAtIndex:i].gallery.distanceFromUserInMeters < exhibition.gallery.distanceFromUserInMeters && i == [self.exhibitions count] - 1) {
                [self.exhibitions addObject:exhibition];
                break;
            } else if (([self.exhibitions objectAtIndex:i].gallery.distanceFromUserInMeters > exhibition.gallery.distanceFromUserInMeters) && exhibition.gallery.distanceFromUserInMeters != -1){
                [self.exhibitions insertObject:exhibition atIndex:i];
                break;
            }
        }
    }
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

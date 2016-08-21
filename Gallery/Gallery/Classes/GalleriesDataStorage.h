//
//  GalleriesDataStorage.h
//  Gallery
//
//  Created by Anton Aleksieiev on 8/21/16.
//  Copyright © 2016 fynjy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Gallery.h"

@interface GalleriesDataStorage : NSObject


@property (strong, nonatomic)NSMutableArray<Gallery *> *galleries;

-(void) addGallery:(Gallery *) gallery;
-(void) removeGallery:(Gallery *) gallery;

@end

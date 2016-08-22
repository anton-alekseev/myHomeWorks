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
@property (strong, nonatomic)NSMutableArray<Exhibition *> *exhibitions;
@property (strong, nonatomic)NSMutableArray<Masterpiece *> *masterpieces;

-(void) addGallery:(Gallery *) gallery;
-(void) removeGallery:(Gallery *) gallery;
-(void) addExhibition:(Exhibition *) exhibition;
-(void) removeExhibition:(Exhibition *) exhibition;
-(void) addMasterpiece:(Masterpiece *) masterpiece;
-(void) removeMasterpiece:(Masterpiece *) masterpiece;

@end

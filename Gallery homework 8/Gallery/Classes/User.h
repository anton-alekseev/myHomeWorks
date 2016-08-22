//
//  User.h
//  Gallery
//
//  Created by Anton Aleksieiev on 8/21/16.
//  Copyright © 2016 fynjy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Gallery.h"
#import "Exhibition.h"
#import "Masterpiece.h"

@interface User : NSObject

@property (strong, nonatomic)NSMutableArray<Gallery *> *favoriteGalleries;
@property (strong, nonatomic)NSMutableArray<Exhibition *> *favoriteExhibitions;
@property (strong, nonatomic)NSMutableArray<Masterpiece *> *favoriteMasterpieces;

-(void) addGallery:(Gallery *) gallery;
-(void) removeGallery:(Gallery *) gallery;
-(void) addExhibition:(Exhibition *) exhibition;
-(void) removeExhibition:(Exhibition *) exhibition;
-(void) addMasterpiece:(Masterpiece *) masterpiece;
-(void) removeMasterpiece:(Masterpiece *) masterpiece;

@end

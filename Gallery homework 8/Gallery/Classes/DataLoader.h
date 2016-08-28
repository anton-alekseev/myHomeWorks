//
//  DataLoader.h
//  Gallery
//
//  Created by Anton Aleksieiev on 8/26/16.
//  Copyright © 2016 fynjy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Exhibition.h"
#import "GalleriesDataStorage.h"

@protocol DataLoaderProtocol

-(NSArray *) parseJsonFilewithName: (NSString *) name;
-(void)addGalleries: (NSArray *)galleries;
-(void)addExhibitions: (NSArray *)exhibitions;
-(void)addMasterpieces: (NSArray *)masterpieces;

@end

@interface DataLoader : NSObject <DataLoaderProtocol>



@end



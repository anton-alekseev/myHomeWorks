//
//  User.m
//  Gallery
//
//  Created by Anton Aleksieiev on 8/21/16.
//  Copyright © 2016 fynjy. All rights reserved.
//

#import "User.h"


@implementation User

-(void) addGallery:(Gallery *) gallery{
    [self.favoriteGalleries addObject:gallery];
}
-(void) removeGallery:(Gallery *) gallery{
    [self.favoriteGalleries removeObject:gallery];
}
-(void) addExhibition:(Exhibition *) exhibition{
    [self.favoriteExhibitions addObject:exhibition];
}
-(void) removeExhibition:(Exhibition *) exhibition{
    [self.favoriteExhibitions removeObject:exhibition];
}
-(void) addMasterpiece:(Masterpiece *) masterpiece{
    [self.favoriteMasterpieces addObject:masterpiece];
}
-(void) removeMasterpiece:(Masterpiece *) masterpiece{
    [self.favoriteMasterpieces removeObject:masterpiece];
}


@end

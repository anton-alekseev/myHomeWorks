//
//  DataLoader.m
//  Gallery
//
//  Created by Anton Aleksieiev on 8/26/16.
//  Copyright © 2016 fynjy. All rights reserved.
//

#import "DataLoader.h"
#import <CoreLocation/CoreLocation.h>

@interface DataLoader()

@property (strong, nonatomic) GalleriesDataStorage* storage;


@end

@implementation DataLoader

- (instancetype)init
{
    self = [super init];
    if (self) {
        _storage = [[GalleriesDataStorage alloc]init];
    }
    return self;
}

-(void) addData{
    [self addGalleries: [self parseJsonFilewithName:@"galleries"]];
    [self addMasterpieces: [self parseJsonFilewithName:@"works"]];
    [self addExhibitions: [self parseJsonFilewithName:@"exhibitions"]];
    // [self.];
}

-(NSUInteger)exhibitionsCount{
    return [self.storage.exhibitions count];
}

-(NSArray<Exhibition *>*)exhibitionList{
    return [NSArray arrayWithArray:self.storage.exhibitions];
}

-(NSArray *) parseJsonFilewithName: (NSString *) name{
    NSURL *URL = [[NSBundle mainBundle] URLForResource:name withExtension:@"json"];
    NSData *data = [NSData dataWithContentsOfURL:URL];
    NSError *error = nil;
    
    NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    return array;
}
-(void)addGalleries: (NSArray *)galleries {
    for (NSDictionary *dict in galleries){
        Gallery *gal = [[Gallery alloc]init];
        double lat = 0.0, lon = 0.0;
        for (NSString *key in dict){
            if ([key isEqualToString:@"_id"]){
                gal.idNumber = [dict objectForKey:key];
            }else if ([key isEqualToString:@"_created_at"]){
                gal.creationTime = [dict objectForKey:key];
            }else if ([key isEqualToString:@"_updated_at"]){
                gal.updateTime = [dict objectForKey:key];
            }else if ([key isEqualToString:@"galleryDescription"]){
                gal.venueDescription = [dict objectForKey:key];
            }else if ([key isEqualToString:@"name"]){
                gal.title = [dict objectForKey:key];
            }else if ([key isEqualToString:@"email"]){
                gal.email = [dict objectForKey:key];
            }else if ([key isEqualToString:@"facebook"]){
                gal.facebookPage = [dict objectForKey:key];
            }else if ([key isEqualToString:@"city"]){
                gal.city = [dict objectForKey:key];
            }else if ([key isEqualToString:@"schedule"]){
                gal.schedule = [dict objectForKey:key];
            }else if ([key isEqualToString:@"address"]){
                gal.adress = [dict objectForKey:key];
            }else if ([key isEqualToString:@"galleryLogo"]){
                gal.logo = [dict objectForKey:key];
            }else if ([key isEqualToString:@"link"]){
                gal.web = [dict objectForKey:key];
            }else if ([key isEqualToString:@"phone"]){
                gal.phoneNumber = [dict objectForKey:key];
            }else if ([key isEqualToString:@"latitude"]){
                lat = [[dict objectForKey:key] doubleValue];
                gal.latitude = [dict objectForKey:key];
            }else if ([key isEqualToString:@"longitude"]){
                gal.longitude = [dict objectForKey:key];
                lon = [[dict objectForKey:key] doubleValue];
            }
        }
        gal.location = [[CLLocation alloc]initWithLatitude:lat longitude:lon];
        gal.distanceFromUserInMeters = [[[CLLocation alloc] init] distanceFromLocation:gal.location];
        gal.distanceFromUserInMeters /= 1000;
        [self.storage addGallery:gal];
    }
}

-(void)addExhibitions: (NSArray *)exhibitions {
    for (NSDictionary *dict in exhibitions){
        Exhibition *exb = [[Exhibition alloc]init];
        for (NSString *key in dict){

            if ([key isEqualToString:@"_id"]){
                exb.idNumber = [dict objectForKey:key];
            }else if ([key isEqualToString:@"_created_at"]){
                exb.creationTime = [dict objectForKey:key];
            }else if ([key isEqualToString:@"_updated_at"]){
                exb.updateTime = [dict objectForKey:key];
            }else if ([key isEqualToString:@"authorName"]){
                exb.authorName = [dict objectForKey:key];
            }else if ([key isEqualToString:@"_p_gallery"]){
                for (Gallery *gallery in self.storage.galleries){
                    if ([gallery.idNumber isEqualToString:[[[dict objectForKey:key] componentsSeparatedByString:@"$"] lastObject]]) {
                        exb.gallery = gallery;
                    }
                }
            }else if ([key isEqualToString:@"name"]){
                exb.title = [dict objectForKey:key];
            }else if ([key isEqualToString:@"authorDescription"]){
                exb.authorDescription = [dict objectForKey:key];
            }else if ([key isEqualToString:@"dateStart"]){
                if ([dict objectForKey:key] ) {
                    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                    formatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss";
                    if ([dict objectForKey:key] != [NSNull null]){
                        NSString *string = [dict objectForKey:key];
                        NSDate *date = [formatter dateFromString:string];
                        exb.openDate = date;
                    }
                }
            }else if ([key isEqualToString:@"about"]){
                exb.eventDescription = [dict objectForKey:key];
            }else if ([key isEqualToString:@"dateEnd"]){
                if ([dict objectForKey:key]){
                    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
                    formatter.dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z'";
                    if ([dict objectForKey:key] != [NSNull null]){
                        NSString *string = [dict objectForKey:key];
                        NSDate *date = [formatter dateFromString:string];
                        exb.closingDate = date;
                    }

                }
            }else if ([key isEqualToString:@"works"]){
                for (NSDictionary *dictionaryOfWork in [dict objectForKey:key]){
                    if ([dictionaryOfWork objectForKey:@"objectId"]) {
                        NSString *workId = [dictionaryOfWork objectForKey:@"objectId"];
                        for (Masterpiece *work in self.storage.masterpieces){
                            if ([work.idOfMasterpiece isEqualToString:workId]) {
//                                NSString *filePath = [[NSBundle mainBundle] pathForResource:work.photo ofType:@"jpg"];
//                                if(filePath.length > 0 && filePath != (id)[NSNull null]){
                                [exb.masterpiecesMutableArray addObject:work];
//                                }
                            }
                        }

                    }
                }
            }else if ([key isEqualToString:@"likesCount"]){
                exb.likesCount = [[dict objectForKey:key] intValue];
            }
        }
        if ([exb.masterpiecesMutableArray count] != 0) {
            [self.storage addExhibition:exb];
        }
    }
}

-(void)addMasterpieces: (NSArray *)masterpieces{
    for (NSDictionary *dict in masterpieces){
        Masterpiece *work = [[Masterpiece alloc]init];
        for (NSString *key in dict) {
            if ([key isEqualToString:@"_id"]) {
                work.idOfMasterpiece = [dict objectForKey:key];
            }else if ([key isEqualToString:@"imgPicture"]) {
                work.photo = [[[[dict objectForKey:key] lowercaseString] componentsSeparatedByString:@".jp" ] firstObject];
            }else if ([key isEqualToString:@"title"]) {
                work.title = [dict objectForKey:key];
            }else if ([key isEqualToString:@"year"]) {
                work.year = [dict objectForKey:key];
            }else if ([key isEqualToString:@"author"]) {
                work.authorName = [dict objectForKey:key];
            }else if ([key isEqualToString:@"size"]) {
                work.size = [dict objectForKey:key];
            }else if ([key isEqualToString:@"type"]) {
                work.type = [dict objectForKey:key];
            }else if ([key isEqualToString:@"_updated_at"]) {
                work.updateDate = [dict objectForKey:key];
            }else if ([key isEqualToString:@"_created_at"]) {
                work.creationDate = [dict objectForKey:key];
            }
        }
        [self.storage addMasterpiece:work];
    }
}


@end

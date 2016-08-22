//
//  GalleryViewController.m
//  Gallery
//
//  Created by Anton Aleksieiev on 8/21/16.
//  Copyright © 2016 fynjy. All rights reserved.
//

#import "GalleryViewController.h"
#import "GalleriesDataStorage.h"


@interface GalleryViewController ()

@property (strong, nonatomic) GalleriesDataStorage *dataStorage;

@end

@implementation GalleryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataStorage = [[GalleriesDataStorage alloc]init];
    
    NSDictionary *galleries = [self parseJsonFilewithName:@"galleries"];
    [self addGalleries:galleries];
    
    NSDictionary *exhibitions = [self parseJsonFilewithName:@"exhibitions"];
    [self addExhibitions:exhibitions];
    
    for (Gallery *object in self.dataStorage.galleries) {
        NSLog(@"%@",object.title);
    }
    for (Exhibition *object in self.dataStorage.exhibitions) {
        NSLog(@"%@",object.title);
    }
}

-(NSDictionary *) parseJsonFilewithName: (NSString *) name{
    NSURL *URL = [[NSBundle mainBundle] URLForResource:name withExtension:@"json"];
    NSData *data = [NSData dataWithContentsOfURL:URL];
    NSError *error = nil;
    
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
    return dictionary;
}
-(void)addGalleries: (NSDictionary *)galleries {
    for (NSDictionary *dict in galleries){
        NSArray *keys = [dict allKeys];
        NSArray *values = [dict allValues];
        Gallery *gal = [[Gallery alloc]init];
        for (NSString *key in keys){
            NSUInteger index = [keys indexOfObject:key];
            if ([key isEqualToString:@"_id"]){
                gal.idNumber = [values objectAtIndex:index];
            }else if ([key isEqualToString:@"_created_at"]){
                gal.creationTime = [values objectAtIndex:index];
            }else if ([key isEqualToString:@"_updated_at"]){
                gal.updateTime = [values objectAtIndex:index];
            }else if ([key isEqualToString:@"galleryDescription"]){
                gal.venueDescription = [values objectAtIndex:index];
            }else if ([key isEqualToString:@"name"]){
                gal.title = [values objectAtIndex:index];
            }else if ([key isEqualToString:@"email"]){
                gal.email = [values objectAtIndex:index];
            }else if ([key isEqualToString:@"facebook"]){
                gal.facebookPage = [values objectAtIndex:index];
            }else if ([key isEqualToString:@"city"]){
                gal.city = [values objectAtIndex:index];
            }else if ([key isEqualToString:@"schedule"]){
                gal.schedule = [values objectAtIndex:index];
            }else if ([key isEqualToString:@"address"]){
                gal.adress = [values objectAtIndex:index];
            }else if ([key isEqualToString:@"galleryLogo"]){
                gal.logo = [values objectAtIndex:index];
            }else if ([key isEqualToString:@"link"]){
                gal.web = [values objectAtIndex:index];
            }else if ([key isEqualToString:@"phone"]){
                gal.phoneNumber = [values objectAtIndex:index];
            }else if ([key isEqualToString:@"latitude"]){
                gal.latitude = [values objectAtIndex:index];
            }else if ([key isEqualToString:@"longitude"]){
                gal.longtitude = [values objectAtIndex:index];
            }
        }
        [self.dataStorage addGallery:gal];
    }
}

-(void)addExhibitions: (NSDictionary *)exhibitions {
    for (NSDictionary *dict in exhibitions){
        NSArray *keys = [dict allKeys];
        NSArray *values = [dict allValues];
        Exhibition *exb = [[Exhibition alloc]init];
        for (NSString *key in keys){
            NSUInteger index = [keys indexOfObject:key];
            if ([key isEqualToString:@"_id"]){
                exb.idNumber = [values objectAtIndex:index];
            }else if ([key isEqualToString:@"_created_at"]){
                exb.creationTime = [values objectAtIndex:index];
            }else if ([key isEqualToString:@"_updated_at"]){
                exb.updateTime = [values objectAtIndex:index];
            }else if ([key isEqualToString:@"authorName"]){
                exb.authorName = [values objectAtIndex:index];
            }else if ([key isEqualToString:@"_p_gallery"]){
                exb.gallerieName = [values objectAtIndex:index];
            }else if ([key isEqualToString:@"name"]){
                exb.title = [values objectAtIndex:index];
            }else if ([key isEqualToString:@"authorDescription"]){
                exb.authorDescription = [values objectAtIndex:index];
            }else if ([key isEqualToString:@"dateStart"]){
                exb.openDate = [values objectAtIndex:index];
            }else if ([key isEqualToString:@"about"]){
                exb.eventDescription = [values objectAtIndex:index];
            }else if ([key isEqualToString:@"dateEnd"]){
                exb.closingDate = [values objectAtIndex:index];
            }else if ([key isEqualToString:@"works"]){
                exb.masterpieces = [values objectAtIndex:index];
            }else if ([key isEqualToString:@"likesCount"]){
                exb.likesCount = (NSString *) [values objectAtIndex:index];
            }
        }
        [self.dataStorage addExhibition:exb];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end

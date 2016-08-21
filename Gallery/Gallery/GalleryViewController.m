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

@property (strong, nonatomic) GalleriesDataStorage *galleries;

@end

@implementation GalleryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.galleries = [[GalleriesDataStorage alloc]init];
    
    NSURL *galleriesURL = [[NSBundle mainBundle] URLForResource:@"galleries" withExtension:@"json"];
    NSData *galleriesData = [NSData dataWithContentsOfURL:galleriesURL];
    NSError *galleriesError = nil;
    
    NSDictionary *galleries = [NSJSONSerialization JSONObjectWithData:galleriesData options:0 error:&galleriesError];
    
    [self addGalleries:galleries];
    
    for (Gallery *object in self.galleries.galleries) {
        NSLog(@"%@",object.title);
    }
    
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
        [self.galleries addGallery:gal];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end

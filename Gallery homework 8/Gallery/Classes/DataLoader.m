//
//  DataLoader.m
//  Gallery
//
//  Created by Anton Aleksieiev on 8/26/16.
//  Copyright © 2016 fynjy. All rights reserved.
//

#import "DataLoader.h"

#pragma mark - LocalDataLoader

@implementation LocalDataLoader

- (NSArray *) loadJSON:(NSString *) json withError: (NSError **) error
{
    NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:json ofType:@"json"]];
    NSArray *raw = [NSJSONSerialization JSONObjectWithData:data options:0 error:error];
    return raw;
}

- (void) loadEventsWithCallback: (void (^)(NSArray <Event *> *, NSError *error))callback{
    NSError *error = nil;
    NSArray *rawGalleries = [self loadJSON:@"galleries" withError:&error];
    NSArray *rawWorks = [self loadJSON:@"works" withError:&error];
    NSArray *rawExhibitions = [self loadJSON:@"exhibitions" withError:&error];
    
    if (error) {
        return callback(nil, error);
    }
    // setting galleries
    NSMutableDictionary <NSString *, Gallery *> *galleries = [[NSMutableDictionary alloc] initWithCapacity:[rawGalleries count]];
    
    for (NSDictionary *dic in rawGalleries) {
        Gallery *gal = [[Gallery alloc]initWithDictionary:dic];
        [galleries setObject:gal forKey:gal.idNumber];
    }
    //setting works
    NSMutableDictionary <NSString *, Masterpiece *> *works = [[NSMutableDictionary alloc] initWithCapacity:[rawWorks count]];
    
    for (NSDictionary *dic in rawWorks) {
        Masterpiece *work = [[Masterpiece alloc] initWithDictionary:dic];
        [works setObject:work forKey:work.idOfMasterpiece];
    }
    //setting exhibitions
    NSMutableArray *exhibitions = [NSMutableArray arrayWithCapacity:[rawExhibitions count]];
    for (NSDictionary *dic in rawExhibitions) {
        Exhibition *exb = [[Exhibition alloc] initWithDictionary:dic];
        //adding gallery to exhibition
        NSString *galleryID = [[dic[@"_p_gallery"] componentsSeparatedByString:@"$"]lastObject];
        exb.gallery = galleries[galleryID];
        if (exb.numberOfWorks != 0) {        
            //adding masterpieces to exhibition
            NSMutableArray<Masterpiece *> *worksArray = [[NSMutableArray<Masterpiece *> alloc]initWithCapacity:exb.numberOfWorks];
            for (NSDictionary *workDic in dic[@"works"]){
                Masterpiece *currentMasterpiece = [works objectForKey:workDic[@"objectId"]];
                NSString *filePath = [[NSString alloc] init];
                if ([currentMasterpiece.photo hasSuffix:@".jpg"]) {
                    filePath = [[NSBundle mainBundle] pathForResource:[[currentMasterpiece.photo componentsSeparatedByString:@".jp"] firstObject] ofType:@"jpg"];
                }else if ([currentMasterpiece.photo hasSuffix:@".JPG"]) {
                    filePath = [[NSBundle mainBundle] pathForResource:[[currentMasterpiece.photo componentsSeparatedByString:@".JP"] firstObject] ofType:@"jpg"];
                }else if ([currentMasterpiece.photo hasSuffix:@".PNG"]) {
                    filePath = [[NSBundle mainBundle] pathForResource:[[currentMasterpiece.photo componentsSeparatedByString:@".PN"] firstObject]ofType:@"png"];
                }else if ([currentMasterpiece.photo hasSuffix:@".png"]) {
                    filePath = [[NSBundle mainBundle] pathForResource:[[currentMasterpiece.photo componentsSeparatedByString:@".pn"] firstObject] ofType:@"png"];
                }else if ([currentMasterpiece.photo hasSuffix:@".tif"]) {
                    filePath = [[NSBundle mainBundle] pathForResource:[[currentMasterpiece.photo componentsSeparatedByString:@".ti"] firstObject] ofType:@"tif"];
                }
                if(filePath.length > 0 && filePath != (id)[NSNull null]){
                    [worksArray addObject: currentMasterpiece];
                }
            }
            if ([worksArray count] != 0) {
                exb.masterpiecesArray = worksArray;
            }
            [exhibitions addObject:exb];
        }
    }
    callback(exhibitions, nil);
}

@end

#pragma mark - APIDataLoader

@implementation APIDataLoader

- (void) loadEventsWithCallback: (void (^)(NSArray <Event *> *, NSError *error))callback{
    NSURL *url = [NSURL URLWithString:@"http://gallery-guru-prod.herokuapp.com/exhibitions"];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:5.0];
    
    NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * data, NSURLResponse * response, NSError * error) {
        if (error != 0) {
            callback(nil, error);
        } else{
            NSError *parseError = nil;
            NSArray *exhibitionsList = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];
            if (parseError != nil) {
                callback(nil, error);
            } else {
                NSArray *rawExhibitions = exhibitionsList;
                NSMutableArray *exhibitions = [NSMutableArray arrayWithCapacity:rawExhibitions.count];
                for (NSDictionary *dic in rawExhibitions) {
                    //setting gallery
                    Gallery *gallery = [[Gallery alloc]initWithDictionary:dic[@"gallery"]];
                    //setting works
                    NSArray *arrayOfWorks = dic[@"works"];
                    NSMutableArray<Masterpiece *> *masterpieceArray = [NSMutableArray arrayWithCapacity:arrayOfWorks.count];
                    for (NSDictionary *workDictionary in arrayOfWorks) {
                        Masterpiece *singleWork = [[Masterpiece alloc]initWithDictionaryFromAPI:workDictionary];
                        [masterpieceArray addObject:singleWork];
                    }
                    //setting exhibition
                    Exhibition *exb = [[Exhibition alloc]initWithDictionaryFromAPI:dic];
                    if (exb) {
                        exb.gallery = gallery;
                        exb.masterpiecesArray = [NSArray arrayWithArray:masterpieceArray];
                    }
                    [exhibitions addObject:exb];
                }
                callback(exhibitions, nil);
            }
        }
    }];
    [task resume];
    while (task.state != 3) {
        continue;
    }
}

@end

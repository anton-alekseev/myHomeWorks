//
//  API.m
//  Gallery
//
//  Created by Anton Aleksieiev on 9/24/16.
//  Copyright © 2016 fynjy. All rights reserved.
//

#import "API.h"
#import "APIManager.h"

@implementation API

- (void) loadEventsWithTask:(NSString*)task andCallback:(void (^)(NSArray <Event *> *, NSError *error))callback{
    
    [[APIManager sharedManager]GET:task parameters:nil
    progress:nil
    success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"Responce: %@", responseObject);
        NSArray *rawExhibitions = responseObject;
        NSMutableArray *exhibitions = [NSMutableArray arrayWithCapacity:rawExhibitions.count];
        for (NSDictionary *dic in rawExhibitions) {
            if (!dic[@"works"] || [dic[@"works"] count] == 0) {
                continue;
            }else{
                //setting gallery
                Gallery *gallery = [[Gallery alloc]initWithDictionaryFromAPI:dic[@"gallery"]];
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
    failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {

        callback(nil, error);
    }];
}

@end

//
//  Masterpiece.h
//  Gallery
//
//  Created by Anton Aleksieiev on 8/21/16.
//  Copyright © 2016 fynjy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface Masterpiece : NSObject

@property (strong, nonatomic) NSString *authorName;
@property (strong, nonatomic) NSString *creationDate;
@property (strong, nonatomic) NSString *photo;
@property (strong, nonatomic) NSURL *photoURL;
@property (strong, nonatomic) NSString *idOfMasterpiece;
@property (strong, nonatomic) NSString *size;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *type;
@property (strong, nonatomic) NSString *updateDate;
@property (strong, nonatomic) NSString *year;

@property (weak, nonatomic) Person *autor;

- (instancetype)initWithDictionary: (NSDictionary *) data;
- (instancetype)initWithDictionaryFromAPI: (NSDictionary *) data;


@end

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

@property (strong, nonatomic) NSString *photo;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *masterpieceDescription;
@property (strong, nonatomic) NSString *price;
@property (weak, nonatomic) Person *autor;


@end

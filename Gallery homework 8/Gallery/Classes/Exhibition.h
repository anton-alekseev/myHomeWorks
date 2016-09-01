//
//  Exhibition.h
//  Gallery
//
//  Created by Anton Aleksieiev on 8/21/16.
//  Copyright © 2016 fynjy. All rights reserved.
//

#import "Event.h"
#import "Masterpiece.h"
#import "Gallery.h"


@interface Exhibition : Event

@property (strong, nonatomic) Gallery *gallery;
@property (strong, nonatomic) NSMutableArray<Masterpiece *> *masterpiecesMutableArray;

@end

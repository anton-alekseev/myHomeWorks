//
//  Exhibition.m
//  Gallery
//
//  Created by Anton Aleksieiev on 8/21/16.
//  Copyright © 2016 fynjy. All rights reserved.
//

#import "Exhibition.h"


@implementation Exhibition

- (NSMutableArray *)masterpiecesMutableArray {
    if (!_masterpiecesMutableArray) {
        _masterpiecesMutableArray = [[NSMutableArray alloc] init];
    }
    return _masterpiecesMutableArray;
}


@end

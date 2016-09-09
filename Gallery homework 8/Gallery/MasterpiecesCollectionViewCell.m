//
//  MasterpiecesCollectionViewCell.m
//  Gallery
//
//  Created by Anton Aleksieiev on 9/9/16.
//  Copyright © 2016 fynjy. All rights reserved.
//

#import "MasterpiecesCollectionViewCell.h"

@implementation MasterpiecesCollectionViewCell

// Lazy loading of the imageView
- (UIImageView *) imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:self.contentView.bounds];
        [self.contentView addSubview:_imageView];
    }
    return _imageView;
}

// Here we remove all the custom stuff that we added to our subclassed cell
-(void)prepareForReuse
{
    [super prepareForReuse];
    
    [self.imageView removeFromSuperview];
    self.imageView = nil;
}

@end

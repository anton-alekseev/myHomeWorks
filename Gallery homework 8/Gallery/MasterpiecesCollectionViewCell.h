//
//  MasterpiecesCollectionViewCell.h
//  Gallery
//
//  Created by Anton Aleksieiev on 9/9/16.
//  Copyright © 2016 fynjy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MasterpiecesCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) UIImageView *imageView;
-(void)prepareForReuse;


@end

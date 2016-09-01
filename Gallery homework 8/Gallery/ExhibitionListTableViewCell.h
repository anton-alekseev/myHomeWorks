//
//  ExhibitionListTableViewCell.h
//  Gallery
//
//  Created by Anton Aleksieiev on 8/28/16.
//  Copyright © 2016 fynjy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExhibitionListTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (weak, nonatomic) IBOutlet UIImageView *nameBackgrpund;
@property (weak, nonatomic) IBOutlet UILabel *galleryName;
@property (weak, nonatomic) IBOutlet UILabel *workName;
@property (weak, nonatomic) IBOutlet UILabel *distance;
@property (weak, nonatomic) IBOutlet UILabel *AuthorName;

@end

//
//  ExhibitionInfoViewController.h
//  Gallery
//
//  Created by Anton Aleksieiev on 9/2/16.
//  Copyright © 2016 fynjy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Exhibition.h"

@interface ExhibitionInfoViewController : UIViewController
@property (strong, nonatomic) Exhibition *exhibition;
@property (assign, nonatomic) NSInteger index;
@end

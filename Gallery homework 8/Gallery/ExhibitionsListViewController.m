//
//  ExhibitionsListViewController.m
//  Gallery
//
//  Created by Anton Aleksieiev on 8/28/16.
//  Copyright © 2016 fynjy. All rights reserved.
//

#import "ExhibitionsListViewController.h"
#import "EventsModel.h"
#import "ExhibitionListTableViewCell.h"
#import "ExhibitionInfoViewController.h"

@interface ExhibitionsListViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ExhibitionsListViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"View did load");

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"showExhibitionDetailSegue"]){
        
        ExhibitionInfoViewController *vc = segue.destinationViewController;
            vc.index = [self.tableView indexPathForSelectedRow].row;

    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  [[EventsModel sharedModel].events count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //Initializing cell
    ExhibitionListTableViewCell *cell = (ExhibitionListTableViewCell *) [tableView dequeueReusableCellWithIdentifier:@"ExhibitionCell"];
    
    //Initializing item in a row
    Exhibition *exhibition =  (Exhibition *)[[EventsModel sharedModel].events objectAtIndex:indexPath.row];
        if (cell) {
            cell.galleryName.text = exhibition.gallery.title;
//            NSString *localPath = [[NSBundle mainBundle] bundlePath];
//            NSString *imagePath = [localPath stringByAppendingPathComponent:[exhibition.masterpiecesArray firstObject].photo];
            cell.backgroundImage.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[exhibition.masterpiecesArray firstObject].photoURL]];
            cell.workName.text = exhibition.title;
            cell.AuthorName.text = [[exhibition.masterpiecesArray firstObject] authorName];
            int distance = exhibition.gallery.distanceFromUserInMeters;
            cell.distance.text = [NSString stringWithFormat:@"%d km", distance];
        }
    
    
    return cell;
}

@end

//
//  ExhibitionsListViewController.m
//  Gallery
//
//  Created by Anton Aleksieiev on 8/28/16.
//  Copyright © 2016 fynjy. All rights reserved.
//

#import "ExhibitionsListViewController.h"
#import "ExhibitionListTableViewCell.h"
#import "DataLoader.h"
#import "ExhibitionInfoViewController.h"

@interface ExhibitionsListViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) id<DataLoaderProtocol> loader;

@end

@implementation ExhibitionsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    self.loader = [[DataLoader alloc]init];
    [self.loader addData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"showExhibitionDetailSegue"]){
        
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        
        ExhibitionInfoViewController *vc = segue.destinationViewController;
        Exhibition *exhibitionAtIndexPath = [[self.loader exhibitionList]objectAtIndex:indexPath.row];
        vc.exhibition = exhibitionAtIndexPath;
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.loader exhibitionsCount];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //Initializing cell
    ExhibitionListTableViewCell *cell = (ExhibitionListTableViewCell *) [tableView dequeueReusableCellWithIdentifier:@"ExhibitionCell"];
    
    //Initializing item in a row
    Exhibition *exhibition =  [[self.loader exhibitionList] objectAtIndex:indexPath.row];
        if (cell) {
            cell.galleryName.text = exhibition.gallery.title;
            NSString *localPath = [[NSBundle mainBundle] bundlePath];
            NSString *imagePath = [localPath stringByAppendingPathComponent:[exhibition.masterpiecesMutableArray firstObject].photo];
            cell.backgroundImage.image = [UIImage  imageWithContentsOfFile:imagePath];
            cell.workName.text = exhibition.title;
            cell.AuthorName.text = [[exhibition.masterpiecesMutableArray firstObject] authorName];
            int distance = exhibition.gallery.distanceFromUserInMeters;
            cell.distance.text = [NSString stringWithFormat:@"%d km", distance];
        }
    
    
    return cell;
}

@end

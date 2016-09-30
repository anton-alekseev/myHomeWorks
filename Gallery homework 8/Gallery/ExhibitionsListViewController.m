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
#import "ImageLoader.h"

@interface ExhibitionsListViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (assign, nonatomic) BOOL isDataLoaded;
@property (strong, nonatomic) UIView *placeholderImage;
@property (weak, nonatomic) IBOutlet UIButton *choiceButton;
@property (weak, nonatomic) IBOutlet UILabel *choiseButtonLabel;
@property (assign, nonatomic) Filter filter;
@property (weak, nonatomic) IBOutlet UIVisualEffectView *filterView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *filterViewBottomConstraint;
@property (weak, nonatomic) IBOutlet UIButton *nearMeButton;
@property (weak, nonatomic) IBOutlet UIButton *openingButton;
@property (weak, nonatomic) IBOutlet UIButton *lastChanceButton;
@property (weak, nonatomic) IBOutlet UIButton *followingButton;
@property (weak, nonatomic) IBOutlet UIButton *mostPopularButton;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@end

@implementation ExhibitionsListViewController

- (void)viewWillAppear:(BOOL)animated{
    [self preferredStatusBarStyle];
    self.filterView.hidden = YES;
    self.filterViewBottomConstraint.constant = self.view.frame.size.height;
    self.navigationController.navigationBarHidden = YES;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void) viewWillDisappear:(BOOL)animated{
    self.navigationController.navigationBarHidden = NO;
}
-(void) loadDataWithFilterNumber:(NSUInteger) filterNumber{
    [ImageLoader sharedloader];
    self.filter = filterNumber;
    EventsModel *model = [EventsModel sharedModel];
    self.placeholderImage = [[UIView alloc] initWithFrame:self.view.frame];
    [model loadDataWithFilter:self.filter andCallback:^{
        [self.tableView reloadData];
        self.isDataLoaded = YES;
        [self.placeholderImage removeFromSuperview];
        self.choiceButton.layer.borderColor = [UIColor whiteColor].CGColor;
        self.choiceButton.layer.borderWidth = 2.0;
        self.choiceButton.layer.cornerRadius = 10.0;
        
        [self setChoiseButtonLabelTextDependengOnFilter:self.filter];
        
        self.isDataLoaded = !self.isDataLoaded;
    }];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    [EventsModel sharedModel];
    [self loadDataWithFilterNumber:0];


//    }];
    if (!self.isDataLoaded) {
        self.placeholderImage.backgroundColor = [UIColor blackColor];
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake((self.tableView.frame.size.width / 2) - 110, self.tableView.frame.size.height / 5, 220, 30)];
        label.textColor = [UIColor whiteColor];
        label.text = @"Data loading, please wait...";
        [self.placeholderImage addSubview:label];
        [self.view addSubview:self.placeholderImage];
    }
}

- (void) setChoiseButtonLabelTextDependengOnFilter:(Filter)filter{
    switch (self.filter) {
        case 1:
            self.choiseButtonLabel.text = @"Most Popular";
            break;
        case 2:
            self.choiseButtonLabel.text = @"Opening";
            break;
        case 3:
            self.choiseButtonLabel.text = @"Last chance";
            break;
        case 4:
            self.choiseButtonLabel.text = @"Following";
            break;
        default:
            self.choiseButtonLabel.text = @"Near Me";
            break;
    }
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

- (void) reloadData: (void (^)(void))callback{
    [self.tableView reloadData];
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
            /*
            cell.backgroundImage.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[exhibition.masterpiecesArray firstObject].photoURL]];
             */
            [[ImageLoader sharedloader] getImagewithUrl:[exhibition.masterpiecesArray firstObject].photo defaultImage:@"Picture2" withCallback:^(UIImage * image) {
                cell.backgroundImage.image = image;
            }];
            cell.workName.text = exhibition.title;
            cell.AuthorName.text = [[exhibition.masterpiecesArray firstObject] authorName];
            int distance = exhibition.gallery.distanceFromUserInMeters;
            cell.distance.text = [NSString stringWithFormat:@"%d km", distance];
        }
    
    
    return cell;
}

- (IBAction)didTouchChoiceButton:(id)sender {
    
    self.filterView.hidden = NO;
    self.filterViewBottomConstraint.constant = 0;
    self.backButton.layer.borderColor = [UIColor whiteColor].CGColor;
    self.backButton.layer.borderWidth = 0.5;
    self.backButton.layer.cornerRadius = 15.0;

    
    __weak typeof(self) weakself = self;
    [UIView animateWithDuration:0.5 animations:^{
        [weakself.view layoutIfNeeded];
    }];

}
- (IBAction)didTouchNearMeButton:(UIButton *)sender {
    self.filterViewBottomConstraint.constant = self.view.frame.size.height;
    [self loadDataWithFilterNumber:0];
    __weak typeof(self) weakself = self;
    [UIView animateWithDuration:0.5 animations:^{
        [weakself.view layoutIfNeeded];
    }];

}
- (IBAction)didTouchMostPopularButton:(UIButton *)sender {
    self.filterViewBottomConstraint.constant = self.view.frame.size.height;
    [self loadDataWithFilterNumber:1];
    __weak typeof(self) weakself = self;
    [UIView animateWithDuration:0.5 animations:^{
        [weakself.view layoutIfNeeded];
    }];

}
- (IBAction)didTouchOpeningButton:(UIButton *)sender {
    self.filterViewBottomConstraint.constant = self.view.frame.size.height;
    [self loadDataWithFilterNumber:3];
    __weak typeof(self) weakself = self;
    [UIView animateWithDuration:0.5 animations:^{
        [weakself.view layoutIfNeeded];
    }];

}
- (IBAction)didTouchLastChanceButton:(UIButton *)sender {
    self.filterViewBottomConstraint.constant = self.view.frame.size.height;
    [self loadDataWithFilterNumber:4];
    __weak typeof(self) weakself = self;
    [UIView animateWithDuration:0.5 animations:^{
        [weakself.view layoutIfNeeded];
    }];

}

- (IBAction)didTouchFollowingButton:(UIButton *)sender {
    
}
- (IBAction)didTouchBackButton:(UIButton *)sender {
    self.filterViewBottomConstraint.constant = self.view.frame.size.height;
    
    __weak typeof(self) weakself = self;
    [UIView animateWithDuration:0.5 animations:^{
        [weakself.view layoutIfNeeded];
    }];
}


@end

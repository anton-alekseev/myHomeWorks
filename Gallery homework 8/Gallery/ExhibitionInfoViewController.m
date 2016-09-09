//
//  ExhibitionInfoViewController.m
//  Gallery
//
//  Created by Anton Aleksieiev on 9/2/16.
//  Copyright © 2016 fynjy. All rights reserved.
//

#import "ExhibitionInfoViewController.h"
#import "MasterpiecesCollectionViewCell.h"

@interface ExhibitionInfoViewController () <UICollectionViewDataSource>
//Forming Properties
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *infoViewHeightConstraint;
@property (assign,nonatomic) BOOL isExpanded;
@property (weak, nonatomic) IBOutlet UIButton *arrow;
//Exhibition Header
@property (weak, nonatomic) IBOutlet UILabel *exhibitionName;
@property (weak, nonatomic) IBOutlet UILabel *authorName;
@property (weak, nonatomic) IBOutlet UILabel *dates;
//Gallery Information
@property (weak, nonatomic) IBOutlet UILabel *galleryName;
@property (weak, nonatomic) IBOutlet UIImageView *galleryLogo;
@property (weak, nonatomic) IBOutlet UILabel *workingHoursOnWorkingDays;
@property (weak, nonatomic) IBOutlet UILabel *workingHoursOnWeekends;
@property (weak, nonatomic) IBOutlet UILabel *galleryAddress;
@property (weak, nonatomic) IBOutlet UILabel *galleryPhoneNumber;
@property (weak, nonatomic) IBOutlet UILabel *galleryWebSite;
@property (weak, nonatomic) IBOutlet UILabel *galleryFacebookPage;
@property (weak, nonatomic) IBOutlet UILabel *galleryDescription;
//Exhibition Description
@property (weak, nonatomic) IBOutlet UILabel *about;
//Author Description
@property (weak, nonatomic) IBOutlet UILabel *authorDescription;
@property (weak, nonatomic) IBOutlet UILabel *authorWebSite;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

@implementation ExhibitionInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isExpanded = YES;
    [self.arrow.imageView centerXAnchor];
    self.exhibitionName.text = self.exhibition.title;
    self.authorName.text = self.exhibition.authorName;
    //dates forming
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd.MM.yy"];
    NSString *openDate = [dateFormatter stringFromDate:self.exhibition.openDate];
    NSString *endDate = [dateFormatter stringFromDate:self.exhibition.closingDate];
    self.dates.text = [[openDate stringByAppendingString:@" - "]stringByAppendingString:endDate];
    self.galleryName.text = self.exhibition.gallery.title;
    //logo forming
    NSString *mainBundlePath = [[NSBundle mainBundle]bundlePath];
    NSString *logoPath = [mainBundlePath stringByAppendingPathComponent:self.exhibition.gallery.logo];
    self.galleryLogo.image = [UIImage imageWithContentsOfFile:logoPath];
    
    self.workingHoursOnWorkingDays.text = [self.exhibition.gallery.schedule firstObject];
    self.workingHoursOnWeekends.text = [self.exhibition.gallery.schedule lastObject];
    
    self.galleryAddress.text = self.exhibition.gallery.adress;
    self.galleryPhoneNumber.text = self.exhibition.gallery.phoneNumber;
    self.galleryWebSite.text = (NSString *) self.exhibition.gallery.web;
    self.galleryFacebookPage.text = @"Facebook";
    self.galleryDescription.text = self.exhibition.gallery.venueDescription;
    
    self.about.text = self.exhibition.eventDescription;
    
    self.authorDescription.text = self.exhibition.authorDescription;
    self.authorWebSite.text = @"no link right now";
    
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.exhibition.masterpiecesMutableArray count];
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (MasterpiecesCollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MasterpiecesCollectionViewCell *cell = (MasterpiecesCollectionViewCell *) [collectionView dequeueReusableCellWithReuseIdentifier:@"masterpiece" forIndexPath:indexPath];
    Masterpiece *work = [self.exhibition.masterpiecesMutableArray objectAtIndex:indexPath.row];
    if (cell) {
        NSString *mainBundlePath = [[NSBundle mainBundle]bundlePath];
        NSString *imagePath = [mainBundlePath stringByAppendingPathComponent:work.photo];
        cell.imageView.image = [UIImage imageWithContentsOfFile:imagePath];
    }
    return cell;
    
}


- (IBAction)didTouchMoreButton:(id)sender {
    if (self.isExpanded == YES) {
        self.infoViewHeightConstraint.constant = 0;
        self.arrow.transform = CGAffineTransformMakeRotation( ( 180 * M_PI ) / 180 );
    } else {
        self.infoViewHeightConstraint.constant = 365;
        self.arrow.transform = CGAffineTransformMakeRotation( 0 );
    }
    
    self.isExpanded = !self.isExpanded;
    __weak typeof(self) weakself = self;
    [UIView animateWithDuration:0.5 animations:^{
        [weakself.view layoutIfNeeded];
    }];
}

@end

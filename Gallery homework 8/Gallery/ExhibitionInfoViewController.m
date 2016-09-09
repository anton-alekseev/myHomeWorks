//
//  ExhibitionInfoViewController.m
//  Gallery
//
//  Created by Anton Aleksieiev on 9/2/16.
//  Copyright © 2016 fynjy. All rights reserved.
//

#import "ExhibitionInfoViewController.h"

@interface ExhibitionInfoViewController ()
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

@end

@implementation ExhibitionInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.isExpanded = YES;
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
    self.galleryFacebookPage.text = self.exhibition.gallery.facebookPage;
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

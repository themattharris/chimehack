//
//  UCFAchievementsViewController.m
//  chimehack
//
//  Created by Marc Nijdam on 12/7/13.
//  Copyright (c) 2013 Unicef. All rights reserved.
//

#import "UCFAchievementsViewController.h"
#import "UCFBadgesViewController.h"

#import "UCFAchievementButton.h"
#import "UCFService.h"
#import "UCFSettings.h"

@interface UCFAchievementsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *headerLabel;
@property (weak, nonatomic) IBOutlet UCFAchievementButton *donorButton;
@property (weak, nonatomic) IBOutlet UCFAchievementButton *donationsButton;
@property (weak, nonatomic) IBOutlet UCFAchievementButton *linksButton;
@property (weak, nonatomic) IBOutlet UCFAchievementButton *badgesButton;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation UCFAchievementsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (!self) return nil;
    
    self.title = NSLocalizedString(@"Achievements", nil);
    self.tabBarItem = [UITabBarItem ucf_tabBarItemWithBaseName:@"tabbar-star" title:self.title];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(_didTapReloadButton:)];
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _headerLabel.attributedText = [NSAttributedString ucf_trickOrTreatString];
    
    [self _updateNameLabelWith:[[UCFSettings sharedInstace] signedInUserName]];
    
    [self _reloadAchievementsData];
}

- (void)_reloadAchievementsData
{
    id referredId = [[UCFSettings sharedInstace] signedInUserId];
    
    self.navigationItem.rightBarButtonItem.enabled = NO;
    __weak typeof(self) weakSelf = self;
    [[UCFService sharedInstance] fetchDonationsByReferer:referredId completion:^(id result, NSError *error) {
        self.navigationItem.rightBarButtonItem.enabled = YES;
        if (error) {
            [self ucf_presentErrorMessage:error.localizedDescription];
        } else {
            [weakSelf _updateAchievementsWithData:result];
        }
    }];
}


- (void)_updateNameLabelWith:(NSString *)name
{
    _nameLabel.text = name;
}

- (void)_updateAchievementsWithData:(NSDictionary *)data
{
    NSDictionary *firstDonation = [[data valueForKeyPath:@"donations"] firstObject];
    NSString *userName = [firstDonation valueForKeyPath:@"referrer.name"];
    [self _updateNameLabelWith:userName];
    
    NSNumber *donationsCount = data[@"count"] ?: @0;
    _donationsButton.amountLabel.text = donationsCount.stringValue;

    NSNumber *donorCount = data[@"unique_donors"] ?: @0;
    _donorButton.amountLabel.text = [donorCount stringValue];
    
    _linksButton.amountLabel.text = @"12";
    _badgesButton.amountLabel.text = @"7";

}

- (IBAction)didTapBadgesButton:(id)sender
{
    UCFBadgesViewController *controller = [[UCFBadgesViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)_didTapReloadButton:(id)sender
{
    [self _reloadAchievementsData];
}

@end

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
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _headerLabel.attributedText = [NSAttributedString ucf_trickOrTreatString];
    _nameLabel.text = [[UCFSettings sharedInstace] signedInUserName];
    
    [self _updateAchievementsWithData:nil];
}

- (void)_updateAchievementsWithData:(NSDictionary *)data
{
    _donorButton.amountLabel.text = @"8";
    _donationsButton.amountLabel.text = @"200";
    _linksButton.amountLabel.text = @"12";
    _badgesButton.amountLabel.text = @"7";
}

- (IBAction)didTapBadgesButton:(id)sender
{
    UCFBadgesViewController *controller = [[UCFBadgesViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

@end

//
//  UCFDonateViewController.m
//  chimehack
//
//  Created by Marc Nijdam on 12/6/13.
//  Copyright (c) 2013 Unicef. All rights reserved.
//

#import "UCFDonateViewController.h"

#import "UCFSendEmailViewController.h"
#import "UCFCreditCardViewController.h"

#import "UCFSettings.h"
#import "UCFService.h"

@interface UCFDonateViewController ()
@property (weak, nonatomic) IBOutlet UILabel *headerLabel;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *achievedLabel;
@property (strong, nonatomic) IBOutlet UILabel *valuationLabel;
@property (weak, nonatomic) IBOutlet UISlider *valueSlider;

@end

@implementation UCFDonateViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (!self) return nil;
    
    self.title = NSLocalizedString(@"Donate", nil);
    self.tabBarItem = [UITabBarItem ucf_tabBarItemWithBaseName:@"tabbar-unicef" title:self.title];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(_didTapReloadButton:)];

    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _headerLabel.attributedText = [NSAttributedString ucf_trickOrTreatString];
    
    UIImage *thumbImage = [UIImage imageNamed:@"btn-drag-circle"];
    [self.valueSlider setThumbImage:thumbImage forState:UIControlStateNormal];
    [self.valueSlider setThumbImage:thumbImage forState:UIControlStateHighlighted];
    
    NSString *userName = [[UCFSettings sharedInstace] signedInUserName];
    [self _updateNameLabelWith:userName];

    [self _reloadViewData];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

}

- (void)_reloadViewData
{
    id referrerId = [[UCFSettings sharedInstace] signedInUserId];
    
    self.navigationItem.rightBarButtonItem.enabled = NO;
    
    __weak typeof(self) weakSelf = self;
    [[UCFService sharedInstance] fetchDonationsByReferer:referrerId completion:^(id result, NSError *error) {
        weakSelf.navigationItem.rightBarButtonItem.enabled = YES;
        [weakSelf _updateViewWithData:result];
    }];
}

- (void)_updateNameLabelWith:(NSString *)name
{
    NSString *nameString = [NSString stringWithFormat:NSLocalizedString(@"%@ raised", nil), name];
    _nameLabel.text = nameString;
}

- (void)_updateViewWithData:(NSDictionary *)data
{
    NSNumber *totalValue = data[@"total_value"] ?: @0;
    
    NSDictionary *firstDonation = [[data valueForKeyPath:@"donations"] firstObject];
    
    NSNumber *challengeTarget = [firstDonation valueForKeyPath:@"challenge.target"];
    NSAttributedString *achievedText = [NSAttributedString ucf_challengeProgressStringForAmount:totalValue target:challengeTarget];
    _achievedLabel.attributedText = achievedText;
    
    NSString *userName = [firstDonation valueForKeyPath:@"referrer.name"];
    [self _updateNameLabelWith:userName];
}

- (void)_didTapReloadButton:(id)sender
{
    [self _reloadViewData];
}

- (IBAction)didChangeSliderValue:(id)sender {
}


- (IBAction)didTapDonateButton:(id)sender
{
    UCFCreditCardViewController *controller = [[UCFCreditCardViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}


- (IBAction)didTapEmailButton:(id)sender
{
    UCFSendEmailViewController *controller = [[UCFSendEmailViewController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

@end

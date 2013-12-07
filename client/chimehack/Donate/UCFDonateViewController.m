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
//    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];
    

    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _headerLabel.attributedText = [NSAttributedString ucf_trickOrTreatString];
    
    UIImage *thumbImage = [UIImage imageNamed:@"btn-drag-circle"];
    [self.valueSlider setThumbImage:thumbImage forState:UIControlStateNormal];
    [self.valueSlider setThumbImage:thumbImage forState:UIControlStateHighlighted];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)_didTapReloadButton:(id)sender
{
    
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

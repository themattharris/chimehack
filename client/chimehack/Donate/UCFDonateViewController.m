//
//  UCFDonateViewController.m
//  chimehack
//
//  Created by Marc Nijdam on 12/6/13.
//  Copyright (c) 2013 Unicef. All rights reserved.
//

#import "UCFDonateViewController.h"

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didChangeSliderValue:(id)sender {
}


- (IBAction)didTapDonateButton:(id)sender {
}


- (IBAction)didTapEmailButton:(id)sender {
}

@end
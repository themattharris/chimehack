//
//  UCFCreditCardViewController.m
//  chimehack
//
//  Created by Marc Nijdam on 12/7/13.
//  Copyright (c) 2013 Unicef. All rights reserved.
//

#import "UCFCreditCardViewController.h"

@interface UCFCreditCardViewController ()

@end

@implementation UCFCreditCardViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (!self) return nil;
    
    self.title = NSLocalizedString(@"Credit Card", nil);
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem ucf_barButtonItemWithTitle:NSLocalizedString(@"Done", nil) target:self action:@selector(_didTapDoneButton:)];
    self.navigationItem.rightBarButtonItem.enabled = NO;

    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)_didTapDoneButton:(id)sender
{
    
}

@end

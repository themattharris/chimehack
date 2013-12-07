//
//  UCFSettingsViewController.m
//  chimehack
//
//  Created by Marc Nijdam on 12/7/13.
//  Copyright (c) 2013 Unicef. All rights reserved.
//

#import "UCFSettingsViewController.h"

#import "UCFSettings.h"
#import "UCFAppDelegate.h"

@interface UCFSettingsViewController ()

@end

@implementation UCFSettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (!self) return nil;
    
    self.title = NSLocalizedString(@"Settings", nil);
    self.tabBarItem = [UITabBarItem ucf_tabBarItemWithBaseName:@"tabbar-gear" title:self.title];
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didTapSignout:(id)sender
{
    [self sendAction:@selector(signOut)];
}

@end

//
//  UCFMainTabController.m
//  chimehack
//
//  Created by Marc Nijdam on 12/6/13.
//  Copyright (c) 2013 Unicef. All rights reserved.
//

#import "UCFMainTabController.h"

#import "UCFDonateViewController.h"
#import "UCFAchievementsViewController.h"
#import "UCFSettingsViewController.h"

@interface UCFMainTabController () <UITabBarControllerDelegate>

@end

@implementation UCFMainTabController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.delegate = self;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tabBar.barStyle = UIBarStyleDefault;
    self.tabBar.tintColor = [UIColor ucf_orange];
    [self setViewControllers:@[
                               [[UCFAchievementsViewController alloc] init],
                               [[UCFDonateViewController alloc] init],
                               [[UCFSettingsViewController alloc] init],
                               ]];
    
    UIViewController *firstController =self.viewControllers[1];
    self.selectedViewController = firstController;
    self.navigationItem.title = firstController.title;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    self.navigationItem.title = self.selectedViewController.title;
    [self setNeedsStatusBarAppearanceUpdate];
}


@end

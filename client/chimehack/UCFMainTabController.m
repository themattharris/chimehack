//
//  UCFMainTabController.m
//  chimehack
//
//  Created by Marc Nijdam on 12/6/13.
//  Copyright (c) 2013 Unicef. All rights reserved.
//

#import "UCFMainTabController.h"

#import "UCFDonateViewController.h"

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
    [self setViewControllers:@[[[UCFDonateViewController alloc] init]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setViewControllers:(NSArray *)viewControllers animated:(BOOL)animated
{
    [super setViewControllers:viewControllers animated:animated];
    self.navigationItem.title = self.selectedViewController.title;
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    self.navigationItem.title = viewController.title;
}

@end

//
//  UCFAchievementsViewController.m
//  chimehack
//
//  Created by Marc Nijdam on 12/7/13.
//  Copyright (c) 2013 Unicef. All rights reserved.
//

#import "UCFAchievementsViewController.h"

@interface UCFAchievementsViewController ()

@end

@implementation UCFAchievementsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (!self) return nil;
    
    self.title = NSLocalizedString(@"Achievements", nil);
    self.tabBarItem = [UITabBarItem ucf_tabBarItemWithBaseName:@"tabbar-gear" title:self.title];

    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


@end

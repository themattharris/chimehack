//
//  UCFNavigationController.m
//  chimehack
//
//  Created by Marc Nijdam on 12/6/13.
//  Copyright (c) 2013 Unicef All rights reserved.
//

#import "UCFNavigationController.h"

@interface _UCFEmptyViewController : UIViewController

@end

@implementation _UCFEmptyViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"LaunchImage-700-568h@2x" ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.autoresizingMask = UIViewAutoresizingFlexibleWidthAndHeight;
    imageView.contentMode = UIViewContentModeTop;

    imageView.frame = self.view.bounds;
    [self.view addSubview:imageView];
    
    self.view.backgroundColor = RGBX(0xEB7530);
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


@end


@implementation UCFNavigationController

- (id)init
{
    return [super initWithRootViewController:[[_UCFEmptyViewController alloc] init]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationBarHidden = YES;
}

- (UIViewController*)_topVisibleController
{
    if([self.visibleViewController isBeingDismissed]) {
        return self.topViewController;
    } else {
        return self.visibleViewController;
    }
}

- (BOOL)shouldAutorotate
{
    return [[self _topVisibleController] shouldAutorotate];
}

- (NSUInteger)supportedInterfaceOrientations
{
    return [[self _topVisibleController] supportedInterfaceOrientations];
}

- (UIViewController *)childViewControllerForStatusBarStyle
{
	return [self _topVisibleController];
}

- (UIViewController *)childViewControllerForStatusBarHidden
{
    return [self _topVisibleController];
}


@end

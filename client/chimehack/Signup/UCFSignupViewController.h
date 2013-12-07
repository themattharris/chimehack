//
//  UCFSignupViewController.h
//  chimehack
//
//  Created by Marc Nijdam on 12/6/13.
//  Copyright (c) 2013 Unicef. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol UCFSignupViewControllerDelegate;

@interface UCFSignupViewController : UIViewController
@property(nonatomic,weak)id<UCFSignupViewControllerDelegate>delegate;
@end


@protocol UCFSignupViewControllerDelegate <NSObject>

- (void)signupViewControllerDidComplete:(UCFSignupViewController *)controller;

@end
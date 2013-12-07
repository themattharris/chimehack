//
//  UCFSignupViewController.m
//  chimehack
//
//  Created by Marc Nijdam on 12/6/13.
//  Copyright (c) 2013 Unicef. All rights reserved.
//

#import "UCFSignupViewController.h"

@interface UCFSignupViewController () <UITextFieldDelegate>

@end

@implementation UCFSignupViewController
{
    UITextField *_nameTextField;
    UITextField *_emailTextField;
    UIView *_containerView;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (!self) return nil;
    
    self.title = NSLocalizedString(@"Create Account", nil);
    self.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Join", nil) style:UIBarButtonItemStylePlain target:self action:@selector(_didTapJoinButton:)];
    self.navigationItem.rightBarButtonItem.tintColor = [UIColor whiteColor];

    return self;
}

- (UIView *)_mkSeparatorView
{
    UIView *separatorView = [[UIView alloc] initWithFrame:CGRectZero];
    separatorView.backgroundColor = [UIColor blackColor];
    return separatorView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _containerView = [[UIView alloc] initWithFrame:self.view.bounds];
    _containerView.autoresizingMask = UIViewAutoresizingFlexibleWidthAndHeight;
    [self.view addSubview:_containerView];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.textColor = [UIColor ucf_orange];
    titleLabel.font = [UIFont ucf_fontWithSize:28];
    titleLabel.text = NSLocalizedString(@"Welcome!", nil);
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [_containerView ucf_addSubview:titleLabel withConstraints:@{ @"top == ": @{als_view: als_superview, als_constant: @(90)},
                                                            @"centerX ==": als_superview,
                                                            @"width ==": @{als_view: als_superview, als_multiplier: @(0.8)},
                                                           }];

    UILabel *introLabel = [[UILabel alloc] init];
    introLabel.font = [UIFont ucf_fontWithSize:20.0];
    introLabel.textColor = titleLabel.textColor;
    introLabel.textAlignment = titleLabel.textAlignment;
    introLabel.numberOfLines = 0;
    introLabel.text = NSLocalizedString(@"Set up your child's UNICEF account to get started", nil);
    [_containerView ucf_addSubview:introLabel withConstraints:@{ @"top == ": titleLabel.als_bottom,
                                                            @"centerX == ": als_superview,
                                                            @"width == ": @{als_view: als_superview, als_multiplier: @(0.8)},
                                                           }];
    
    UIButton *cameraButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [cameraButton setImage:[UIImage imageNamed:@"img-camera"] forState:UIControlStateNormal];
    [cameraButton addTarget:self action:@selector(_didTapCameraButton:) forControlEvents:UIControlEventTouchUpInside];
    [_containerView ucf_addSubview:cameraButton withConstraints:@{ @"top == ": @{als_view: introLabel.als_bottom, als_constant: @30},
                                                              @"centerX == ": als_superview,
                                                             }];
    
    NSDictionary *attributes = @{ NSFontAttributeName: [UIFont ucf_fontWithSize:20],
                                  NSForegroundColorAttributeName: [UIColor blackColor]};
    _nameTextField = [[UITextField alloc] initWithFrame:CGRectZero];
    _nameTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:NSLocalizedString(@"Child's Name", nil) attributes:attributes];
    
    _nameTextField.textColor = [UIColor blackColor];
    _nameTextField.font = [UIFont ucf_fontWithSize:20];
    _nameTextField.delegate = self;
    [_containerView ucf_addSubview:_nameTextField withConstraints:@{ @"top == ": @{als_view: cameraButton.als_bottom, als_constant: @30},
                                                                @"width == ": @{als_view:als_superview, als_constant: @(-40)},
                                                                @"centerX ==": als_superview,
                                                               }];
    [_containerView ucf_addSubview:[self _mkSeparatorView] withConstraints:@{ @"width == ": _nameTextField.als_width,
                                                                         @"height ==": @1,
                                                                         @"centerX ==": als_superview,
                                                                         @"top ==": @{als_view: _nameTextField.als_bottom, als_constant: @10},
                                                                         }];
    
    _emailTextField = [[UITextField alloc] initWithFrame:CGRectZero];
    _emailTextField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:NSLocalizedString(@"Parent's Email", nil) attributes:attributes];
    _emailTextField.textColor = _nameTextField.textColor;
    _emailTextField.font = _nameTextField.font;
    _emailTextField.delegate = self;

    [_containerView ucf_addSubview:_emailTextField withConstraints:@{ @"top == ": @{als_view: _nameTextField.als_bottom, als_constant: @30},
                                                                @"width == ": @{als_view:als_superview, als_constant: @(-40)},
                                                                @"centerX ==": als_superview,
                                                                }];
    [_containerView ucf_addSubview:[self _mkSeparatorView] withConstraints:@{ @"width == ": _nameTextField.als_width,
                                                                         @"height ==": @1,
                                                                         @"centerX ==": als_superview,
                                                                         @"top == ": @{als_view: _emailTextField.als_bottom, als_constant: @10},
                                                                         }];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willShowKeyboard:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willHideKeyboard:) name:UIKeyboardWillHideNotification object:nil];
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}


- (void)_didTapCameraButton:(id)sender
{
    
}

- (void)_didTapJoinButton:(id)sender
{
    [_delegate signupViewControllerDidComplete:self];
}

- (void)willShowKeyboard:(NSNotification *)notification
{
    CGFloat duration = [[[notification userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    [UIView animateWithDuration:duration animations:^{
        _containerView.transform = CGAffineTransformMakeTranslation(0, -100);
    }];
}

- (void)willHideKeyboard:(NSNotification *)notification
{
    
    CGFloat duration = [[[notification userInfo] objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        _containerView.transform = CGAffineTransformIdentity;
    } completion:NULL];
}


@end

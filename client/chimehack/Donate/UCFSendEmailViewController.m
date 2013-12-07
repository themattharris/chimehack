//
//  UCFSendEmailViewController.m
//  chimehack
//
//  Created by Marc Nijdam on 12/7/13.
//  Copyright (c) 2013 Unicef. All rights reserved.
//

#import "UCFSendEmailViewController.h"

@interface UCFSendEmailViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *headerLabel;
@property (weak, nonatomic) IBOutlet UCFUnderlinedTextField *emailTextField;
@property (weak, nonatomic) IBOutlet UCFUnderlinedTextField *phoneTextField;

@end

@implementation UCFSendEmailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (!self) return nil;

    self.title = NSLocalizedString(@"Email", nil);
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem ucf_barButtonItemWithTitle:NSLocalizedString(@"Send", nil) target:self action:@selector(_didTapSendButton:)];
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _headerLabel.attributedText = [NSAttributedString ucf_trickOrTreatString];
    
    _emailTextField.textField.delegate = self;
    [_emailTextField setPlaceholderText:NSLocalizedString(@"Your Email", nil)];

    _phoneTextField.textField.delegate = self;
    [_phoneTextField setPlaceholderText:NSLocalizedString(@"Phone to receive text", nil)];
    
    self.navigationItem.rightBarButtonItem.enabled = NO;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField == _phoneTextField.textField) {
        textField.keyboardType = UIKeyboardTypePhonePad;
    } else if (textField == _emailTextField.textField) {
        textField.keyboardType = UIKeyboardTypeEmailAddress;
    }
    
    [textField reloadInputViews];
}


- (void)_didTapSendButton:(id)sender
{
    
}

@end

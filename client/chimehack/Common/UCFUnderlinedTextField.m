//
//  UCFUnderlinedTextView.m
//  chimehack
//
//  Created by Marc Nijdam on 12/7/13.
//  Copyright (c) 2013 Unicef. All rights reserved.
//

#import "UCFUnderlinedTextField.h"

@implementation UCFUnderlinedTextField

- (void)_setup
{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    
    _textField = [[UITextField alloc] initWithFrame:CGRectZero];
    _textField.textColor = [UIColor blackColor];
    _textField.autoresizingMask = UIViewAutoresizingFlexibleWidthAndHeight;
    [self ucf_addSubview:_textField withConstraints:@{
                                                      @"top == ": als_superview,
                                                      @"centerX == ": als_superview,
                                                      @"height == ": @{als_view: als_superview, als_constant: @(-10)},
                                                      @"width == ": @{als_view: als_superview, als_constant: @(-10)},
                                                      }];
    
    UIView *separatorView = [[UIView alloc] initWithFrame:CGRectZero];
    separatorView.backgroundColor = [UIColor blackColor];
    [self ucf_addSubview:separatorView withConstraints:@{
                                                         @"centerX == ": als_superview,
                                                         @"width == ": als_superview,
                                                         @"height == ": @1,
                                                         @"bottom == ": als_superview,
                                                         }];
    
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (!self) return nil;
    
    [self _setup];
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (!self) return nil;
    
    [self _setup];
    
    return self;
}

- (void)setPlaceholderText:(NSString *)text
{
    NSDictionary *attributes = @{ NSFontAttributeName: [UIFont ucf_fontWithSize:20],
                                  NSForegroundColorAttributeName: [UIColor blackColor]};
    _textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:text attributes:attributes];
    [self setNeedsLayout];
}

@end

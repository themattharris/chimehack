//
//  UCFAchievementButton.m
//  chimehack
//
//  Created by Marc Nijdam on 12/7/13.
//  Copyright (c) 2013 Unicef. All rights reserved.
//

#import "UCFAchievementButton.h"
#import <MNColorKit/MNColorKit.h>

@implementation UCFAchievementButton


- (void)_setup
{
    _amountLabel = [[UILabel alloc] initWithFrame:self.bounds];
    _amountLabel.textColor = [UIColor whiteColor];
    _amountLabel.font = [UIFont ucf_boldFontWithSize:30];
    _amountLabel.textAlignment = NSTextAlignmentCenter;
    
    [self ucf_addSubview:_amountLabel withConstraints:@{ @"width == ": als_superview,
                                                         @"height == ": als_superview,
                                                         @"centerY == ": @{als_view:als_superview, als_constant:@(-6)},
                                                         @"centerX == ": als_superview,
                                                        }];
    
    _amountLabel.highlightedTextColor = [UIColor colorWithWhite:1.0 alpha:0.3];
    
    UIImage *backgroundImage = [UIImage mn_imageWithColor:self.backgroundColor];
    [self setBackgroundImage:backgroundImage forState:UIControlStateNormal];
    
    [self setTitleEdgeInsets:UIEdgeInsetsMake(36, 0, 0, 0)];
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

- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    [_amountLabel setHighlighted:highlighted];
}


@end

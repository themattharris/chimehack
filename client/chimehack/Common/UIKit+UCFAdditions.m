//
//  UIKit+UCFAdditions.m
//  chimehack
//
//  Created by Marc Nijdam on 12/6/13.
//  Copyright (c) 2013 Unicef. All rights reserved.
//

#import "UIKit+UCFAdditions.h"

#import <MNColorKit/MNColorKit.h>

@implementation UIView (UCFAdditions)

- (void)ucf_addSubview:(UIView *)view withConstraints:(NSDictionary *)constraints
{
    view.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:view];
    [view als_addConstraints:constraints];
}



@end

@implementation UIFont (UCFAdditions)

+ (UIFont *)ucf_fontWithSize:(CGFloat)fontSize
{
    return [UIFont fontWithName:@"HelveticaNeue-Light" size:fontSize];
}

+ (UIFont *)ucf_regularFontWithSize:(CGFloat)fontSize
{
    return [UIFont fontWithName:@"HelveticaNeue" size:fontSize];
}

+ (UIFont *)ucf_mediumFontWithSize:(CGFloat)fontSize
{
    return [UIFont fontWithName:@"HelveticaNeue-Medium" size:fontSize];
}

+ (UIFont *)ucf_boldFontWithSize:(CGFloat)fontSize
{
    return [UIFont fontWithName:@"HelveticaNeue-Bold" size:fontSize];
}


@end

@implementation UIColor (UCFAdditions)

+ (UIColor *)ucf_orange
{
    return RGBX(0xEB7530);
}

@end

@implementation UIViewController (UCFAdditions)

- (CGRect)ucf_frameForView:(UIView *)view givenKeyboardFrame:(CGRect)keyboardFrame;
{
    keyboardFrame = [view.superview convertRect:keyboardFrame fromView:nil];
    CGRect viewRect = view.frame;
    viewRect.size.height = MAX(0, CGRectGetMinY(keyboardFrame) - CGRectGetMinY(viewRect));
    return viewRect;
}

@end

@implementation UITabBarItem (UCFAdditions)

+ (UITabBarItem *)ucf_tabBarItemWithBaseName:(NSString *)baseName title:(NSString *)title
{
    UIImage *offImage = [UIImage imageNamed:[baseName stringByAppendingString:@"-off"]];
    UIImage *onImage = [UIImage imageNamed:[baseName stringByAppendingString:@"-on"]];
    return [[UITabBarItem alloc] initWithTitle:title image:offImage selectedImage:onImage];
}

@end

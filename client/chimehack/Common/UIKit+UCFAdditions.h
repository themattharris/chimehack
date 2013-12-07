//
//  UIKit+UCFAdditions.h
//  chimehack
//
//  Created by Marc Nijdam on 12/6/13.
//  Copyright (c) 2013 Unicef. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AutoLayoutShorthand/AutoLayoutShorthand.h>
#import <UIResponder+MNActions/UIResponder+MNActions.h>

#import "UCFUnderlinedTextField.h"

@interface UIView (UCFAdditions)

- (void)ucf_addSubview:(UIView *)view withConstraints:(NSDictionary *)constraints;

@end

@interface UIFont (UCFAdditions)

+ (UIFont *)ucf_fontWithSize:(CGFloat)size;
+ (UIFont *)ucf_regularFontWithSize:(CGFloat)fontSize;
+ (UIFont *)ucf_mediumFontWithSize:(CGFloat)fontSize;
+ (UIFont *)ucf_boldFontWithSize:(CGFloat)fontSize;

@end


@interface UIColor (UCFAdditions)
+ (UIColor *)ucf_orange;
@end

@interface UIViewController (UCFAdditions)

- (CGRect)ucf_frameForView:(UIView *)view givenKeyboardFrame:(CGRect)keyboardFrame;
- (void)ucf_presentErrorMessage:(NSString *)message;

@end

@interface UITabBarItem (UCFAdditions)

+ (UITabBarItem *)ucf_tabBarItemWithBaseName:(NSString *)baseName title:(NSString *)title;

@end

@interface UIBarButtonItem (UCFAdditions)
+ (UIBarButtonItem *)ucf_barButtonItemWithTitle:(NSString *)title target:(id)target action:(SEL)action;
@end

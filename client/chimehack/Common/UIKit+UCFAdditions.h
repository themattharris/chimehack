//
//  UIKit+UCFAdditions.h
//  chimehack
//
//  Created by Marc Nijdam on 12/6/13.
//  Copyright (c) 2013 Unicef. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AutoLayoutShorthand/AutoLayoutShorthand.h>

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

@end

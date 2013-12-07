//
//  UCFUnderlinedTextView.h
//  chimehack
//
//  Created by Marc Nijdam on 12/7/13.
//  Copyright (c) 2013 Unicef. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UCFUnderlinedTextField : UIView
@property(nonatomic,readonly)UITextField *textField;

- (void)setPlaceholderText:(NSString *)text;
@end

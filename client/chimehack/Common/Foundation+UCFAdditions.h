//
//  NSAttributedString+UCFAdditions.h
//  chimehack
//
//  Created by Marc Nijdam on 12/7/13.
//  Copyright (c) 2013 Unicef. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (UCFAdditions)

- (BOOL)ucf_isValidEmailAddress;

@end

@interface NSAttributedString (UCFAdditions)

+ (NSAttributedString *)ucf_trickOrTreatString;

@end

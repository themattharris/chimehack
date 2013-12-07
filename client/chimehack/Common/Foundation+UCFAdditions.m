//
//  NSAttributedString+UCFAdditions.m
//  chimehack
//
//  Created by Marc Nijdam on 12/7/13.
//  Copyright (c) 2013 Unicef. All rights reserved.
//

#import "Foundation+UCFAdditions.h"

@implementation NSAttributedString (UCFAdditions)

+ (NSAttributedString *)ucf_trickOrTreatString
{
    NSString *baseString = NSLocalizedString(@"Trick or Treat for ", nil);
    NSDictionary *attributes = @{ NSForegroundColorAttributeName : [UIColor ucf_orange],
                                  NSFontAttributeName : [UIFont ucf_fontWithSize:20],
                                  };
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:baseString attributes:attributes];
    NSTextAttachment *imageAttachment = [[NSTextAttachment alloc] init];
    imageAttachment.image = [UIImage imageNamed:@"logo-unicef"];
    imageAttachment.bounds = CGRectMake(0, -3, imageAttachment.image.size.width, imageAttachment.image.size.height);
    [string appendAttributedString:[NSAttributedString attributedStringWithAttachment:imageAttachment]];
    
    return string;
}


@end

//
//  UCFService.h
//  chimehack
//
//  Created by Marc Nijdam on 12/7/13.
//  Copyright (c) 2013 Unicef. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^UCFServiceCompletionBlock)(id result, NSError *error);

@interface UCFService : NSObject

+ (instancetype)sharedInstance;

- (void)signupWithName:(NSString *)name email:(NSString *)email completion:(UCFServiceCompletionBlock)completion;
- (void)fetchDonationsByReferer:(id)referredId completion:(UCFServiceCompletionBlock)completion;

@end

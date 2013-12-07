//
//  UCFSettings.h
//  chimehack
//
//  Created by Marc Nijdam on 12/6/13.
//  Copyright (c) 2013 Unicef. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UCFSettings : NSObject

+ (instancetype)sharedInstace;

@property(nonatomic)NSString *signedInUserId;

@end

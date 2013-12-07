//
//  UCFSettings.m
//  chimehack
//
//  Created by Marc Nijdam on 12/6/13.
//  Copyright (c) 2013 Unicef. All rights reserved.
//

#import "UCFSettings.h"

static NSString * const kUCFSettingSignedInUserId = @"user_id";
static NSString * const kUCFSettingSignedInUserName = @"user_name";

@implementation UCFSettings
{
    NSUserDefaults *_defaults;
}

+ (instancetype)sharedInstace
{
    static UCFSettings *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[UCFSettings alloc] init];
    });
    return _sharedInstance;
}

- (id)init
{
    self = [super init];
    if (!self) return nil;
    
    _defaults = [NSUserDefaults standardUserDefaults];
    
    return self;
}

- (void)_setDefault:(NSString *)value forKey:(NSString *)key
{
    [_defaults setObject:value forKey:key];
    [_defaults synchronize];
}

- (NSString *)signedInUserId
{
    return [_defaults stringForKey:kUCFSettingSignedInUserId];
}

- (void)setSignedInUserId:(NSString *)signedInUserId
{
    [self _setDefault:signedInUserId forKey:kUCFSettingSignedInUserId];
}

- (NSString *)signedInUserName
{
    return [_defaults stringForKey:kUCFSettingSignedInUserName];
}

- (void)setSignedInUserName:(NSString *)signedInUserName
{
    [self _setDefault:signedInUserName forKey:kUCFSettingSignedInUserName];
}

- (void)signOut
{
    [_defaults removeObjectForKey:kUCFSettingSignedInUserId];
    [_defaults removeObjectForKey:kUCFSettingSignedInUserName];
}


@end

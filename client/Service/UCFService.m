//
//  UCFService.m
//  chimehack
//
//  Created by Marc Nijdam on 12/7/13.
//  Copyright (c) 2013 Unicef. All rights reserved.
//

#import "UCFService.h"
#import "UCFSettings.h"

#import <AFNetworking/AFNetworking.h>

@implementation UCFService
{
    AFHTTPRequestOperationManager *_httpManager;
}

+ (instancetype)sharedInstance
{
    static UCFService *_sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[UCFService alloc] init];
    });
    return _sharedInstance;
}

- (id)init
{
    self = [super init];
    if (!self) return nil;
    
    NSURL *baseURL = [NSURL URLWithString: @"http://chimehack.tokofu.net"];
    _httpManager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:baseURL];
    
    return self;
}

- (void)_performPost:(NSString *)path paramters:(NSDictionary *)parameters completion:(UCFServiceCompletionBlock)completion
{
    [_httpManager POST:path parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (completion) completion(responseObject, nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (completion) completion(nil, error);
    }];
}

- (void)_performGet:(NSString *)path paramters:(NSDictionary *)parameters completion:(UCFServiceCompletionBlock)completion
{
    [[AFHTTPRequestOperationManager manager] GET:path parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        if (completion) completion(responseObject, nil);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        if (completion) completion(nil, error);
    }];
}

- (void)signupWithName:(NSString *)name email:(NSString *)email completion:(UCFServiceCompletionBlock)completion
{
    NSDictionary *parameters = @{
                                 @"name": name,
                                 @"email": email
                                 };
    [self _performPost:@"api/user.json" paramters:parameters completion:^(id result, NSError *error) {
        if (result) {
            NSString *userId = result[@"id"];
            if (userId) {
                [[UCFSettings sharedInstace] setSignedInUserId:userId];
            }
        }
        if (completion) completion(result, error);
    }];
}


@end
//
//  Client.h
//  Wattpad-app
//
//  Created by Jean Vinge on 24/08/15.
//  Copyright (c) 2015 Jean Vinge. All rights reserved.
//

#import <AFNetworking/AFHTTPRequestOperationManager.h>

@interface Client : AFHTTPRequestOperationManager

+ (instancetype)sharedInstance;

- (void)testsWithSuccess:(void (^)(NSString *name))success failure:(void(^)(NSError *error))failure;
@end

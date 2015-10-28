//
//  Client.m
//  Wattpad-app
//
//  Created by Jean Vinge on 24/08/15.
//  Copyright (c) 2015 Jean Vinge. All rights reserved.
//

#import "Client.h"
#import "Constants.h"

@implementation Client

+ (instancetype)sharedInstance {
    static Client *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        NSString *apiBaseUrl = kAPIBase;
        _sharedInstance = [[self alloc] initWithBaseURL:[NSURL URLWithString:apiBaseUrl]];
        _sharedInstance.requestSerializer = [AFJSONRequestSerializer serializer];
        _sharedInstance.responseSerializer = [AFJSONResponseSerializer serializer];
        _sharedInstance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html", nil];
        
        [_sharedInstance.reachabilityManager startMonitoring];
        
    });

    return _sharedInstance;
}

- (void)testsWithSuccess:(void (^)(NSString *name))success failure:(void(^)(NSError *error))failure {
    [self GET:kPathTest parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
         NSString *output = [NSString stringWithFormat:@"JSON: %@", responseObject];
        success(output);
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        failure(error);
    }];
}

@end

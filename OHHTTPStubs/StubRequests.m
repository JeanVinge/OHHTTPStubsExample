//
//  StubRequests.m
//  OHHTTPStubs
//
//  Created by Jean Vinge on 27/10/15.
//  Copyright © 2015 Jean Vinge. All rights reserved.
//

#import "StubRequests.h"
#import <OHHTTPStubs.h>
#import <OHHTTPStubs/OHPathHelpers.h>
#import "Constants.h"

@implementation StubRequests

+ (void)mockTest {
    [OHHTTPStubs stubRequestsPassingTest:^BOOL(NSURLRequest *request) {
        
        NSString *requestPath = [[request URL] absoluteString];
        return [requestPath isEqualToString:[NSString stringWithFormat:@"%@/%@", kAPIBase, kPathTest]];
        
    } withStubResponse:^OHHTTPStubsResponse*(NSURLRequest *request) {
        
        // Stub it with our "wsresponse.json" stub file (which is in same bundle as self)
        return [OHHTTPStubsResponse responseWithFileAtPath:OHPathForFile(@"test.json", self.class)
                                                statusCode:200 headers:@{@"Content-Type":@"application/json"}];
    }];
}

@end

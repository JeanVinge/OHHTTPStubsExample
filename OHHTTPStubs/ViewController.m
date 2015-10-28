//
//  ViewController.m
//  OHHTTPStubs
//
//  Created by Jean Vinge on 27/10/15.
//  Copyright © 2015 Jean Vinge. All rights reserved.
//

#import "ViewController.h"
#import "Client.h"
#import "StubRequests.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [StubRequests mockTest];
    [[Client sharedInstance] testsWithSuccess:^(NSString *name) {
        //
    } failure:^(NSError *error) {
        //
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

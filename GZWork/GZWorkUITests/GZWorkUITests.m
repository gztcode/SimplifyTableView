//
//  GZWorkUITests.m
//  GZWorkUITests
//
//  Created by Tim on 2018/3/13.
//  Copyright © 2018年 tim. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "GZWorkUITests-Swift.h"
@interface GZWorkUITests : XCTestCase

@end

@implementation GZWorkUITests


- (void)testExample {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [Snapshot setupSnapshot:app];
    [app launch];
    [app.buttons[@"next"] tap];
    [Snapshot snapshot:@"01LoginScreen" timeWaitingForIdle:10];
    
    [app.buttons[@"back"] tap];
    [Snapshot snapshot:@"02secondPage" timeWaitingForIdle:10];
    
}

@end

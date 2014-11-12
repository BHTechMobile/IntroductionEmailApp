//
//  Contacts_Test.m
//  Copyright (c) 2014 BHTech Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Contacts.h"

@interface Contacts_Test : XCTestCase

@end

@implementation Contacts_Test

- (void)setUp {
    [super setUp];

    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCase01 {
    // This is an example of a functional test case.
    Contacts * contact = [[Contacts alloc] init];
    NSLog(@"%@",contact.contacts);
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end

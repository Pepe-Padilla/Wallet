//
//  MXWDollarTest.m
//  Wallet
//
//  Created by Pepe Padilla on 15/01/06.
//  Copyright (c) 2015 maxeiware. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "MXWDollar.h"

@interface MXWDollarTest : XCTestCase

@end

@implementation MXWDollarTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void) testMultiplicacition {
    MXWDollar * five = [[MXWDollar alloc] initWithAmount: 5];
    MXWDollar * x = [five times:2];
    
    XCTAssertEqualObjects(x, [[MXWDollar alloc] initWithAmount:10]);
}


- (void) testEquality {
    MXWDollar * five = [[MXWDollar alloc] initWithAmount: 5];
    MXWDollar * otherfive = [[MXWDollar alloc] initWithAmount: 5];
    
    XCTAssertEqualObjects(five, otherfive);
    
    MXWDollar * seven = [[MXWDollar alloc] initWithAmount: 7];
    
    XCTAssertNotEqual(five, seven);
}

@end

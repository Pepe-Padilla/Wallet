//
//  MXWDollarTest.m
//  Wallet
//
//  Created by Pepe Padilla on 15/01/06.
//  Copyright (c) 2015 maxeiware. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "MXWMoney.h"

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
    MXWMoney * five = [MXWMoney dollarWithAmount:5];
    MXWMoney * x = [five times:2];
    
    XCTAssertEqualObjects(x, [MXWMoney dollarWithAmount:10]);
}


- (void) testEquality {
    MXWMoney * five = [MXWMoney dollarWithAmount:5];
    MXWMoney * otherfive = [MXWMoney dollarWithAmount:5];
    
    XCTAssertEqualObjects(five, otherfive);
    
    MXWMoney * seven = [MXWMoney dollarWithAmount:7];
    
    XCTAssertNotEqual(five, seven);
}

@end

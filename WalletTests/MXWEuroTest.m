//
//  MXWEuroTest.m
//  Wallet
//
//  Created by Pepe Padilla on 15/01/06.
//  Copyright (c) 2015 maxeiware. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "MXWEuro.h"

@interface MXWEuroTest : XCTestCase

@end

@implementation MXWEuroTest

- (void)setUp {
    [super setUp];
    // creo el entorno
}

- (void)tearDown {
    // me cargo el entorno
    [super tearDown];
}

- (void) testMultiplicacition {
    MXWEuro * five = [[MXWEuro alloc] initWithAmount: 5];
    MXWEuro * x = [five times:2];
    
    XCTAssertEqualObjects(x, [[MXWEuro alloc] initWithAmount:10]);
}


- (void) testEquality {
    MXWEuro * five = [[MXWEuro alloc] initWithAmount: 5];
    MXWEuro * otherfive = [[MXWEuro alloc] initWithAmount: 5];
    
    XCTAssertEqualObjects(five, otherfive);
    
    MXWEuro * seven = [[MXWEuro alloc] initWithAmount: 7];
    
    XCTAssertNotEqual(five, seven);
}





/*- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}*/

@end

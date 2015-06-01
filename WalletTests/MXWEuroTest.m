//
//  MXWEuroTest.m
//  Wallet
//
//  Created by Pepe Padilla on 15/01/06.
//  Copyright (c) 2015 maxeiware. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "MXWMoney.h"

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
    MXWMoney * five = [MXWMoney euroWithAmount:5];
    MXWMoney * x = [five times:2];
    
    XCTAssertEqualObjects(x, [MXWMoney euroWithAmount:10]);
}


- (void) testEquality {
    MXWMoney * five = [MXWMoney euroWithAmount:5];
    MXWMoney * otherfive = [MXWMoney euroWithAmount:5];
    
    XCTAssertEqualObjects(five, otherfive);
    
    MXWMoney * seven = [MXWMoney euroWithAmount:7];
    
    XCTAssertNotEqual(five, seven);
}





/*- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}*/

@end

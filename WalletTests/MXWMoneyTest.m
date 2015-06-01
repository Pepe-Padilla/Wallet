//
//  MXWMoneyTest.m
//  Wallet
//
//  Created by Pepe Padilla on 15/01/06.
//  Copyright (c) 2015 maxeiware. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "MXWMoney.h"

@interface MXWMoneyTest : XCTestCase

@end

@implementation MXWMoneyTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void) testException {
    
    XCTAssertNoThrow([[MXWMoney alloc] initWithAmount: 5]);
    
}

@end

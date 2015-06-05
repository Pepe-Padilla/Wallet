//
//  MXWWalletTest.m
//  Wallet
//
//  Created by Pepe Padilla on 15/05/06.
//  Copyright (c) 2015 maxeiware. All rights reserved.
//

@import Foundation;
#import <XCTest/XCTest.h>
#import "MXWWallet.h"
#import "MXWMoney.h"

@interface MXWWalletTest : XCTestCase

@end

@implementation MXWWalletTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testAddMoney {
    MXWWallet * aWallet = [MXWWallet new];
    MXWMoney * someEuros = [MXWMoney euroWithAmount:@(10.0)];
    MXWMoney * someDollars = [MXWMoney dollarWithAmount:@(5.0)];
    
    [aWallet addMoney:someEuros];
    
    XCTAssertEqual(aWallet.monies.count, 1);
    
    [aWallet addMoney:someDollars];
    
    XCTAssertEqual(aWallet.monies.count, 2);
    
    XCTAssertEqualObjects(someEuros, [aWallet.monies objectAtIndex:0]);
    XCTAssertEqualObjects(someDollars, [aWallet.monies objectAtIndex:1]);
}

-(void) testTakeMoney {
    MXWWallet * aWallet = [MXWWallet new];
    MXWMoney * someEuros = [MXWMoney euroWithAmount:@(10.0)];
    MXWMoney * someDollars = [MXWMoney dollarWithAmount:@(5.0)];
    
    [aWallet addMoney:someEuros];
    
    XCTAssertEqual(aWallet.monies.count, 1);
    
    [aWallet addMoney:someDollars];
    
    XCTAssertEqual(aWallet.monies.count, 2);
    
    MXWMoney* takenDollar = [aWallet takeMoneyAtIndex:1];
    
    XCTAssertEqual(aWallet.monies.count, 1);
    
    MXWMoney* takenEuro = [aWallet takeMoneyAtIndex:0];
    
    XCTAssertEqual(aWallet.monies.count, 0);
    
    XCTAssertEqualObjects(someEuros, takenEuro);
    XCTAssertEqualObjects(someDollars, takenDollar);
}

@end

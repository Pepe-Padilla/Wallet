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
#import "MXWBroker.h"

@interface MXWWalletTest : XCTestCase

@property (strong, nonatomic) MXWBroker * aBroker;

@end

@implementation MXWWalletTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    self.aBroker = [MXWBroker new];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    self.aBroker = nil;
    
    
    [super tearDown];
}

- (void)testAddMoney {
    MXWWallet * aWallet = [MXWWallet new];
    MXWMoney * someEuros = [MXWMoney euroWithAmount:@(10.0)];
    MXWMoney * someDollars = [MXWMoney dollarWithAmount:@(5.0)];
    
    [aWallet addMoney:someEuros];
    
    XCTAssertEqual([aWallet walletSections].count, 1);
    XCTAssertEqual([aWallet moniesForCurrency:@"EUR"], 1);
    XCTAssertEqual([aWallet moniesForCurrency:@"USD"], 0);
    
    [aWallet addMoney:someDollars];
    
    XCTAssertEqual([aWallet walletSections].count, 2);
    XCTAssertEqual([aWallet moniesForCurrency:@"USD"], 1);
    
    XCTAssertEqualObjects(someEuros, [aWallet moneyForCurrency:@"EUR" atIndex:0]);
    XCTAssertEqualObjects(someDollars, [aWallet moneyForCurrency:@"USD" atIndex:0]);
}

-(void) testTakeMoney {
    MXWWallet * aWallet = [MXWWallet new];
    MXWMoney * someEuros = [MXWMoney euroWithAmount:@(10.0)];
    MXWMoney * someDollars = [MXWMoney dollarWithAmount:@(5.0)];
    
    [aWallet addMoney:someEuros];
    
    XCTAssertEqual([aWallet walletSections].count, 1);
    
    [aWallet addMoney:someDollars];
    
    XCTAssertEqual([aWallet walletSections].count, 2);
    
    MXWMoney* takenDollar = [aWallet takeMoneyForCurrency:@"USD" atIndex:0];
    
    XCTAssertEqual([aWallet walletSections].count, 1);
    
    MXWMoney* takenEuro = [aWallet takeMoneyForCurrency:@"EUR" atIndex:0];
    
    XCTAssertEqual([aWallet walletSections].count, 0);
    
    XCTAssertEqualObjects(someEuros, takenEuro);
    XCTAssertEqualObjects(someDollars, takenDollar);
}

-(void) testSumTotal {
    
    [self.aBroker addRate:@(2.0) fromCurrency:@"EUR" toCurrency:@"USD"];
    
    MXWWallet * aWallet = [MXWWallet new];
    MXWMoney * someEuros = [MXWMoney euroWithAmount:@(2.0)];
    MXWMoney * otherEuros = [MXWMoney euroWithAmount:@(8.0)];
    
    MXWMoney * someDollars = [MXWMoney dollarWithAmount:@(4.0)];
    MXWMoney * otherDollars = [MXWMoney dollarWithAmount:@(11.0)];
    
    [aWallet addMoney:someEuros];
    [aWallet addMoney:someDollars];
    
    [aWallet addMoney:otherEuros];
    [aWallet addMoney:otherDollars];
    
    MXWMoney * granTotal = [aWallet sumTotalWithCurrency:@"EUR" andBroker:self.aBroker];
    
    XCTAssertEqualObjects([MXWMoney euroWithAmount: @(17.5)], granTotal);
    
    
}

-(void) testSubTotalForCurrency {
    
    
    MXWWallet * aWallet = [MXWWallet new];
    MXWMoney * someEuros = [MXWMoney euroWithAmount:@(2.0)];
    MXWMoney * otherEuros = [MXWMoney euroWithAmount:@(8.0)];
    
    MXWMoney * someDollars = [MXWMoney dollarWithAmount:@(4.0)];
    MXWMoney * otherDollars = [MXWMoney dollarWithAmount:@(11.0)];
    
    [aWallet addMoney:someEuros];
    [aWallet addMoney:someDollars];
    
    XCTAssertEqualObjects([MXWMoney euroWithAmount: @(2.0)], [aWallet subTotalForcurrency:@"EUR"]);
    XCTAssertEqualObjects([MXWMoney dollarWithAmount: @(4.0)], [aWallet subTotalForcurrency:@"USD"]);
    
    [aWallet addMoney:otherEuros];
    [aWallet addMoney:otherDollars];
    
    XCTAssertEqualObjects([MXWMoney euroWithAmount: @(10.0)], [aWallet subTotalForcurrency:@"EUR"]);
    XCTAssertEqualObjects([MXWMoney dollarWithAmount: @(15.0)], [aWallet subTotalForcurrency:@"USD"]);
    
    
}

@end

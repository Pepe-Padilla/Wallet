//
//  MXWBrokerTest.m
//  Wallet
//
//  Created by Pepe Padilla on 15/05/06.
//  Copyright (c) 2015 maxeiware. All rights reserved.
//

@import Foundation;
#import <XCTest/XCTest.h>
#import "MXWMoney.h"
#import "MXWBroker.h"

@interface MXWBrokerTest : XCTestCase

@property (strong, nonatomic) MXWBroker * aBroker;

@end

@implementation MXWBrokerTest

- (void)setUp {
    [super setUp];
    
    self.aBroker = [MXWBroker new];
}

- (void)tearDown {
    self.aBroker = nil;
    
    [super tearDown];
}

- (void) testReduceSameCurrency {
    
    MXWMoney * anEuro = [MXWMoney euroWithAmount:@(2.0)];
    XCTAssertEqualObjects([self.aBroker reduce:anEuro toCurrency:@"EUR"], [MXWMoney euroWithAmount:@(2.0)]);

}

- (void) testExceptionOnRateZero {
    XCTAssertThrows([self.aBroker addRate:@(0) fromCurrency:@"EUR" toCurrency:@"USD"]);
}

- (void) testExceptionEmptyRate{
    
    MXWMoney * anEuro = [MXWMoney euroWithAmount:@(2.0)];
    
    XCTAssertThrows([self.aBroker reduce:anEuro toCurrency:@"USD"]);
    
}


- (void) testAddRateReduce{
    
    [self.aBroker addRate:@(2.0) fromCurrency:@"EUR" toCurrency:@"USD"];
    
    MXWMoney * anEuro = [MXWMoney euroWithAmount:@(2.0)];
    
    MXWMoney * toDollars = [self.aBroker reduce:anEuro toCurrency:@"USD"];
    
    XCTAssertEqualObjects(toDollars, [MXWMoney dollarWithAmount:@(4.0)]);
    XCTAssertEqualObjects([self.aBroker reduce:toDollars toCurrency:@"EUR"], [MXWMoney euroWithAmount:@(2.0)]);
}

-(void) testAddDiferentCurrency {
    [self.aBroker addRate:@(2.0) fromCurrency:@"EUR" toCurrency:@"USD"];
    
    MXWMoney * euro2 = [MXWMoney euroWithAmount:@(2.0)];
    MXWMoney * dollar4 = [MXWMoney dollarWithAmount:@(4.0)];
    
    MXWMoney * euroSum = [euro2 add:dollar4 withBroker:self.aBroker];
    
    XCTAssertEqualObjects([MXWMoney euroWithAmount: @(4.0)], euroSum);
}




@end

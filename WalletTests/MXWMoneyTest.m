//
//  MXWMoneyTest.m
//  Wallet
//
//  Created by Pepe Padilla on 15/01/06.
//  Copyright (c) 2015 maxeiware. All rights reserved.
//

@import Foundation;
#import <XCTest/XCTest.h>
#import "MXWMoney.h"
#import "MXWBroker.h"

@interface MXWMoneyTest : XCTestCase

@property (strong, nonatomic) MXWBroker * aBroker;

@end

@implementation MXWMoneyTest

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


- (void) testMultiplicacition {
    MXWMoney * five = [MXWMoney dollarWithAmount:@(5.0)];
    MXWMoney * x = [five times:@(2.0)];
    
    XCTAssertEqualObjects(x, [MXWMoney dollarWithAmount:@(10.0)]);
}


- (void) testEquality {
    MXWMoney * five = [MXWMoney dollarWithAmount:@(5.0)];
    MXWMoney * otherfive = [MXWMoney dollarWithAmount:@(5.0)];
    
    XCTAssertEqualObjects(five, otherfive);
    
    MXWMoney * seven = [MXWMoney dollarWithAmount:@(7.0)];
    
    XCTAssertNotEqual(five, seven);
}

- (void) testException {
    
    XCTAssertNoThrow([[MXWMoney alloc] initWithAmount:@(5.0) currency:@"NMX"]);
    
}

- (void) testCurrencyWithEquality {
    MXWMoney * dollars = [MXWMoney dollarWithAmount: @(1.0)];
    MXWMoney * euros = [MXWMoney euroWithAmount: @(1.0)];
    
    XCTAssertEqualObjects([MXWMoney dollarWithAmount: @(1.0)], dollars);
    XCTAssertNotEqualObjects(dollars, euros);

}

-(void) testCurrencyProperty{
    
    MXWMoney *dollars = [MXWMoney dollarWithAmount:@(1.0)];
    XCTAssertEqualObjects(@"USD", [dollars currency]);
    
    MXWMoney *euros = [MXWMoney euroWithAmount:@(1.0)];
    XCTAssertEqualObjects(@"EUR", [euros currency]);
    
}

-(void) testThatInitDoesNotRaiseException{
    
    
    XCTAssertNoThrow([MXWMoney dollarWithAmount:@(3.0)]);
    XCTAssertNoThrow([MXWMoney euroWithAmount:@(3.0)]);
    
}

- (void) testAddMoneySameCurrency {
    MXWMoney * euro1 = [MXWMoney euroWithAmount:@(3.0)];
    MXWMoney * euro2 = [MXWMoney euroWithAmount:@(2.0)];
    
    MXWMoney * euroSum = [euro1 add:euro2 withBroker:self.aBroker];
    
    XCTAssertEqualObjects([MXWMoney euroWithAmount: @(5.0)], euroSum);
    
}






@end

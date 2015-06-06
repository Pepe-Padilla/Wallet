//
//  MXWAddMoneyViewControllerTest.m
//  Wallet
//
//  Created by Pepe Padilla on 15/06/06.
//  Copyright (c) 2015 maxeiware. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "MXWAddMoneyViewController.h"

@interface MXWAddMoneyViewControllerTest : XCTestCase <MXWAddMoneyViewControllerDelegate>
@property (strong, nonatomic) MXWAddMoneyViewController * mvc;
@end

@implementation MXWAddMoneyViewControllerTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.mvc = [[MXWAddMoneyViewController alloc] initWithCurrency:@"XXZ"];
    self.mvc.delegate = self;
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    //self.mvc = nil;
    
    [super tearDown];
}

- (void)testDelegateAmountcorrect {
    self.mvc.textMoney.text = @"4";
    [self.mvc doneMoney:nil];
}

- (void) addMoneyViewController:(MXWAddMoneyViewController *)amvc
           didIntroduceAnAmount:(NSNumber *)amount
                    forCurrency:(NSString *)currency {
    XCTAssertEqualObjects(@(4), amount);
    XCTAssertEqualObjects(@"XXZ", currency);
    
    NSLog(@"%@",amount);
    NSLog(@"%@",currency);
    
    
}

@end

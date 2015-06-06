//
//  MXWWalletTableViewControllerTest.m
//  Wallet
//
//  Created by Pepe Padilla on 15/06/06.
//  Copyright (c) 2015 maxeiware. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "MXWBroker.h"
#import "MXWMoney.h"
#import "MXWWallet.h"
#import "MXWWalletTableViewController.h"

@interface MXWWalletTableViewControllerTest : XCTestCase

@property (strong,nonatomic) MXWWalletTableViewController * wTVC;
@property (strong,nonatomic) MXWWallet * wallet;
@property (strong,nonatomic) MXWBroker * aBroker;

@end

@implementation MXWWalletTableViewControllerTest

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.wallet = [MXWWallet new];
    self.aBroker = [MXWBroker new];
    [self.aBroker addRate:@(2.0) fromCurrency:@"EUR" toCurrency:@"USD"];
    
    MXWMoney * someEuros = [MXWMoney euroWithAmount:@(2.0)];
    MXWMoney * otherEuros = [MXWMoney euroWithAmount:@(8.0)];
    
    MXWMoney * someDollars = [MXWMoney dollarWithAmount:@(4.0)];
    MXWMoney * otherDollars = [MXWMoney dollarWithAmount:@(11.0)];
    
    [self.wallet addMoney:someEuros];
    [self.wallet addMoney:someDollars];
    [self.wallet addMoney:otherEuros];
    [self.wallet addMoney:otherDollars];
    
    self.wTVC = [[MXWWalletTableViewController alloc] initWithModel:self.wallet andBroker:self.aBroker];
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    self.wTVC = nil;
    self.wallet = nil;
    self.aBroker = nil;
    
    [super tearDown];
}

-(void) testSectionsCount {
    XCTAssertEqual([self.wTVC numberOfSectionsInTableView:nil],3);
}


-(void) testInSectionCount {
    XCTAssertEqual([self.wTVC tableView:nil numberOfRowsInSection:0],3);
    XCTAssertEqual([self.wTVC tableView:nil numberOfRowsInSection:1],3);
}


@end

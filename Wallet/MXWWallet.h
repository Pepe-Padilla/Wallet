//
//  MXWWallet.h
//  Wallet
//
//  Created by Pepe Padilla on 15/05/06.
//  Copyright (c) 2015 maxeiware. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MXWMoney;
@class MXWBroker;

@interface MXWWallet : NSObject

//@property (strong, nonatomic, readonly) NSMutableArray * monies;

- (void) addMoney:(MXWMoney*) aMoney;
- (MXWMoney*) takeMoneyForCurrency:(NSString*) currency atIndex:(NSUInteger) index;

- (MXWMoney*) subTotalForcurrency:(NSString*) currency;
- (MXWMoney*) sumTotalWithCurrency:(NSString*) currency andBroker:(MXWBroker*) broker;

- (NSArray*) walletSections;
- (NSUInteger) moniesForCurrency:(NSString*) currency;
- (MXWMoney*) moneyForCurrency:(NSString*) currency atIndex:(NSUInteger) index;

@end

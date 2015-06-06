//
//  MXWMoney.h
//  Wallet
//
//  Created by Pepe Padilla on 15/01/06.
//  Copyright (c) 2015 maxeiware. All rights reserved.
//

@import Foundation;
@class MXWBroker;

@interface MXWMoney : NSObject

@property (nonatomic,readonly) NSNumber* amount;
@property (nonatomic, copy, readonly) NSString * currency;


+ (instancetype) dollarWithAmount: (NSNumber*) amount;
+ (instancetype) euroWithAmount: (NSNumber *) amount;

- (id) initWithAmount: (NSNumber *) amount
             currency: (NSString *) currency;

- (MXWMoney *) times: (NSNumber *) multiplier;
- (MXWMoney *) add: (MXWMoney *) aMoney withBroker:(MXWBroker *) broker;

@end

//
//  MXWMoney.h
//  Wallet
//
//  Created by Pepe Padilla on 15/01/06.
//  Copyright (c) 2015 maxeiware. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MXWMoney : NSObject

+ (instancetype) dollarWithAmount: (NSInteger) amount;
+ (instancetype) euroWithAmount: (NSInteger) amount;

- (id) initWithAmount: (NSUInteger) amount
             currency: (NSString *) currency;

- (MXWMoney*) times: (NSUInteger) multiplier;

@end

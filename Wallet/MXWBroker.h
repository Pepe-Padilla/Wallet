//
//  MXWBroker.h
//  Wallet
//
//  Created by Pepe Padilla on 15/06/06.
//  Copyright (c) 2015 maxeiware. All rights reserved.
//

@import Foundation;
@class MXWMoney;

@interface MXWBroker : NSObject

- (void) addRate:(NSNumber*) rate fromCurrency:(NSString*) fromCurrency toCurrency:(NSString*) toCurrency;
- (MXWMoney*)reduce:(MXWMoney*)aMoney toCurrency:(NSString*)currency;

@end

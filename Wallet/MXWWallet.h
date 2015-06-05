//
//  MXWWallet.h
//  Wallet
//
//  Created by Pepe Padilla on 15/05/06.
//  Copyright (c) 2015 maxeiware. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MXWMoney;

@interface MXWWallet : NSObject

@property (strong, nonatomic, readonly) NSMutableArray * monies;

- (void) addMoney:(MXWMoney*) aMoney;
- (MXWMoney*) takeMoneyAtIndex:(NSUInteger) index;

@end

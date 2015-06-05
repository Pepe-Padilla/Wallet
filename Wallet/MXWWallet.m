//
//  MXWWallet.m
//  Wallet
//
//  Created by Pepe Padilla on 15/05/06.
//  Copyright (c) 2015 maxeiware. All rights reserved.
//

#import "MXWWallet.h"
#import "MXWMoney.h"

@interface MXWWallet ()

@property (strong, nonatomic) NSMutableArray * monies;

@end

@implementation MXWWallet

- (instancetype) init {
    if (self = [super init]) {
        _monies = [NSMutableArray new];
    }
    
    return self;
}

- (void) addMoney:(MXWMoney*) aMoney {
    [self.monies addObject:aMoney];
}

- (MXWMoney*) takeMoneyAtIndex:(NSUInteger) index {
    MXWMoney *aMoney = [self.monies objectAtIndex:index];
    [self.monies removeObjectAtIndex:index];
    return aMoney;
}

@end

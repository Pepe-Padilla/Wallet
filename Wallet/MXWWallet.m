//
//  MXWWallet.m
//  Wallet
//
//  Created by Pepe Padilla on 15/05/06.
//  Copyright (c) 2015 maxeiware. All rights reserved.
//

#import "MXWWallet.h"
#import "MXWMoney.h"
#import "MXWBroker.h"

@interface MXWWallet ()

@property (strong, nonatomic) NSMutableDictionary * monies;

@end

@implementation MXWWallet

- (instancetype) init {
    if (self = [super init]) {
        _monies = [NSMutableDictionary new];
    }
    
    return self;
}

- (void) addMoney:(MXWMoney*) aMoney {
    NSMutableArray* arrMoney = [self.monies objectForKey:aMoney.currency];
    
    if (!arrMoney) {
        arrMoney = [NSMutableArray new];
    }
    
    [arrMoney addObject:aMoney];
    
    [self.monies setObject:arrMoney forKey:aMoney.currency];
}

- (MXWMoney*) takeMoneyForCurrency:(NSString*) currency atIndex:(NSUInteger) index {
    
    NSMutableArray * arrMoney = [self.monies objectForKey:currency];
    
    MXWMoney *aMoney = [arrMoney objectAtIndex:index];
    
    if (arrMoney) {
        [arrMoney removeObjectAtIndex:index];
        
        if (arrMoney.count == 0) {
            [self.monies removeObjectForKey:currency];
        } else {
            [self.monies setObject:arrMoney forKey:currency];
        }
    }
    
    return aMoney;
}

- (MXWMoney*) sumTotalWithCurrency: (NSString*) currency
                         andBroker: (MXWBroker*) broker{
    
    __block MXWMoney * sumTotal = [[MXWMoney alloc] initWithAmount:@(0) currency:currency];
    
    
    [self.monies enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
        NSMutableArray* arrMoney = obj;
        [arrMoney enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            sumTotal = [sumTotal add:obj withBroker:broker];
        }];
    }];
    
    return sumTotal;
}

- (MXWMoney*) subTotalForcurrency:(NSString*) currency {
    __block MXWMoney * sumTotal = [[MXWMoney alloc] initWithAmount:@(0) currency:currency];
    
    
    NSMutableArray* arrMoney = [self.monies objectForKey:currency];;
    [arrMoney enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        sumTotal = [sumTotal add:obj withBroker:[MXWBroker new]];
    }];
    
    return sumTotal;
}

- (NSArray*) walletSections {
    return [self.monies allKeys];
}

- (NSUInteger) moniesForCurrency:(NSString*) currency {
    NSMutableArray * arrMoney = [self.monies objectForKey:currency];
    return arrMoney.count;
}

- (MXWMoney*) moneyForCurrency:(NSString*) currency atIndex:(NSUInteger) index {
    NSMutableArray * arrMoney = [self.monies objectForKey:currency];
    MXWMoney * money = [arrMoney objectAtIndex:index];
    return money;
}

@end

//
//  MXWBroker.m
//  Wallet
//
//  Created by Pepe Padilla on 15/06/06.
//  Copyright (c) 2015 maxeiware. All rights reserved.
//

#import "MXWBroker.h"
#import "MXWMoney.h"

@interface MXWBroker ()

@property (strong, nonatomic) NSMutableDictionary * rates;

@end

@implementation MXWBroker

- (instancetype) init {
    if (self = [super init]) {
        _rates = [NSMutableDictionary new];
    }
    return self;
}

- (void) addRate:(NSNumber*) rate
    fromCurrency:(NSString*) fromCurrency
      toCurrency:(NSString*) toCurrency {
    
    if (!rate || [rate doubleValue] == 0) {
        
        [NSException raise:@"MXWBroker exception"
                    format:@"rate 0 no valid, must be > 0"];
    }
    
    [self.rates setObject:rate
                   forKey:[NSString stringWithFormat:@"%@-%@",fromCurrency,toCurrency]];
    [self.rates setObject:@(1/[rate doubleValue])
                   forKey:[NSString stringWithFormat:@"%@-%@",toCurrency,fromCurrency]];
}

- (MXWMoney*)reduce:(MXWMoney*)aMoney
         toCurrency:(NSString*)currency {
    
    if ([aMoney.currency isEqualToString:currency]) {
        return [aMoney times:@(1)];
    } else {
        NSNumber * rate = [self.rates objectForKey:[NSString stringWithFormat:@"%@-%@",aMoney.currency,currency]];
        if (!rate) {
            
            [NSException raise:@"MXWBroker exception"
                        format:@"rate not defined: %@-%@",aMoney.currency,currency];
        }
        
        return [[MXWMoney alloc] initWithAmount:@([aMoney.amount doubleValue]*[rate doubleValue])
                                       currency:currency];
        
    }
}



@end

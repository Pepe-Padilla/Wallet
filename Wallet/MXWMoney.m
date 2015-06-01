//
//  MXWMoney.m
//  Wallet
//
//  Created by Pepe Padilla on 15/01/06.
//  Copyright (c) 2015 maxeiware. All rights reserved.
//

#import "MXWMoney.h"

@interface MXWMoney ()

@property (nonatomic) NSUInteger amount;
@property (nonatomic, copy) NSString * currency;

@end

@implementation MXWMoney

- (id) initWithAmount: (NSUInteger) amount currency: (NSString *) currency{
    if (self = [super init] ) {
        _amount = amount;
        _currency = currency;
    }
    
    return self;
}

+ (instancetype) euroWithAmount: (NSInteger) amount {
    return [[MXWMoney alloc] initWithAmount:amount
                                   currency:@"EUR"];
}

+ (instancetype) dollarWithAmount: (NSInteger) amount{
    return [[MXWMoney alloc] initWithAmount:amount
                                   currency:@"UDS"];
}

- (MXWMoney *) times: (NSUInteger) multiplier {
    return  [[MXWMoney alloc] initWithAmount: self.amount * multiplier
                                    currency: self.currency];
}

- (BOOL)isEqual:(id)object {
    if (self == object)
        return YES;
    else if([object isKindOfClass:[MXWMoney class]]) {
        MXWMoney * ob = object;
        return (self.amount == ob.amount && [self.currency isEqualToString:ob.currency]);
    } else {
        return NO;
    }
}

@end

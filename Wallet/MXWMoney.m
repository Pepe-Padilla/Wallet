//
//  MXWMoney.m
//  Wallet
//
//  Created by Pepe Padilla on 15/01/06.
//  Copyright (c) 2015 maxeiware. All rights reserved.
//

#import "MXWMoney.h"
#import "MXWBroker.h"

@interface MXWMoney ()

@property (nonatomic) NSNumber * amount;
@property (nonatomic, copy) NSString * currency;

@end

@implementation MXWMoney

- (id) initWithAmount: (NSNumber *) amount currency: (NSString *) currency{
    if (self = [super init] ) {
        _amount = amount;
        _currency = currency;
    }
    
    return self;
}

+ (instancetype) euroWithAmount: (NSNumber *) amount {
    return [[MXWMoney alloc] initWithAmount:amount
                                   currency:@"EUR"];
}

+ (instancetype) dollarWithAmount: (NSNumber *) amount{
    return [[MXWMoney alloc] initWithAmount:amount
                                   currency:@"USD"];
}

- (MXWMoney *) times: (NSNumber *) multiplier {
    return  [[MXWMoney alloc] initWithAmount: @([self.amount doubleValue] * [multiplier doubleValue])
                                    currency: self.currency];
}

- (MXWMoney *) add: (MXWMoney *) aMoney
        withBroker: (MXWBroker *)broker{
    
    MXWMoney * newMoney = [broker reduce:aMoney toCurrency:self.currency];
    
    return [[MXWMoney alloc] initWithAmount:@([self.amount doubleValue] + [newMoney.amount doubleValue]) currency:self.currency];
}

#pragma mark - Overwrite

- (BOOL)isEqual:(id)object {
    if (self == object)
        return YES;
    else if([object isKindOfClass:[MXWMoney class]]) {
        MXWMoney * ob = object;
        return ([self.amount doubleValue] == [ob.amount doubleValue] && [self.currency isEqualToString:ob.currency]);
    } else {
        return NO;
    }
}

- (NSString *)description {
    return [NSString stringWithFormat:@"<%@: %@ %@>", NSStringFromClass([self class]), self.amount, self.currency];
}

@end

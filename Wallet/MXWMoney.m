//
//  MXWMoney.m
//  Wallet
//
//  Created by Pepe Padilla on 15/01/06.
//  Copyright (c) 2015 maxeiware. All rights reserved.
//

#import "MXWMoney.h"
#import "MXWMoneyPrivate.h"


@implementation MXWMoney

- (id) initWithAmount: (NSUInteger) amount{
    if (self = [super init] ) {
        _amount = amount;
    }
    
    return self;
}

- (MXWMoney *) times: (NSUInteger) multiplier {
    return  [[MXWMoney alloc] initWithAmount: self.amount * multiplier];
}

- (BOOL)isEqual:(id)object {
    if (self == object)
        return YES;
    else if([object isKindOfClass:[MXWMoney class]]) {
        MXWMoney * ob = object;
        return self.amount == ob.amount;
    } else {
        return NO;
    }
}

@end

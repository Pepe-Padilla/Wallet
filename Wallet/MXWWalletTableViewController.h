//
//  MXWWalletTableViewController.h
//  Wallet
//
//  Created by Pepe Padilla on 15/06/06.
//  Copyright (c) 2015 maxeiware. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MXWAddMoneyViewController.h"
@class MXWWallet;
@class MXWBroker;

@interface MXWWalletTableViewController : UITableViewController <MXWAddMoneyViewControllerDelegate, UIViewControllerTransitioningDelegate>

- (instancetype)initWithModel:(MXWWallet*) wallet andBroker:(MXWBroker *) broker;

@end

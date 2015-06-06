//
//  MXWAddMoneyViewController.h
//  Wallet
//
//  Created by Pepe Padilla on 15/06/06.
//  Copyright (c) 2015 maxeiware. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MXWAddMoneyViewController;

@protocol MXWAddMoneyViewControllerDelegate <NSObject>

@optional

-(void) addMoneyViewController:(MXWAddMoneyViewController*) amvc
          didIntroduceAnAmount:(NSNumber*) amount
                   forCurrency:(NSString*) currency;

-(void) addMoneyViewController:(MXWAddMoneyViewController*) amvc
          didCancelForCurrency:(NSString*) currency;

@end


@interface MXWAddMoneyViewController : UIViewController

@property (weak, nonatomic) id<MXWAddMoneyViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UITextField *textMoney;
@property (copy, nonatomic, readonly) NSString * currency;


- (instancetype)initWithCurrency:(NSString*) currency;

- (IBAction)doneMoney:(id)sender;
- (IBAction)cancelAddMoney:(id)sender;


@end

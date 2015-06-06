//
//  MXWAddMoneyViewController.m
//  Wallet
//
//  Created by Pepe Padilla on 15/06/06.
//  Copyright (c) 2015 maxeiware. All rights reserved.
//

#import "MXWAddMoneyViewController.h"

@interface MXWAddMoneyViewController ()

@end

@implementation MXWAddMoneyViewController

-(instancetype)initWithCurrency:(NSString *)currency {
    if (self = [super initWithNibName:nil bundle:nil]) {
        _currency = currency;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.view.backgroundColor = [UIColor colorWithHue:0.0 saturation:0.0 brightness:0.0 alpha:0.6];
    
    self.textMoney.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    
    //UIKeyboardTypeNumberPad
    //UIKeyboardTypeNumbersAndPunctuation
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)doneMoney:(id)sender {
    if (![self.textMoney.text isEqualToString:@""]) {
        if ([self.delegate respondsToSelector:@selector(addMoneyViewController:didIntroduceAnAmount:forCurrency:)]) {
            
            NSString * moneyText = self.textMoney.text;
            
            NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
            f.numberStyle = NSNumberFormatterDecimalStyle;
            NSNumber * amount = [f numberFromString:moneyText];
            
            if (amount) {
                [self.delegate addMoneyViewController: self
                                 didIntroduceAnAmount: amount
                                          forCurrency: self.currency];
            }
            
        }
    }
}

- (IBAction)cancelAddMoney:(id)sender {
    if ([self.delegate respondsToSelector:@selector(addMoneyViewController:didCancelForCurrency:)]) {
        
        [self.delegate addMoneyViewController: self
                         didCancelForCurrency: self.currency];
        
        
    }
}
@end

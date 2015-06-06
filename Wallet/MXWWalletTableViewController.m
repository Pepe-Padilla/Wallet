//
//  MXWWalletTableViewController.m
//  Wallet
//
//  Created by Pepe Padilla on 15/06/06.
//  Copyright (c) 2015 maxeiware. All rights reserved.
//

#import "MXWWalletTableViewController.h"
#import "MXWWallet.h"
#import "MXWBroker.h"
#import "MXWMoney.h"

//#import "MXWSemiModalAnimatedTransition.h"

@interface MXWWalletTableViewController ()

@property (strong, nonatomic) MXWWallet* wallet;
@property (strong, nonatomic) MXWBroker* broker;

@property (nonatomic, assign) BOOL presenting;

@end

@implementation MXWWalletTableViewController

- (instancetype)initWithModel:(MXWWallet *)wallet andBroker:(MXWBroker *)broker{
    if (self = [super initWithStyle:UITableViewStylePlain]) {
        _wallet = wallet;
        _broker = broker;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    UIBarButtonItem *addEUR = [[UIBarButtonItem alloc] initWithTitle:@"EUR"
                                                                style:UIBarButtonItemStylePlain
                                                               target:self
                                                               action:@selector(addEUR)];
    UIBarButtonItem *addUSD = [[UIBarButtonItem alloc] initWithTitle:@"USD"
                                                               style:UIBarButtonItemStylePlain
                                                              target:self
                                                              action:@selector(addUSD)];
    UIBarButtonItem *addGBP = [[UIBarButtonItem alloc] initWithTitle:@"GBP"
                                                               style:UIBarButtonItemStylePlain
                                                              target:self
                                                              action:@selector(addGBP)];
    self.navigationItem.rightBarButtonItems = @[addEUR,addUSD, addGBP];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return [self.wallet walletSections].count + 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if (section >= [self.wallet walletSections].count) {
        return 1;
    } else {
        NSString * currency = [[self.wallet walletSections] objectAtIndex:section];
        return [self.wallet moniesForCurrency:currency] + 1;
    }
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section >= [self.wallet walletSections].count) {
        return @"Total in wallet";
    } else {
        return [[self.wallet walletSections] objectAtIndex:section];
    }
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //Crear celda
    static NSString * cellID = @"WalletCell";
    UITableViewCell * cell= [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil) {
        // crear cell
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:cellID];
    }
    
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    
    MXWMoney * moneyPenny = nil;
    NSString * prefix = @"";
    
    if (section >= [self.wallet walletSections].count) {
        prefix = @"Total: ";
        moneyPenny = [self.wallet sumTotalWithCurrency:@"EUR" andBroker:self.broker];
    } else {
        NSString * currency = [[self.wallet walletSections] objectAtIndex:section];
        if (row >= [self.wallet moniesForCurrency:currency]) {
            prefix = @"Sub Total: ";
            
            moneyPenny = [self.wallet subTotalForcurrency:currency];
            
        } else {
            
            moneyPenny = [self.wallet moneyForCurrency:currency atIndex:row];
        }
    }
    
    if (moneyPenny) {
        prefix = [NSString stringWithFormat:@"%@%@ %@",prefix,moneyPenny.amount, moneyPenny.currency];
    }
    cell.textLabel.text = prefix;
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - actions
-(void) addEUR {
    // 320 , 46
    MXWAddMoneyViewController * mvc = [[MXWAddMoneyViewController alloc] initWithCurrency:@"EUR"];
    mvc.delegate = self;
    
    
    mvc.modalPresentationStyle = UIModalPresentationPopover;
    
    
    //mvc.transitioningDelegate = self;
    
    
    //mvc.modalPresentationCapturesStatusBarAppearance =YES;
    
    //UIModalPresentationFullScreen = 0;
    //UIModalPresentationPageSheet,
    //UIModalPresentationFormSheet,
    //UIModalPresentationCurrentContext;
    [self presentViewController:mvc animated:YES completion:^{
        //mvc.view.backgroundColor = [UIColor clearColor];
        //mvc.view.bounds = CGRectMake(0, 64, 320, 46);
        
    }];
}

-(void) addUSD {
    // 320 , 46
    MXWAddMoneyViewController * mvc = [[MXWAddMoneyViewController alloc] initWithCurrency:@"USD"];
    mvc.delegate = self;
    
    mvc.modalPresentationStyle = UIModalPresentationPopover;
    
    [self presentViewController:mvc animated:YES completion:^{
        //mvc.view.backgroundColor = [UIColor clearColor];
        //mvc.view.bounds = CGRectMake(0, 64, 320, 46);
        
    }];
}

-(void) addGBP {
    // 320 , 46
    MXWAddMoneyViewController * mvc = [[MXWAddMoneyViewController alloc] initWithCurrency:@"GBP"];
    mvc.delegate = self;
    
    mvc.modalPresentationStyle = UIModalPresentationPopover;
    
    [self presentViewController:mvc animated:YES completion:^{
        //mvc.view.backgroundColor = [UIColor clearColor];
        //mvc.view.bounds = CGRectMake(0, 64, 320, 46);
        
    }];
}

#pragma mark - MXWAddMoneyViewControllerDelegate
- (void) addMoneyViewController:(MXWAddMoneyViewController *)amvc didIntroduceAnAmount:(NSNumber *)amount forCurrency:(NSString *)currency {
    [amvc dismissViewControllerAnimated:YES completion:^{
        MXWMoney * aMoney = [[MXWMoney alloc] initWithAmount:amount currency:currency];
        [self.wallet addMoney:aMoney];
        [self.tableView reloadData];
    }];
}

- (void) addMoneyViewController:(MXWAddMoneyViewController *)amvc didCancelForCurrency:(NSString *)currency {
    [amvc dismissViewControllerAnimated:YES completion:^{
        
    }];
}

//#pragma mark - UIViewControllerTransitioningDelegate
//- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
//{
//    MXWSemiModalAnimatedTransition *semiModalAnimatedTransition = [[MXWSemiModalAnimatedTransition alloc] init];
//    semiModalAnimatedTransition.presenting = YES;
//    return semiModalAnimatedTransition;
//}

//- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
//{
//    MXWSemiModalAnimatedTransition *semiModalAnimatedTransition = [[MXWSemiModalAnimatedTransition alloc] init];
//    return semiModalAnimatedTransition;
//}








@end

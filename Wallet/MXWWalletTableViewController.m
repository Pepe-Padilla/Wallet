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

@interface MXWWalletTableViewController ()

@property (strong, nonatomic) MXWWallet* wallet;
@property (strong, nonatomic) MXWBroker* broker;

@end

@implementation MXWWalletTableViewController

- (instancetype)initWithModel:(MXWWallet *)wallet andBroker:(MXWBroker *)broker{
    if (self = [super initWithStyle:UITableViewStylePlain]) {
        _wallet = wallet;
        _broker = broker;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    } else {
        NSString * currency = [[self.wallet walletSections] objectAtIndex:section];
        if (row >= [self.wallet moniesForCurrency:currency]) {
             prefix = @"Sub Total: ";
        } else {
            NSString* currency = [[self.wallet walletSections] objectAtIndex:section];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  FifthViewController.m
//  iFinanceTracker
//
//  Created by Andy Wu on 11/29/15.
//  Copyright © 2015 Andy Wu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FifthViewController.h"
#import "dbModel.h"
#import "AddAmountViewController.h"
#import "DBManager.h"
#import "LoginViewController.h"
#import "FirstViewController.h"
#import "ThirdViewController.h"
#import "SecondViewController.h"
#import "FourthViewController.h"

//ViewController for Overall
@interface FifthViewController ()
{
    dbModel *_dbModel;
    NSArray * _getItems;
}

@property (nonatomic, strong) DBManager *dbManager;
@property NSString *overallSpent;

@end



@implementation FifthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _amountSpent.text = @"100";
    
  
    
    
    _getItems = [[NSArray alloc] init];
    _dbModel = [[dbModel alloc] init];
    _dbModel.delegate = self;
    [_dbModel downloadItems];
    
    
    
    
    // Initialize the dbManager object.
    self.dbManager = [[DBManager alloc] initWithDatabaseFilename:@"appdb.sql"];
 
    //Sets the fields on the Overall Page
    
    self.personalField.text = globalSumPersonal;
    self.foodField.text = globalSumFood;
    self.autoField.text = globalSumAuto;
    self.miscField.text = globalSumMisc;
    
    
}



-(void) dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)itemsDownloaded:(NSArray *)items
{
    //This method gets called once the items are finished downloading
    _getItems = items;
}

- (IBAction)viewOverallTransacts:(UIButton *)sender {
    /*
    NSString *personal = [NSString stringWithFormat:@"select personal from userInfo where username = 'Fun';"];
    
    
    NSArray *results = [[NSArray alloc] initWithArray:[self.dbManager loadDataFromDB:personal]];
    
    personal = [[results objectAtIndex:0] objectAtIndex:[self.dbManager.arrColumnNames indexOfObject:@"personal"]];
    
    NSLog(@"Personal Things: %@", personal);
    
    NSString *usernameData = [[results objectAtIndex:0] objectAtIndex:[self.dbManager.arrColumnNames indexOfObject:@"username"]];
    NSLog(@"%@",usernameData);
*/
    //I used code from this website http://hayageek.com/uialertcontroller-example-ios/#simple
    //This is used to pop up an alerter to show the transactions
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:@"Overall Transactions"
                                  message:@"You are using UIAlertController"
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    //This is the function to create the OK button on the alerter
    UIAlertAction* ok = [UIAlertAction
                         actionWithTitle:@"OK"
                         style:UIAlertActionStyleDefault
                         handler:^(UIAlertAction * action)
                         {
                             [alert dismissViewControllerAnimated:YES completion:nil];
                             
                         }];
    
    
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
}


@end

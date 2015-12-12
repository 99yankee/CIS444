//
//  FirstViewController.m
//  iFinanceTracker
//
//  Created by Andy Wu on 11/21/15.
//  Copyright © 2015 Andy Wu. All rights reserved.
//

#import "FirstViewController.h"
#import "dbModel.h"
#import "AddAmountViewController.h"
#import "LoginViewController.h"
#import "DBManager.h"

//ViewController for Personal
@interface FirstViewController () {

    NSString *firstView;
}
@property (nonatomic, strong) DBManager *dbManager;



@end

NSString *globalSumPersonal;

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _amountSpentPersonal.text = @"0";
   
    
    NSLog(@"%@", globalUser);
    
    
    // Initialize the dbManager object.
    self.dbManager = [[DBManager alloc] initWithDatabaseFilename:@"appdb.sql"];
    NSString *personalData;
    NSInteger hold;
    NSInteger b;
    
    @try {
    
        personalData = [NSString stringWithFormat:@"select * from userInfo where username = '%@'", globalUser];
        NSArray *results = [[NSArray alloc] initWithArray:[self.dbManager loadDataFromDB:personalData]];
        b = [filler intValue];
        filler = [[results objectAtIndex:0]objectAtIndex:3];
        hold = [filler integerValue] + [globalSumPersonal integerValue];
        globalSumPersonal = [NSString stringWithFormat:@"%ld", (long)hold];
        _amountSpentPersonal.text = [NSString stringWithFormat:@"%@", globalSumPersonal];
    }
    
    @catch(NSException *exception)
    {
        filler = personalData;
        _amountSpentPersonal.text = globalSumPersonal;
        
    }

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)viewPersonalTransacts:(UIButton *)sender {
    //I used code from this website http://hayageek.com/uialertcontroller-example-ios/#simple
    //This is used to pop up an alerter to show the transactions
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:@"Personal Transactions"
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

// Used code from http://www.mysamplecode.com/2012/12/ios-passing-data-between-view-controllers.html
// This method determines which viewcontroller it came from so that it fills out the category
// in the Add Amount page.
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    AddAmountViewController *transferViewController = segue.destinationViewController;
    
    NSLog(@"prepareForSegue: %@", segue.identifier);
    if([segue.identifier isEqualToString:@"Personal"])
    {
        transferViewController.fnameText = @"Personal";
        
        
    }
    
}

@end

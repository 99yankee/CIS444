//
//  PasswordRecoveryViewController.m
//  iFinanceTracker
//
//  Created by Andy Wu on 11/30/15.
//  Copyright © 2015 Andy Wu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PasswordRecoveryViewController.h"
#import "DBManager.h"
#import "LoginViewController.h"

//ViewController for Password Recovery
@interface PasswordRecoveryViewController ()

@property (nonatomic, strong) DBManager *dbManager;

@end

@implementation PasswordRecoveryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.userBox.delegate = self;
    self.passBox.delegate = self;
    self.emailBox.delegate = self;
    
    // Initialize the dbManager object.
    self.dbManager = [[DBManager alloc] initWithDatabaseFilename:@"appdb.sql"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveInfo:(id)sender {
    @try {
        NSString *usernameData = [NSString stringWithFormat:@"select * from userInfo where username = '%@'", self.userBox.text];
        NSArray *results = [[NSArray alloc] initWithArray:[self.dbManager loadDataFromDB:usernameData]];
        usernameData = [[results objectAtIndex:0] objectAtIndex:[self.dbManager.arrColumnNames indexOfObject:@"username"]];
        
    }

    @catch (NSException *exception) {
        
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:@"Error!"
                                      message:@"Missing one or more fields!"
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
    
    if([[self.userBox text] isEqualToString:@""] || [[self.passBox text] isEqualToString:@""]  || [[self.emailBox text] isEqualToString:@""]) {
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:@"Error!"
                                      message:@"Missing Fields!"
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
    else {

        NSString *query = [NSString stringWithFormat:@"update userInfo set password='%@' where username='%@' and email='%@'",self.passBox.text, self.userBox.text, self.emailBox.text];
        
        //executes the custom query
        [self.dbManager executeQuery:query];
        
        // If the query was successfully executed then pop the view controller.
        if (self.dbManager.affectedRows != 0) {
            NSLog(@"Query was executed successfully. Affected rows = %d", self.dbManager.affectedRows);
            
            // Pop the view controller.
            [self.navigationController popViewControllerAnimated:YES];
            
            LoginViewController *home= [self.storyboard instantiateViewControllerWithIdentifier:@"Login"];
            [self presentViewController:home animated:YES completion:nil];
        }
        else{
            NSLog(@"Could not execute the query.");
        }
    }
    
}
@end

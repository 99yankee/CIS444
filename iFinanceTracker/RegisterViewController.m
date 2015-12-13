//
//  RegisterViewController.m
//  iFinanceTracker
//
//  Created by Andy Wu on 11/30/15.
//  Copyright © 2015 Andy Wu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RegisterViewController.h"
#import "DBManager.h"
#import "LoginViewController.h"

//ViewController for Registering
@interface RegisterViewController ()

@property (nonatomic, strong) DBManager *dbManager;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.username.delegate = self;
    self.password.delegate = self;
    self.email.delegate = self;
    
    // Initialize the dbManager object.
    self.dbManager = [[DBManager alloc] initWithDatabaseFilename:@"appdb.sql"];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)saveInfo:(UIButton *)sender {
    
    @try {
        //Checks if username already exists, if it does it will present user with an error.
        NSString *usernameData = [NSString stringWithFormat:@"select * from userInfo where username = '%@'", self.username.text];
        NSArray *results = [[NSArray alloc] initWithArray:[self.dbManager loadDataFromDB:usernameData]];
        usernameData = [[results objectAtIndex:0] objectAtIndex:[self.dbManager.arrColumnNames indexOfObject:@"username"]];
        
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:@"Error!"
                                      message:@"Username has been used."
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
    @catch (NSException *exception) {
        //Checks to see if any of the fields are empty
        if([[self.username text] isEqualToString:@""] || [[self.password text] isEqualToString:@""]  || [[self.email text] isEqualToString:@""]) {
            UIAlertController * alert=   [UIAlertController
                                          alertControllerWithTitle:@"Error!"
                                          message:@"Empty username and/or password field(s)!"
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
        
        
        else{
            
            //If user is not in database, creates the user
            
            // Prepare the query string.
            NSString *query = [NSString stringWithFormat:@"insert into userInfo values('%@', '%@', '%@', null, null, null, null, null, null, null)", self.username.text, self.password.text, self.email.text];
            
            // Execute the query.
            [self.dbManager executeQuery:query];
            
            
            // If the query was successfully executed then pop the view controller.
            if (self.dbManager.affectedRows != 0) {
                
                
                
                NSLog(@"Query was executed successfully. Affected rows = %d", self.dbManager.affectedRows);
                NSLog(@"%@",query);
                // Pop the view controller.
                [self.navigationController popViewControllerAnimated:YES];
                
                LoginViewController *backHome= [self.storyboard instantiateViewControllerWithIdentifier:@"Login"];
                [self presentViewController:backHome animated:YES completion:nil];
            }
            else{
                NSLog(@"Could not execute the query.");
            }
        }
    }
    
  
}
    

@end

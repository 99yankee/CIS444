//
//  LoginViewController.m
//  iFinanceTracker
//
//  Created by Andy Wu on 11/30/15.
//  Copyright © 2015 Andy Wu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginViewController.h"
#import "FifthViewController.h"
#import "DBManager.h"



//ViewController for Login
@interface LoginViewController ()

@property (nonatomic, strong) DBManager *dbManager;


@end

NSString *globalUser;
NSString *filler;


@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //Sets placeholders for user and pass fields
    _username.placeholder = @"Username";
    _encryptPass.placeholder = @"Password";
    _encryptPass.secureTextEntry = YES;
    
    self.username.delegate = self;
    self.encryptPass.delegate = self;

    //Brings in the database
    self.dbManager = [[DBManager alloc] initWithDatabaseFilename:@"appdb.sql"];
    

    //Cancels out the filler variable so there are no potential issues
    filler = @"0";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)signIn:(UIButton *)sender {
    //Gets the input for password even if it throws an error
    NSString *tempPass;
    //Checks if the catch alerter is run
    BOOL isCatch = FALSE;
    @try {
        
        //If user doesn't exist, this will throw an exception because they have no data to access
        NSString *password = [NSString stringWithFormat:@"select * from userInfo where username = '%@'", self.username.text];

        NSArray *results = [[NSArray alloc] initWithArray:[self.dbManager loadDataFromDB:password]];
    
        password = [[results objectAtIndex:0] objectAtIndex:[self.dbManager.arrColumnNames indexOfObject:@"password"]];
        NSLog(@"%@",password);
        
        tempPass = password;
    
        NSString *usernameData = [[results objectAtIndex:0] objectAtIndex:[self.dbManager.arrColumnNames indexOfObject:@"username"]];
        NSLog(@"%@",usernameData);
        
        
    }
    @catch (NSException *exception){
        isCatch = true;
        //If there are missing fields, alertview will present user with a message
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:@"Error!"
                                      message:@"Incorrent or Misssing Username/Password."
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
    //This is to check if the the catch alerter has already run.
    //This prevents two alerters from appearing at once and throwing a warning.
    if(!isCatch) {
        if([[self.username text] isEqualToString:@""] || [[self.encryptPass text] isEqualToString:@""] ) {
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
        else if (tempPass == self.encryptPass.text) {
        
            //If username and password are valid, grant access to User.
            globalUser = self.username.text;
        
            FifthViewController *fifth= [self.storyboard instantiateViewControllerWithIdentifier:@"tabbedView"];
            [self presentViewController:fifth animated:YES completion:nil];
        }
    
        else
        {
            NSLog(@"Nope");
            NSLog(@"%@",tempPass);
        }
        
    }
}

@end
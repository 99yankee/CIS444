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

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _username.placeholder = @"Username";
    
    _encryptPass.placeholder = @"Password";
    _encryptPass.secureTextEntry = YES;
    
    self.username.delegate = self;
    self.encryptPass.delegate = self;

    
    self.dbManager = [[DBManager alloc] initWithDatabaseFilename:@"appdb.sql"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)signIn:(UIButton *)sender {
    //NSInteger success = 0;
 
    NSString *password = [NSString stringWithFormat:@"select * from userInfo where username = '%@'", self.username.text];

    NSArray *results = [[NSArray alloc] initWithArray:[self.dbManager loadDataFromDB:password]];
    
    password = [[results objectAtIndex:0] objectAtIndex:[self.dbManager.arrColumnNames indexOfObject:@"password"]];
    NSLog(@"%@",password);

    
    
    if([[self.username text] isEqualToString:@""] || [[self.encryptPass text] isEqualToString:@""] ) {
        //NSLog(@"ITS TRUE!");
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
    else if (password == self.encryptPass.text) {
        FifthViewController *fifth= [self.storyboard instantiateViewControllerWithIdentifier:@"tabbedView"];
        [self presentViewController:fifth animated:YES completion:nil];
    }
    
    else
    {
        NSLog(@"Nope");
        NSLog(@"%@",password);
    }
}

@end
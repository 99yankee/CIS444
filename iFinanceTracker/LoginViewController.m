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

//ViewController for Login
@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _username.placeholder = @"Username";
    
    _encryptPass.placeholder = @"Password";
    _encryptPass.secureTextEntry = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)signIn:(UIButton *)sender {
    //NSInteger success = 0;
    
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
    else {
        FifthViewController *fifth= [self.storyboard instantiateViewControllerWithIdentifier:@"tabbedView"];
        [self presentViewController:fifth animated:YES completion:nil];
    }
}

@end
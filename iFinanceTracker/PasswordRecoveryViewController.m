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
    
    NSString *query = [NSString stringWithFormat:@"update userInfo set password='%@' where username='%@' and email='%@'",self.passBox.text, self.userBox.text, self.emailBox.text];
    

    [self.dbManager executeQuery:query];
    
    // If the query was successfully executed then pop the view controller.
    if (self.dbManager.affectedRows != 0) {
        NSLog(@"Query was executed successfully. Affected rows = %d", self.dbManager.affectedRows);
        
        // Pop the view controller.
        [self.navigationController popViewControllerAnimated:YES];
    }
    else{
        NSLog(@"Could not execute the query.");
    }
}
@end

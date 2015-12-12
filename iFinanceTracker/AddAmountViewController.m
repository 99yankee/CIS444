//
//  AddAmountViewController.m
//  iFinanceTracker
//
//  Created by Andy Wu on 11/30/15.
//  Copyright © 2015 Andy Wu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AddAmountViewController.h"
#import "FifthViewController.h"
#import "DBManager.h"
#import "LoginViewController.h"


//ViewController for Adding an Amount
@interface AddAmountViewController ()

@property (strong, nonatomic) IBOutlet UITextView *descript;

@property (nonatomic, strong) DBManager *dbManager;

@end

@implementation AddAmountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _descript.text = @"Give a brief description.";
    _descript.textColor = [UIColor lightGrayColor];
    _descript.delegate = self;
    self.whereYouCameFrom.text = self.fnameText;
    
    // Do any additional setup after loading the view, typically from a nib.
    self.totalAmount.delegate = self;
    self.descriptField.delegate = self;
    
    // Initialize the dbManager object.
    self.dbManager = [[DBManager alloc] initWithDatabaseFilename:@"appdb.sql"];
    
}

- (BOOL) textViewShouldBeginEditing:(UITextView *)textView
{
    _descript.text = @"";
    _descript.textColor = [UIColor blackColor];
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)addTotal:(UIButton *)sender {
    
    // Prepare the query string.
    //NSString *query = [NSString stringWithFormat:@"insert into userInfo('%@', description) values('%f','%@');", self.whereYouCameFrom.text,[self.totalAmount.text doubleValue], self.descriptField.text];
    
    NSString *query = [NSString stringWithFormat:@"update userInfo set '%@'='%d' where username = '%@';",  self.whereYouCameFrom.text, [self.totalAmount.text intValue] + [self.whereYouCameFrom.text intValue], globalUser];
    
    //NSString *query = [NSString stringWithFormat:@"insert into userInfo(username, '%@', description) values('%@','%d','%@');", self.whereYouCameFrom.text, globalUser, [self.totalAmount.text intValue], self.descriptField.text];
    
    //NSString *query; = [NSString stringWithFormat:@"update userInfo set '%@' = '%d' where username = '%@';", self.whereYouCameFrom.text, [self.totalAmount.text intValue], globalUser];
    
    // Execute the query.
    [self.dbManager executeQuery:query];
    
    
    
    
    // If the query was successfully executed then pop the view controller.
    if (self.dbManager.affectedRows != 0) {
        
        
        
        NSLog(@"Query was executed successfully. Affected rows = %d", self.dbManager.affectedRows);
        // Pop the view controller.
        [self.navigationController popViewControllerAnimated:YES];
        
        FifthViewController *backOne= [self.storyboard instantiateViewControllerWithIdentifier:@"tabbedView"];
        [self presentViewController:backOne animated:YES completion:nil];
    }
    else{
        NSLog(@"Could not execute the query.");
    }
    
}
@end

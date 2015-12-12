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

NSString *globalFood;
NSString *globalPersonal;
NSString *globalAuto;
NSString *globalMisc;

@implementation AddAmountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //Gives the description text box that light gray default text
    _descript.text = @"Give a brief description.";
    _descript.textColor = [UIColor lightGrayColor];
    _descript.delegate = self;
    
    //sets the category name
    self.whereYouCameFrom.text = self.fnameText;
    
    // Do any additional setup after loading the view, typically from a nib.
    self.totalAmount.delegate = self;
    self.descriptField.delegate = self;
    
    // Initialize the dbManager object.
    self.dbManager = [[DBManager alloc] initWithDatabaseFilename:@"appdb.sql"];
    
    @try {
    
    //////////////////////////////////////////////////////////////////////////////////////////////////
    
    /*
        These next chunks of code do what the indvidual view controllers do but now we are working with
     adding monetary values.  When the user loads the addViewController, it will update the global variables
     with the most recent value stored in the database.  When you run the app, you will notice that it
     says that the query was executed successfully and that 4 rows were affected.  This happens because, as I
     previously mentioned, we are updating the values of all four of the global variables when viewDidLoad is
     called.
    */
        
    NSString *personalData = [NSString stringWithFormat:@"select * from userInfo where username = '%@'", globalUser];
    NSArray *resultsP = [[NSArray alloc] initWithArray:[self.dbManager loadDataFromDB:personalData]];
    globalPersonal = [[resultsP objectAtIndex:0]objectAtIndex:3];
    NSLog(@"Personal: %@", globalPersonal);
    
    //////////////////////////////////////////////////////////////////////////////////////////////////
    
    NSString *foodData = [NSString stringWithFormat:@"select * from userInfo where username = '%@'", globalUser];
    NSMutableArray *resultsF = [[NSMutableArray alloc] initWithArray:[self.dbManager loadDataFromDB:foodData]];
    //Found by using breakpoints
    globalFood = [[resultsF objectAtIndex:0]objectAtIndex:4];
    NSLog(@"Food: %@", globalFood);
    
    //////////////////////////////////////////////////////////////////////////////////////////////////
    
    NSString *autoData = [NSString stringWithFormat:@"select * from userInfo where username = '%@'", globalUser];
    NSMutableArray *resultsA = [[NSMutableArray alloc] initWithArray:[self.dbManager loadDataFromDB:autoData]];
    //Found by using breakpoints
    globalAuto = [[resultsA objectAtIndex:0]objectAtIndex:5];
    NSLog(@"Auto: %@", globalAuto);

    //////////////////////////////////////////////////////////////////////////////////////////////////
    
    NSString *miscData = [NSString stringWithFormat:@"select * from userInfo where username = '%@'", globalUser];
    NSMutableArray *resultsM = [[NSMutableArray alloc] initWithArray:[self.dbManager loadDataFromDB:miscData]];
    //Found by using breakpoints
    globalMisc = [[resultsM objectAtIndex:0]objectAtIndex:6];
    NSLog(@"Misc: %@", globalMisc);
    
    //////////////////////////////////////////////////////////////////////////////////////////////////

    }
    
    @catch (NSException *exception)
    {
        
    }
    
}

- (BOOL) textViewShouldBeginEditing:(UITextView *)textView
{
    //Sets the color for the description text view
    _descript.text = @"";
    _descript.textColor = [UIColor blackColor];
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)addTotal:(UIButton *)sender {
    
    //Prepare the query
    NSString *query = [NSString stringWithFormat:@"update userInfo set '%@'='%d' where username = '%@';",  self.whereYouCameFrom.text, [self.totalAmount.text intValue] + [self.whereYouCameFrom.text intValue], globalUser];
    
    
    
    // Execute the query.
    [self.dbManager executeQuery:query];
    
    
    
    
    // If the query was successfully executed then pop the view controller.
    if (self.dbManager.affectedRows != 0) {
        
        
        //Will print when the given query operates successfully
        NSLog(@"Query was executed successfully. Affected rows = %d", self.dbManager.affectedRows);
        // Pop the view controller.
        [self.navigationController popViewControllerAnimated:YES];
        
        //Sends the user back to the Overall spending page
        FifthViewController *backOne= [self.storyboard instantiateViewControllerWithIdentifier:@"tabbedView"];
        [self presentViewController:backOne animated:YES completion:nil];
    }
    else{
        NSLog(@"Could not execute the query.");
    }
    
}
@end

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
    NSString *query = [NSString stringWithFormat:@"insert * into userInfo(food, description, '%@') values('%@', '%@', '%@') where username = 'Fun'",self.whereYouCameFrom.text, self.totalAmount.text, self.descriptField.text, self.whereYouCameFrom.text];
    
    // Execute the query.
    [self.dbManager executeQuery:query];
    
    
    // If the query was successfully executed then pop the view controller.
    if (self.dbManager.affectedRows != 0) {
        
        
        
        NSLog(@"Query was executed successfully. Affected rows = %d", self.dbManager.affectedRows);
        NSLog(@"%@",query);
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

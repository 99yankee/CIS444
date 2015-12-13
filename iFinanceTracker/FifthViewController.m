//
//  FifthViewController.m
//  iFinanceTracker
//
//  Created by Andy Wu on 11/29/15.
//  Copyright © 2015 Andy Wu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FifthViewController.h"
#import "dbModel.h"
#import "AddAmountViewController.h"
#import "DBManager.h"
#import "LoginViewController.h"
#import "FirstViewController.h"
#import "ThirdViewController.h"
#import "SecondViewController.h"
#import "FourthViewController.h"

//ViewController for Overall
@interface FifthViewController ()
{
    dbModel *_dbModel;
    NSArray * _getItems;
}

@property (nonatomic, strong) DBManager *dbManager;
@property NSString *overallSpent;

@end

NSString *overallTotal;

@implementation FifthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _amountSpent.text = @"0";
    
    _getItems = [[NSArray alloc] init];
    _dbModel = [[dbModel alloc] init];
    _dbModel.delegate = self;
    [_dbModel downloadItems];
    
    // Initialize the dbManager object.
    self.dbManager = [[DBManager alloc] initWithDatabaseFilename:@"appdb.sql"];
 
    //Sets the fields on the Overall Page
    self.personalField.text = globalSumPersonal;
    self.foodField.text = globalSumFood;
    self.autoField.text = globalSumAuto;
    self.miscField.text = globalSumMisc;
    
    //Sums up the total of all 4 global variables and displays in the overall text field
    NSInteger store = [globalSumPersonal integerValue] + [globalSumFood integerValue] + [globalSumAuto integerValue] + [globalSumMisc integerValue];
    overallTotal = [NSString stringWithFormat:@"%ld",(long)store];
    self.amountSpent.text = overallTotal;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)itemsDownloaded:(NSArray *)items
{
    //This method gets called once the items are finished downloading
    _getItems = items;
}



@end

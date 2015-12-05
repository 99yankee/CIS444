//
//  FifthViewController.m
//  iFinanceTracker
//
//  Created by Andy Wu on 11/29/15.
//  Copyright © 2015 Andy Wu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FifthViewController.h"

//ViewController for Overall
@interface FifthViewController ()
@end

@implementation FifthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    //Used code from http://stackoverflow.com/questions/3421182/iphone-development-chart-from-google-api
    //This uses the google api pie chart and displays it
    UIImage *myimage = [UIImage imageWithData: [NSData dataWithContentsOfURL: [NSURL URLWithString: @"http://chart.apis.google.com/chart?chs=350x190&cht=p3&chco=3072F3&chds=-5,100&chd=t:70,10,20&chdl=Cylons%7CHumans%7CCoders&chdlp=b&chl=Cylons%7CHumans%7CCoders&chma=0,10,5,25&chtt=Cylons+vs+Humans+vs+Coders"]]];
    UIImageView *test = [[UIImageView alloc] initWithImage:myimage];
    UIView *myView = [[UIView alloc] initWithFrame:CGRectMake(20.0, 250.0, 1000.0, 1000.0)];
    [myView addSubview:test];
    [self.view addSubview:myView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)viewTransactions:(UIButton *)sender {
    
    //I used code from this website http://hayageek.com/uialertcontroller-example-ios/#simple
    //This is used to pop up an alerter to show the transactions
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:@"Overall Transactions"
                                  message:@"You are using UIAlertController"
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
@end

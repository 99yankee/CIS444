//
//  AddAmountViewController.m
//  iFinanceTracker
//
//  Created by Andy Wu on 11/30/15.
//  Copyright © 2015 Andy Wu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AddAmountViewController.h"


//ViewController for Adding an Amount
@interface AddAmountViewController ()

@property (strong, nonatomic) IBOutlet UITextView *descript;



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



@end

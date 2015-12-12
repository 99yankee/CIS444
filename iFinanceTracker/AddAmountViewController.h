//
//  AddAmountViewController.h
//  iFinanceTracker
//
//  Created by Andy Wu on 11/30/15.
//  Copyright © 2015 Andy Wu. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString *globalFood;
extern NSString *globalPersonal;
extern NSString *globalAuto;



//ViewController for Adding an Amount
@interface AddAmountViewController : UIViewController <UITextFieldDelegate, UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *whereYouCameFrom;
@property (strong, nonatomic)          NSString *fnameText;

@property (weak, nonatomic) IBOutlet UILabel *currentUserAdd;

@property (weak, nonatomic) IBOutlet UITextField *totalAmount;

@property (weak, nonatomic) IBOutlet UITextView *descriptField;
- (IBAction)addTotal:(UIButton *)sender;

@end
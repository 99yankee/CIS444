//
//  PasswordRecoveryViewController.h
//  iFinanceTracker
//
//  Created by Andy Wu on 11/30/15.
//  Copyright © 2015 Andy Wu. All rights reserved.
//

#import <UIKit/UIKit.h>

//ViewController for Password Recovery
@interface PasswordRecoveryViewController : UIViewController <UITextFieldDelegate>


- (IBAction)saveInfo:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *userBox;
@property (weak, nonatomic) IBOutlet UITextField *passBox;
@property (weak, nonatomic) IBOutlet UITextField *emailBox;


@end

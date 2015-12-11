//
//  LoginViewController.h
//  iFinanceTracker
//
//  Created by Andy Wu on 11/30/15.
//  Copyright © 2015 Andy Wu. All rights reserved.
//

#import <UIKit/UIKit.h>

//ViewController for Login
@interface LoginViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *encryptPass;
- (IBAction)signIn:(UIButton *)sender;


@end

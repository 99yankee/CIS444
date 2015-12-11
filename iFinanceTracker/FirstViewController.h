//
//  FirstViewController.h
//  iFinanceTracker
//
//  Created by Andy Wu on 11/21/15.
//  Copyright © 2015 Andy Wu. All rights reserved.
//

#import <UIKit/UIKit.h>


//ViewController for Personal
@interface FirstViewController : UIViewController <UITextViewDelegate>

- (IBAction)viewPersonalTransacts:(UIButton *)sender;

@property (strong, nonatomic) IBOutlet UILabel *amountSpentPersonal;


@end


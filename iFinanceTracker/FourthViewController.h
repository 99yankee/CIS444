//
//  FourthViewController.h
//  iFinanceTracker
//
//  Created by Andy Wu on 11/21/15.
//  Copyright © 2015 Andy Wu. All rights reserved.
//

#import <UIKit/UIKit.h>

//ViewController for Misc.
@interface FourthViewController : UIViewController

- (IBAction)viewMiscTransacts:(UIButton *)sender;

@property (strong, nonatomic) IBOutlet UILabel *amountSpentMisc;

@end

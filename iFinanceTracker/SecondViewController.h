
//
//  SecondViewController.h
//  iFinanceTracker
//
//  Created by Andy Wu on 11/21/15.
//  Copyright © 2015 Andy Wu. All rights reserved.
//

#import <UIKit/UIKit.h>

//ViewController for Food
@interface SecondViewController : UIViewController


- (IBAction)viewFoodTransacts:(UIButton *)sender;

@property (strong, nonatomic) IBOutlet UILabel *amountSpentFood;
@property (weak, nonatomic) IBOutlet UILabel *currentUserFood;



@end


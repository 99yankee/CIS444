//
//  ThirdViewController.h
//  iFinanceTracker
//
//  Created by Andy Wu on 11/21/15.
//  Copyright © 2015 Andy Wu. All rights reserved.
//

#import <UIKit/UIKit.h>

//ViewController for Auto & Transportatioin
@interface ThirdViewController : UIViewController


@property (strong, nonatomic) IBOutlet UILabel *amountSpentAuto;

@property (weak, nonatomic) IBOutlet UILabel *currentUserAuto;

extern NSString *globalSumAuto;

@end

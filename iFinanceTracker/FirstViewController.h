//
//  FirstViewController.h
//  iFinanceTracker
//
//  Created by Andy Wu on 11/21/15.
//  Copyright © 2015 Andy Wu. All rights reserved.
//

#import <UIKit/UIKit.h>


extern NSString *globalSumPersonal;

//ViewController for Personal
@interface FirstViewController : UIViewController <UITextViewDelegate>


@property (strong, nonatomic) IBOutlet UILabel *amountSpentPersonal;

@property (weak, nonatomic) IBOutlet UILabel *currentUserPersonal;



@end


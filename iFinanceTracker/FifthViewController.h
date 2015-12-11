//
//  FifthViewController.h
//  iFinanceTracker
//
//  Created by Andy Wu on 11/29/15.
//  Copyright © 2015 Andy Wu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "dbModel.h"

//ViewController for Overall
@interface FifthViewController : UIViewController <dbModelProtocol> 

- (IBAction)viewOverallTransacts:(UIButton *)sender;

@property (strong, nonatomic) IBOutlet UILabel *amountSpent;

@property (weak, nonatomic) IBOutlet UILabel *currentUserOverall;

@property (strong, nonatomic) NSString *fnameText;

-(void) receivedNotification:(NSNotification*) notify;

-(void) receiveTestNotify: (NSNotification *) notification;

@end

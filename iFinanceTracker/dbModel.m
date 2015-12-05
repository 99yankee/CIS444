//
//  dbModel.m
//  iFinanceTracker
//
//  Created by Steven Lyktey on 12/5/15.
//  Copyright © 2015 Andy Wu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "dbModel.h"

@interface dbModel()
{
    NSMutableData *_downloadedData;

}

@end

@implementation dbModel

- (void)downloadItems
{
    //Download JSON
    NSURL *jsonFileUrl = [NSURL URLWithString:@"http://localhost:8888/services.php"];
    
    
    
}



@end

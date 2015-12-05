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
    
    //Create the Request
    //REMOVE IF OTHER CODE WORKS SUCCESSFULLY
    //NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:jsonFileUrl];
    
    //Create the URL Connection Session
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithURL:jsonFileUrl
            completionHandler:^(NSData *data,
                                NSURLResponse *response,
                                NSError *error) {
                // handle response
                
            }] resume];
    
    //REMOVE IF OTHER CODE WORKS SUCCESSFULLY
    //NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    //NSURLSession *session = [NSURLSession sessionWithConfiguration:urlRequest delegate:self delegateQueue: nil];
}

#pragma mark NSURLConnectionDataProtocol Methods

- (void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    _downloadedData = [[NSMutableData alloc] init];
}

- (void) connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [_downloadedData appendData:data];
}

-(void) connectionDidFinishLoading:(NSURLConnection *)connection
{
    //Array that will hold the incoming data
    NSMutableArray *dataArray = [[NSMutableArray alloc] init];
    
    //Time to parse the JSON
    NSError *error;
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData:_downloadedData options:NSJSONReadingAllowFragments error:&error];
    
    //Loops through the JSON objects
    for (int i =0; i < jsonArray.count; i++)
    {
        NSDictionary *jsonElement = jsonArray[i];
        
        dbModel *newdata = [[dbModel alloc]init];
        newdata.username = jsonElement[@"username"];
        newdata.password = jsonElement[@"password"];
        newdata.email = jsonElement[@"email"];
        newdata.describe =  jsonElement[@"description"];
        newdata.overall = jsonElement[@"overall"];
        newdata.monthly = jsonElement[@"monthly"];
        newdata.personal = jsonElement[@"personal"];
        newdata.food = jsonElement[@"food"];
        newdata.autotrans = jsonElement[@"auto"];
        newdata.misc = jsonElement[@"misc"];
        
        //Adds new data to the array responsible for holding the data
        [dataArray addObject:newdata];
        
    }
    
    // Ready to notify delegate that data is ready and pass back items
    if (self.delegate)
    {
        [self.delegate itemsDownloaded:dataArray];
    }
    
}







@end

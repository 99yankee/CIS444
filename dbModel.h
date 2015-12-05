//
//  dbModel.h
//  iFinanceTracker
//
//  Created by Steven Lyktey on 12/5/15.
//  Copyright © 2015 Andy Wu. All rights reserved.
//

#ifndef dbModel_h
#define dbModel_h


#import <Foundation/Foundation.h>

@protocol dbModelProtocol <NSObject>

- (void) itemsDownloaded:(NSArray *)items;

@end

@interface dbModel : NSObject <NSURLConnectionDataDelegate>

@property (nonatomic, strong) NSString * username;
@property (nonatomic, strong) NSString * password;
@property (nonatomic, strong) NSString * email;
@property (nonatomic, strong) NSString * describe;
@property (nonatomic, strong) NSString * overall;
@property (nonatomic, strong) NSString * monthly;
@property (nonatomic, strong) NSString * personal;
@property (nonatomic, strong) NSString * food;
@property (nonatomic, strong) NSString * autotrans;
@property (nonatomic, strong) NSString * misc;
@property (nonatomic, weak) id<dbModelProtocol> delegate;

- (void)downloadItems;

@end


#endif /* dbModel_h */

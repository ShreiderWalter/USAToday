//
//  USAManager.h
//  USATODAY
//
//  Created by Admin on 23.11.14.
//  Copyright (c) 2014 wackycoders. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "USAManagerDelegate.h"
#import "USACommunicatorDelegate.h"

@class USACommunicator;

@interface USAManager : NSObject<USACommunicatorDelegate>
@property(strong, nonatomic)USACommunicator * communicator;
@property(weak, nonatomic)id<USAManagerDelegate> delegate;

-(void)fetchArticles:(int)number a:(NSString *)category;
@end

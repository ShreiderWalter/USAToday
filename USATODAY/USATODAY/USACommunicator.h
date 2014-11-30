//
//  USACommunicator.h
//  USATODAY
//
//  Created by Admin on 23.11.14.
//  Copyright (c) 2014 wackycoders. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol USACommunicatorDelegate;

@interface USACommunicator : NSObject
@property(weak, nonatomic)id<USACommunicatorDelegate> delegate;
-(void)fetchArticles:(int)number a:(NSString *)category;
@end

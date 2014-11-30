//
//  USACommunicatorDelegate.h
//  USATODAY
//
//  Created by Admin on 23.11.14.
//  Copyright (c) 2014 wackycoders. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol USACommunicatorDelegate
- (void)receivedArticlesJSON:(NSData *)objectNotation;
- (void)fetchingArticlesFailedWithError:(NSError *)error;
@end

//
//  USAManagerDelegate.h
//  USATODAY
//
//  Created by Admin on 23.11.14.
//  Copyright (c) 2014 wackycoders. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol USAManagerDelegate
-(void)didReceiveArticles:(NSArray *) articles;
-(void)fetchingArticlesFailedWithError:(NSError *)error;

@end

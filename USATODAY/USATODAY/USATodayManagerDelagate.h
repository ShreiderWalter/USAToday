//
//  USATodayManagerDelagate.h
//  USATODAY
//
//  Created by Admin on 27.10.14.
//  Copyright (c) 2014 wackycoders. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface USATodayManagerDelagate : NSObject
-(void)didRecieveNews:(NSArray *)news;
-(void)fetchingNewsFailedWithError:(NSError *)error;
@end

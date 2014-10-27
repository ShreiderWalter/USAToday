//
//  USATodayCommunicator.h
//  USATODAY
//
//  Created by Admin on 27.10.14.
//  Copyright (c) 2014 wackycoders. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "USATodayCommunicatorDelegate.h"

@interface USATodayCommunicator : NSObject
@property(weak, nonatomic)id<USATodayCommunicatorDelegate> delegate;
-(void)getNewsAtPage:(int)pageCount;
@end

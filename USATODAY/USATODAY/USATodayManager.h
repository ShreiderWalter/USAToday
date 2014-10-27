//
//  USATodayManager.h
//  USATODAY
//
//  Created by Admin on 27.10.14.
//  Copyright (c) 2014 wackycoders. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "USATodayManagerDelagate.h"
#import "USATodayCommunicator.h"

@class USATodayCommunicator;

@interface USATodayManager : NSObject<USATodayCommunicatorDelegate>

@property(strong, nonatomic)USATodayCommunicator * communicator;
//@property(weak, nonatomic) id<USATodayManagerDelagate> delegate;

@end

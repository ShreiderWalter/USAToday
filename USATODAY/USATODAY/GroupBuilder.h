//
//  GroupBuilder.h
//  USATODAY
//
//  Created by Admin on 27.10.14.
//  Copyright (c) 2014 wackycoders. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GroupBuilder : NSObject
+ (NSArray *)groupsFromJSON:(NSData *)objectNotation error:(NSError **)error;
@end

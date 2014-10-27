//
//  USATodayCommunicator.m
//  USATODAY
//
//  Created by Admin on 27.10.14.
//  Copyright (c) 2014 wackycoders. All rights reserved.
//

#import "USATodayCommunicator.h"

@implementation USATodayCommunicator

-(void)getNewsAtPage:(int)pageCount{
    NSString * urlAsString = [NSString stringWithFormat:@"http://api.usatoday.com/open/articles/topnews/sports?count=10&csp=1&days=1&page=1&encoding=json&api_key=9dmqfb3cx7hr7dwqc58uvwfu"];
    NSURL * url = [[NSURL alloc] initWithString:urlAsString];
    
    [NSURLConnection sendAsynchronousRequest:[[NSURLRequest alloc] initWithURL:url] queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        if(connectionError){
            [self.delegate fetchingGroupsFailedWithError:connectionError];
        } else {
            [self.delegate receivedGroupsJSON:data];
        }
    }];
}

@end

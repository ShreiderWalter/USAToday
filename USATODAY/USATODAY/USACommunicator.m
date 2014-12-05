//
//  USACommunicator.m
//  USATODAY
//
//  Created by Admin on 23.11.14.
//  Copyright (c) 2014 wackycoders. All rights reserved.
//

#import "USACommunicator.h"
#import "USACommunicatorDelegate.h"

#define API_KEY @"9dmqfb3cx7hr7dwqc58uvwfu"
#define PAGE_COUNT 1

@implementation USACommunicator

-(void)fetchArticles:(int)number a:(NSString *)category{
    NSString * urlAsString = [NSString stringWithFormat:[[@"http://api.usatoday.com/open/articles/topnews/" stringByAppendingString:category] stringByAppendingString:@"?count=%i&days=%i&page=%i&encoding=json&api_key=%@"], number, 10, PAGE_COUNT, API_KEY];
    NSURL * url = [[NSURL alloc] initWithString:urlAsString];
    
    NSLog(@"%@", urlAsString);
    
    [NSURLConnection sendAsynchronousRequest:[[NSURLRequest alloc] initWithURL:url] queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse * response, NSData * data, NSError * error){
        if(error){
            [self.delegate fetchingArticlesFailedWithError:error];
        } else {
            [self.delegate receivedArticlesJSON:data];
        }
    }];
}
@end

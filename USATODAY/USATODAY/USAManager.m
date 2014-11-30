//
//  USAManager.m
//  USATODAY
//
//  Created by Admin on 23.11.14.
//  Copyright (c) 2014 wackycoders. All rights reserved.
//

#import "USAManager.h"
#import "USACommunicator.h"
#import "ArticleBuilder.h"

@implementation USAManager
-(void)fetchArticles:(int)number a:(NSString *)category{
    [self.communicator fetchArticles:number a:category];
}

#pragma mark - USACommunicationDelegate
-(void)receivedArticlesJSON:(NSData *)objectNotation{
    NSError * error = nil;
    NSArray * articles = [ArticleBuilder articlesFromJSON:objectNotation error:&error];
    
    if(error != nil){
        [self.delegate fetchingArticlesFailedWithError:error];
    } else {
        [self.delegate didReceiveArticles:articles];
    }
}

-(void)fetchingArticlesFailedWithError:(NSError *)error{
    [self.delegate fetchingArticlesFailedWithError:error];
}


@end

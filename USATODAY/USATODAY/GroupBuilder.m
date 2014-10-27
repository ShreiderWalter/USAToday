//
//  GroupBuilder.m
//  USATODAY
//
//  Created by Admin on 27.10.14.
//  Copyright (c) 2014 wackycoders. All rights reserved.
//

#import "GroupBuilder.h"
#import "SubArticle.h"

@implementation GroupBuilder

+(NSArray *)groupsFromJSON:(NSData *)objectNotation error:(NSError *__autoreleasing *)error{
    NSError * localError = nil;
    NSDictionary * parsedObject = [NSJSONSerialization JSONObjectWithData:objectNotation options:0 error:&localError];
    
    if(localError != nil){
        *error = localError;
        return nil;
    }
    
    NSMutableArray * news = [[NSMutableArray alloc] init];
    NSArray * results = [parsedObject valueForKey:@"results"];
    
    for(NSDictionary *groupDic in results){
        SubArticle * subArticle = [[SubArticle alloc] init];
        for(NSString * key in groupDic){
            if([subArticle respondsToSelector:NSSelectorFromString(key)]){
                [subArticle setValue:[groupDic valueForKey:key] forKey:key];
            }
        }
        [news addObject:subArticle];
    }
    return news;
}

@end

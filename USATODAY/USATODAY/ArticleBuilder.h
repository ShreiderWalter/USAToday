//
//  ArticleBuilder.h
//  USATODAY
//
//  Created by Admin on 23.11.14.
//  Copyright (c) 2014 wackycoders. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArticleBuilder : NSObject
+(NSArray *)articlesFromJSON:(NSData *)objectNotation error:(NSError **)error;
@end

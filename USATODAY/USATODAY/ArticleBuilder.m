//
//  ArticleBuilder.m
//  USATODAY
//
//  Created by Admin on 23.11.14.
//  Copyright (c) 2014 wackycoders. All rights reserved.
//

#import "ArticleBuilder.h"
#import "Article.h"
#import "HTMLParser.h"

@implementation ArticleBuilder
+(NSArray *)articlesFromJSON:(NSData *)objectNotation error:(NSError *__autoreleasing *)error{
    NSError *localError = nil;
    NSDictionary * parseObject = [NSJSONSerialization JSONObjectWithData:objectNotation options:NSJSONReadingMutableLeaves error:&localError];
    
    if(localError != nil){
        *error = localError;
        return nil;
    }
    
    NSMutableArray * groups = [[NSMutableArray alloc] init];
    NSArray * results = [parseObject valueForKey:@"stories"];
    NSLog(@"Count %d", results.count);
    
    for(NSDictionary *groupDic in results){
        Article * article  = [[Article alloc]  init];
        
        for(NSString * key in groupDic){
            if([article respondsToSelector:NSSelectorFromString(key)]){
                [article setValue:[groupDic valueForKey:key] forKey:key];
            }
        }
        NSURL * url = [NSURL URLWithString:article.link];
        NSString * webData = [NSString stringWithContentsOfURL:url];
        
        NSError *error = nil;
        //NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"(<img\\s[\\s\\S]*?src\\s*?=\\s*?['\"](.*?)['\"][\\s\\S]*?>)+?" options:NSRegularExpressionCaseInsensitive error:&error];
        
        /*NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"(<?src=\\s*?['\"](.*?).(png|jpg)['\"][\\s\\S]*?>)+?" options:NSRegularExpressionCaseInsensitive error:&error];
        
        NSMutableArray * currentImgTags = [[NSMutableArray alloc] init];
        [regex enumerateMatchesInString:webData options:0 range:NSMakeRange(0, [webData length])usingBlock:^(NSTextCheckingResult *result, NSMatchingFlags flags, BOOL *stop) {
            NSString *img = [webData substringWithRange:[result rangeAtIndex:2]];
            img = [[img stringByAppendingString:@"."] stringByAppendingString:[webData substringWithRange:[result rangeAtIndex:3]]];
            img = [img stringByReplacingOccurrencesOfString:@"amp;" withString:@""];
            [currentImgTags addObject:img];
            NSLog(@"img src %@", img);
        }];*/
        
        NSMutableArray * currentImgTags = [[NSMutableArray alloc] init];
        HTMLParser * parser = [[HTMLParser alloc] initWithString:webData error:&error];
        
        if(error){
            NSLog(@"Error: %@", error);
        }
        
        HTMLNode * bodyNode = [parser body];
        NSArray  * inputNodes = [bodyNode findChildTags:@"div"];
        
        HTMLNode * articleDiv;
        
        for(HTMLNode * inputNode in inputNodes){
            if([[inputNode getAttributeNamed:@"itemprop"] isEqualToString:@"articleBody"]){
                articleDiv = inputNode;
                break;
            }
        }
        
        NSMutableArray * text = [[NSMutableArray alloc] init];
        inputNodes = [articleDiv findChildTags:@"p"];
        for(HTMLNode * inputNode in inputNodes){
            NSString * currentText = [inputNode contents];
            if(currentText != nil){
                [text addObject:currentText];
            }
        }
        
        inputNodes = [articleDiv findChildTags:@"img"];
        
        for(HTMLNode * inputNode in inputNodes){
            NSString * currentSRC = [inputNode getAttributeNamed:@"src"];
            if(currentSRC != nil){
                [currentImgTags addObject:currentSRC];
            }
            //NSLog(@"%@", [inputNode getAttributeNamed:@"src"]);
        }
        
        if([currentImgTags count] > 0){
            NSURL * imgUrl = [NSURL URLWithString:[currentImgTags objectAtIndex:0]];
            NSData * imgData = [NSData dataWithContentsOfURL:imgUrl];
            article.image = [UIImage imageWithData:imgData];
        }
        
        if([text count] > 0){
            article.text = [[NSString alloc] init];
            for(NSString * str in text){
                article.text = [[article.text stringByAppendingString:str] stringByAppendingString:@"\n"];
            }
        }
        [groups addObject:article];
        
    }
    return groups;
}
@end

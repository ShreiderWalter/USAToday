//
//  SubArticle.h
//  USATODAY
//
//  Created by Admin on 27.10.14.
//  Copyright (c) 2014 wackycoders. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SubArticle : NSObject
@property(weak, nonatomic)NSString * title;
@property(weak, nonatomic)NSString * description;
@property(strong, nonatomic)NSString * value;

-(void)setValue:(NSString *)value;
@end

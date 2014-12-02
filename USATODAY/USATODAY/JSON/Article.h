//
//  Article.h
//  USATODAY
//
//  Created by Admin on 23.11.14.
//  Copyright (c) 2014 wackycoders. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Article : NSObject
@property(strong, nonatomic) NSString * link;
@property(strong, nonatomic) NSString * description;
@property(strong, nonatomic) NSString * title;

@property(strong, nonatomic) UIImage * image;

@property(strong, nonatomic) NSString * text;
@property(strong, nonatomic) NSString * categoryImage;
@end

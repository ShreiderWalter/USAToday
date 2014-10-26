//
//  Constants.h
//  USATODAY
//
//  Created by Admin on 21.10.14.
//  Copyright (c) 2014 wackycoders. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Constants : NSObject

//Main Array
@property()NSMutableArray * CELLS_Description;

//Main Table View Static
+(NSString *) getNews;
+(NSString *) getSport;
+(NSString *) getLife;
+(NSString *) getMoney;
+(NSString *) getTech;
+(NSString *) getTravel;
+(NSString *) getOpinion;

//Colors hex
+(NSString *) getNewsColor;
+(NSString *) getSportColor;
+(NSString *) getLifeColor;
+(NSString *) getMoneyColor;
+(NSString *) getTechColor;
+(NSString *) getTravelColor;
+(NSString *) getOpinionColor;

@end

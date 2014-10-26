//
//  Constants.m
//  USATODAY
//
//  Created by Admin on 21.10.14.
//  Copyright (c) 2014 wackycoders. All rights reserved.
//

#import "Constants.h"

@implementation Constants


//Table view rows
static NSString * const NEWS = @"News";
static NSString * const SPORT = @"Sport";
static NSString * const LIFE = @"Life";
static NSString * const MONEY = @"Money";
static NSString * const TECH = @"Tech";
static NSString * const TRAVEL = @"Travel";
static NSString * const OPINION = @"Opinion";

//Table view rows colors
static NSString * const NEWS_COLOR = @"#3366FF";
static NSString * const SPORT_COLOR = @"#CC33FF";
static NSString * const LIFE_COLOR = @"#FF33CC";
static NSString * const MONEY_COLOR = @"#FF3366";
static NSString * const TECH_COLOR = @"#33FFCC";
static NSString * const TRAVEL_COLOR = @"#F5B800";
static NSString * const OPINION_COLOR = @"#FFCC33";


+(NSString *)getNews{
    return NEWS;
}

+(NSString *)getSport{
    return SPORT;
}

+(NSString *)getLife{
    return LIFE;
}

+(NSString *)getMoney{
    return MONEY;
}

+(NSString *)getTech{
    return TECH;
}

+(NSString *)getTravel{
    return TRAVEL;
}

+(NSString *)getOpinion{
    return OPINION;
}

//Colors getters
+(NSString *)getNewsColor{
    return NEWS_COLOR;
}

+(NSString *)getSportColor{
    return SPORT_COLOR;
}

+(NSString *)getLifeColor{
    return LIFE_COLOR;
}

+(NSString *)getMoneyColor{
    return MONEY_COLOR;
}

+(NSString *)getTechColor{
    return TECH_COLOR;
}

+(NSString *)getTravelColor{
    return TRAVEL_COLOR;
}

+(NSString *)getOpinionColor{
    return OPINION_COLOR;
}
@end

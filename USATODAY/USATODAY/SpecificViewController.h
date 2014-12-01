//
//  SpecificViewController.h
//  USATODAY
//
//  Created by Admin on 25.10.14.
//  Copyright (c) 2014 wackycoders. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Article.h"

@interface SpecificViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIImageView *mainImageView;

@property(strong, nonatomic) Article * currentArticle;;
@end

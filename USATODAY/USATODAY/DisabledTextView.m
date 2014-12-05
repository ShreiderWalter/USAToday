//
//  DisabledTextView.m
//  USATODAY
//
//  Created by Admin on 05.12.14.
//  Copyright (c) 2014 wackycoders. All rights reserved.
//

#import "DisabledTextView.h"

@implementation DisabledTextView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(BOOL)canBecomeFirstResponder{
    return NO;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

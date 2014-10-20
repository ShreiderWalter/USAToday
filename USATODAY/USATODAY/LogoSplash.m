//
//  LogoSplash.m
//  USATODAY
//
//  Created by Admin on 20.10.14.
//  Copyright (c) 2014 wackycoders. All rights reserved.
//

#import "LogoSplash.h"

@interface LogoSplash ()

@end

@implementation LogoSplash

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _logoImage = [UIImage imageNamed:@"google_images.jpg"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [UIView animateWithDuration:1.0 delay:0.2 options:0 animations:^{
        CGRect frame = self.logoImage.frame;
        frame.origin.y = 0;
        self.logoImage.frame = frame;
    }completion:^(BOOL completed) {
        [self performSegueWithIdentifier:@"splash" sender:self];
    }];
}

@end

@interface SplashSeque : UIStoryboardSegue
@end

@implementation SplashSeque

-(void)perform{
    [[self sourceViewController] presentModalViewController:[self destinationViewController] animated:NO];
}

@end
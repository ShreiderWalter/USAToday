//
//  SpecificViewController.m
//  USATODAY
//
//  Created by Admin on 25.10.14.
//  Copyright (c) 2014 wackycoders. All rights reserved.
//

#import "SpecificViewController.h"

@interface SpecificViewController ()

@end

@implementation SpecificViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(BOOL)prefersStatusBarHidden{
    return TRUE;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImage * viewImage = [UIImage imageNamed:@"google_images.jpg"];
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    screenRect.size.height = screenRect.size.height / 3;
    self.mainImageView.image = viewImage;
    [self.mainImageView setFrame:screenRect];
    [_textView setEditable:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

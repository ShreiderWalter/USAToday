//
//  MainViewController.h
//  USATODAY
//
//  Created by Admin on 09.10.14.
//  Copyright (c) 2014 wackycoders. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "USAManagerDelegate.h"

@interface MainViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, USAManagerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *mainImageView;
@property (weak, nonatomic) IBOutlet UITableView *tableList;
@property() UINavigationController * currentNavController;
@property(nonatomic) NSString * category;
@end

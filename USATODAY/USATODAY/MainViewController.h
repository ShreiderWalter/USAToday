//
//  MainViewController.h
//  USATODAY
//
//  Created by Admin on 09.10.14.
//  Copyright (c) 2014 wackycoders. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *mainImageView;
@property (weak, nonatomic) IBOutlet UITableView *tableList;
@end

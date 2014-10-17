//
//  ChoosBarViewController.h
//  USATODAY
//
//  Created by Admin on 17.10.14.
//  Copyright (c) 2014 wackycoders. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChoosBarViewController : UIViewController<UITableViewDataSource>
@property(strong, nonatomic) NSMutableArray * array;
@property (weak, nonatomic) IBOutlet UITableView *DynamicTable;
@property (weak, nonatomic) IBOutlet UITableView *StaticTable;

@end

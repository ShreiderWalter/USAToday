//
//  ChoosBarViewController.h
//  USATODAY
//
//  Created by Admin on 17.10.14.
//  Copyright (c) 2014 wackycoders. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChoosBarViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
@property(strong, nonatomic) NSMutableArray * array;
@property(strong, nonatomic) NSMutableArray * arrayColors;

//SubView Data
@property(strong, nonatomic) NSMutableArray * arrayNews;
@property(strong, nonatomic) NSMutableArray * arraySports;
@property(strong, nonatomic) NSMutableArray * arrayLife;
@property(strong, nonatomic) NSMutableArray * arrayMoney;
@property(strong, nonatomic) NSMutableArray * arrayTech;
@property(strong, nonatomic) NSMutableArray * arrayTravel;
@property(strong, nonatomic) NSMutableArray * arrayOpinion;

@property(strong, nonatomic) NSMutableArray * arrayCurrent;


@property (weak, nonatomic) IBOutlet UITableView *StaticTable;
@property (weak, nonatomic) IBOutlet UITableView *dynamicTable;
-(UIColor *)colorFromHexString;
@end

@interface SubViewTableController : NSObject<UITableViewDelegate, UITableViewDataSource>
@property(strong, nonatomic) NSMutableArray * array;
@property(strong, nonatomic) UIColor * cellColor;
@property() CGFloat rowHeight;
@property() UINavigationController * currentNavController;
@end

//
//  ChoosBarViewController.m
//  USATODAY
//
//  Created by Admin on 17.10.14.
//  Copyright (c) 2014 wackycoders. All rights reserved.
//

#import "ChoosBarViewController.h"

@interface ChoosBarViewController ()
@property()CGFloat rowHeight;
@end

@implementation ChoosBarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.array = [[NSMutableArray alloc] initWithObjects:@"NEWS", @"SPORTS", @"LIFE", @"MONEY", @"TECH", @"TRAVEL", @"OPINION", nil];
        CGRect screenSize = [[UIScreen mainScreen] bounds];
        //_rowHeight = screenSize.size.height / 7 - self.navigationController.view.bounds.size.height; //+ screenSize.size.height / 128;
    }
    return self;
}

-(BOOL)prefersStatusBarHidden{
    return TRUE;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.StaticTable.scrollEnabled = FALSE;
    CGRect screenSize = [[UIScreen mainScreen] bounds];
    _rowHeight = screenSize.size.height / 7.5; //- self.navigationController.view.bounds.size.height / 7;
    [self.StaticTable setDataSource:self];
    [self.StaticTable setDelegate:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return _rowHeight;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_array count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellIdentifier = @"Cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil){
        //cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewStylePlain reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [_array objectAtIndex:indexPath.row];
    
    
    [cell setBackgroundColor:[UIColor grayColor]];
    UIView * backgroundView = [[UIView alloc] init];
    [backgroundView setBackgroundColor:[UIColor purpleColor]];
    [cell setSelectedBackgroundView:backgroundView];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

@end

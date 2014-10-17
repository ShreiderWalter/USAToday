//
//  ChoosBarViewController.m
//  USATODAY
//
//  Created by Admin on 17.10.14.
//  Copyright (c) 2014 wackycoders. All rights reserved.
//

#import "ChoosBarViewController.h"
#import "SizeableTableViewCell.h"

@interface ChoosBarViewController ()

@end

@implementation ChoosBarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.array = [[NSMutableArray alloc] initWithObjects:@"NEWS", @"SPORTS", @"LIFE", @"MONEY", @"TECH", @"TRAVEL", @"OPINION", nil];
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
    [self.StaticTable setDataSource:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_array count];
}



-(SizeableTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellIdentifier = @"Cell";
    SizeableTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil){
        //cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell = [[SizeableTableViewCell alloc] initWithStyle:UITableViewStyleGrouped reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [_array objectAtIndex:indexPath.row];
    //cell.detailTextLabel.text = @"More text";
    //cell.imageView.image = [UIImage imageNamed:@"google_images.jpg"];
    
    
    //For sizeable cell
    CGRect frame = [[UIScreen mainScreen] bounds];
    //frame.size.height = frame.size.height / 7;
    [cell setFrame:frame];
    
    [cell setBackgroundColor:[UIColor grayColor]];
    UIView * backgroundView = [[UIView alloc] init];
    [backgroundView setBackgroundColor:[UIColor purpleColor]];
    [cell setSelectedBackgroundView:backgroundView];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}



@end

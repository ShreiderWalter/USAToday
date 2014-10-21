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
@property(strong, nonatomic)SubViewTableController * subViewDelegateImplementation;
@end

@implementation ChoosBarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        self.array = [[NSMutableArray alloc] initWithObjects:@"NEWS", @"SPORTS", @"LIFE", @"MONEY", @"TECH", @"TRAVEL", @"OPINION", nil];
        
        self.arrayColors = [[NSMutableArray alloc] initWithObjects:@"#3366FF", @"#CC33FF", @"#FF33CC", @"#FF3366", @"#33FFCC", @"#F5B800", @"#FFCC33", nil];
        
        _subViewDelegateImplementation = [[SubViewTableController alloc] init];
        UIColor *currentColor = [self colorFromHexString:[_arrayColors objectAtIndex:0]];
        [_subViewDelegateImplementation setCellColor:currentColor];
        [_subViewDelegateImplementation setArray:_array];

    }
    return self;
}

-(UIColor *)colorFromHexString:(NSString *)hexToUse{
    unsigned rgbColor = 0;
    NSScanner * scanner = [NSScanner scannerWithString:hexToUse];
    [scanner setScanLocation:1];
    [scanner scanHexInt:&rgbColor];
    return [UIColor colorWithRed:((rgbColor & 0xFF0000) >> 16)/255.0 green:((rgbColor & 0xFF00) >> 8)/255.0 blue:(rgbColor & 0xFF)/255.0 alpha:1.0];
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
    [_subViewDelegateImplementation setRowHeight:_rowHeight];
    [self.StaticTable setDataSource:self];
    [self.StaticTable setDelegate:self];
    [self.dynamicTable setDelegate:_subViewDelegateImplementation];
    [self.dynamicTable setDataSource:_subViewDelegateImplementation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIColor * currentColor = [self colorFromHexString:[_arrayColors objectAtIndex:indexPath.row]];
    [_subViewDelegateImplementation setCellColor:currentColor];
    [self.dynamicTable reloadData];
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
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [_array objectAtIndex:indexPath.row];
    
    [cell setBackgroundColor:[UIColor grayColor]];
    UIView * backgroundView = [[UIView alloc] init];
    
    UIColor *currentColor = [self colorFromHexString:[_arrayColors objectAtIndex:indexPath.row]];
    [backgroundView setBackgroundColor:currentColor];
    [cell setSelectedBackgroundView:backgroundView];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    if(indexPath.row == 0){
        [tableView selectRowAtIndexPath:indexPath animated:TRUE scrollPosition:UITableViewScrollPositionNone];
        [[tableView delegate] tableView:tableView didSelectRowAtIndexPath:indexPath];
    }
    return cell;
}

@end

@implementation SubViewTableController

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellIdentifier = @"SubCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [_array objectAtIndex:indexPath.row];
    
    [cell setBackgroundColor:self.cellColor];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
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

@end

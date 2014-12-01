//
//  ChoosBarViewController.m
//  USATODAY
//
//  Created by Admin on 17.10.14.
//  Copyright (c) 2014 wackycoders. All rights reserved.
//

#import "ChoosBarViewController.h"
#import "Constants.h"
#import "SpecificViewController.h"
#import "MainViewController.h"

@interface ChoosBarViewController ()
@property()CGFloat rowHeight;
@property(strong, nonatomic)SubViewTableController * subViewDelegateImplementation;


@end

@implementation ChoosBarViewController

static NSMutableArray * COPY_OF_CELLS;

static NSArray * NEWS_CELL;
static NSArray * SPORT_CELL;
static NSArray * LIFE_CELL;
static NSArray * MONEY_CELL;
static NSArray * TECH_CELL;
static NSArray * TRAVEL_CELL;
static NSArray * OPINION_CELL;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        
        NEWS_CELL = [[NSArray alloc] initWithObjects:/*[NSString stringWithFormat:@"Weather"], [NSString stringWithFormat:@"Snapshot Polls"],*/ [NSString stringWithFormat:@"Nation"], /*[NSString stringWithFormat:@"Elections"],*/ [NSString stringWithFormat:@"World"], /*[NSString stringWithFormat:@"Washington"],*/ nil];
        
        
        SPORT_CELL = [[NSArray alloc] initWithObjects:/*[NSString stringWithFormat:@"Scores"], [NSString stringWithFormat:@"Day in Sports"],*/ [NSString stringWithFormat:@"NFL"], /*[NSString stringWithFormat:@"NCAAF"], [NSString stringWithFormat:@"NCAAB"],*/ [NSString stringWithFormat:@"MLB"], [NSString stringWithFormat:@"NBA"], [NSString stringWithFormat:@"NHL"], /*[NSString stringWithFormat:@"NASCAR"], [NSString stringWithFormat:@"UFC"],*/ [NSString stringWithFormat:@"Golf"], /*[NSString stringWithFormat:@"Tennis"],*/ [NSString stringWithFormat:@"Soccer"], /*[NSString stringWithFormat:@"Boxing"],*/ [NSString stringWithFormat:@"Motor Sports"], nil];
        
        LIFE_CELL = [[NSArray alloc] initWithObjects:/*[NSString stringWithFormat:@"Day in Celebrities"], [NSString stringWithFormat:@"Snapshot Polls"],*/ [NSString stringWithFormat:@"People"], /*[NSString stringWithFormat:@"Movies"],*/ [NSString stringWithFormat:@"Music"], /*[NSString stringWithFormat:@"TV"],*/ [NSString stringWithFormat:@"Books"], nil];
        
        
        MONEY_CELL = [[NSArray alloc] initWithObjects:[NSString stringWithFormat:@"Top Stories"], /*[NSString stringWithFormat:@"Portfolio Tracker"], [NSString stringWithFormat:@"Snapshot Polls"], [NSString stringWithFormat:@"Business"], [NSString stringWithFormat:@"Personal Finance"], [NSString stringWithFormat:@"Cars"],*/ nil];
        
        TECH_CELL = [[NSArray alloc] initWithObjects:[NSString stringWithFormat:@"Top Stories"], /*[NSString stringWithFormat:@"Personal Tech"], [NSString stringWithFormat:@"Gaming"],*/ nil];
        
        TRAVEL_CELL = [[NSArray alloc] initWithObjects:[NSString stringWithFormat:@"Top Stories"], /*[NSString stringWithFormat:@"Week In Travel"], [NSString stringWithFormat:@"Destinations"], [NSString stringWithFormat:@"Flights"], [NSString stringWithFormat:@"Cruises"], [NSString stringWithFormat:@"Hotel"],*/ nil];
        
        OPINION_CELL = [[NSArray alloc] initWithObjects:[NSString stringWithFormat:@"Top Stories"], /*[NSString stringWithFormat:@"Editorial Cartoons"],*/ nil];
        
        COPY_OF_CELLS = [[NSMutableArray alloc] initWithObjects:NEWS_CELL, SPORT_CELL, LIFE_CELL, MONEY_CELL, TECH_CELL, TRAVEL_CELL, OPINION_CELL, nil];
        
        
        
        self.array = [[NSMutableArray alloc] initWithObjects:[Constants getNews], [Constants getSport], [Constants getLife], [Constants getMoney], [Constants getTech], [Constants getTravel], [Constants getOpinion], nil];
        
        self.arrayColors = [[NSMutableArray alloc] initWithObjects:[Constants getNewsColor], [Constants getSportColor], [Constants getLifeColor], [Constants getMoneyColor], [Constants getTechColor], [Constants getTravelColor], [Constants getOpinionColor], nil];
        
        _subViewDelegateImplementation = [[SubViewTableController alloc] init];
        UIColor *currentColor = [self colorFromHexString:[_arrayColors objectAtIndex:0]];
        [_subViewDelegateImplementation setCellColor:currentColor];
        [_subViewDelegateImplementation setArray:[COPY_OF_CELLS objectAtIndex:0]];
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
    [_dynamicTable setBackgroundView:nil];
    [_dynamicTable setBackgroundColor:[self colorFromHexString:[_arrayColors objectAtIndex:0]]];
    [_dynamicTable setSeparatorInset:UIEdgeInsetsMake(0.0f, 0.0f, 0.0f, 400.0f)];
    //[self goToSpecificPage];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIColor * currentColor = [self colorFromHexString:[_arrayColors objectAtIndex:indexPath.row]];
    [_subViewDelegateImplementation setCellColor:currentColor];
    [_subViewDelegateImplementation setArray:[COPY_OF_CELLS objectAtIndex:indexPath.row]];
    [_subViewDelegateImplementation setCurrentNavController:[self navigationController]];
    [_dynamicTable setBackgroundColor:[self colorFromHexString:[_arrayColors objectAtIndex:indexPath.row]]];
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
    cell.separatorInset = UIEdgeInsetsMake(0.0f, 0.0f, 0.0f, cell.bounds.size.width);
    
    
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MainViewController * obj = [[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
    obj.category = [[_array objectAtIndex:indexPath.row] lowercaseString];
    [_currentNavController pushViewController:obj animated:YES];
}

@end

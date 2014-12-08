//
//  MainViewController.m
//  USATODAY
//
//  Created by Admin on 09.10.14.
//  Copyright (c) 2014 wackycoders. All rights reserved.
//

#import "MainViewController.h"
#import "ChoosBarViewController.h"

#import "Article.h"
#import "USAManager.h"
#import "USACommunicatorDelegate.h"
#import "USACommunicator.h"
#import "SimpleTableCellTableViewCell.h"
#import "SpecificViewController.h"

@interface MainViewController (){
    NSArray * _articles;
    USAManager * _manager;
    UIActivityIndicatorView * activityView;
    int numberOfArticles;
    BOOL enableToload;
}
@property(strong, nonatomic) NSMutableArray * array;
@property (nonatomic)int num;
@end

@implementation MainViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        enableToload = true;
        _category = @"home";
                
        NSString * backArrayString = @"\U000025C0\U0000FE0E";
        UIBarButtonItem * delButton = [[UIBarButtonItem alloc] initWithTitle:backArrayString style:UIBarButtonItemStylePlain target:self action:@selector(delItemFromArray)];
        self.navigationItem.leftBarButtonItem = delButton;
        
        [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"solid_white.png"] forBarMetrics:UIBarMetricsDefault];
        [[self navigationController] setNavigationBarHidden:YES animated:NO];
    }
    return self;
}

-(void)didReceiveArticles:(NSArray *)articles{
    _articles = articles;
    UIImage * viewImage = [[_articles objectAtIndex:0] image];
    dispatch_async(	dispatch_get_main_queue(), ^{
        [activityView stopAnimating];
        self.mainImageView.image = viewImage;
       [self.tableList reloadData];
        enableToload = true;
    });
}

-(void)fetchingArticlesFailedWithError:(NSError *)error{
    NSLog(@"Error %@; %@", error, [error localizedDescription]);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    numberOfArticles = 10;
    if(![self.navigationController isNavigationBarHidden]){
        [[self navigationController] setNavigationBarHidden:YES animated:NO];
        enableToload = true;
    }
    
    activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    activityView.center = self.view.center;
    activityView.color = [UIColor blueColor];
    activityView.tag = 17;
    activityView.hidesWhenStopped = YES;
    [activityView startAnimating];
    [self.view addSubview:activityView];
    //[self.view bringSubviewToFront:activityView];
    
    _manager = [[USAManager alloc] init];
    _manager.communicator = [[USACommunicator alloc] init];
    _manager.communicator.delegate = _manager;
    _manager.delegate = self;
    if(_category == nil){
        _category = @"home";
    }
    
    [_manager fetchArticles:numberOfArticles a:_category];
    
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(startFetchingGroups:) name:@"TestNotification" object:nil];
    
    //UIImage * viewImage = [[_articles objectAtIndex:0] image];//[UIImage imageNamed:@"google_images.jpg"];
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    screenRect.size.height = screenRect.size.height / 3;
    //self.mainImageView.image = viewImage;
    [self.mainImageView setFrame:screenRect];
    
    
    NSDate * d = [NSDate dateWithTimeIntervalSinceNow: 4.0];
    NSTimer * t = [[NSTimer alloc] initWithFireDate: d interval: 1 target: self selector:@selector(onTick:) userInfo:nil repeats:YES];
    
    NSRunLoop *runner = [NSRunLoop currentRunLoop];
    [runner addTimer:t forMode: NSDefaultRunLoopMode];
    
    [self.tableList setDataSource:self];
    [self.tableList setDelegate:self];
}

- (void)startFetchingGroups:(NSNotification *)notification{
    [_manager fetchArticles:1 a:_category];
}

-(void)onTick:(NSTimer *)timer{
    [[self navigationController] setNavigationBarHidden:FALSE animated:TRUE];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //NSArray * windows = [[UIApplication sharedApplication] FEX_windows];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    float bottomEdge = scrollView.contentOffset.y + scrollView.frame.size.height;
    if(bottomEdge >= scrollView.contentSize.height && enableToload){
        enableToload = false;
        //numberOfArticles += 10;
        [_manager fetchArticles:[_articles count] + 10 a:_category];
        [activityView startAnimating];
    }
}

-(BOOL)prefersStatusBarHidden{
    return TRUE;
}

- (void) addItemToArray{
    self.num ++;
    [self.array addObject:[NSString stringWithFormat:@"Item # %d", self.num]];
    [self.tableList reloadData];
    
}

- (void) delItemFromArray{
    ChoosBarViewController * obj = [[ChoosBarViewController alloc] init];
    [self.navigationController pushViewController:obj animated:YES];
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
    //return [self.array count];
    return _articles.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellIdentifier = @"SimpleTableCell";
    SimpleTableCellTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil){
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SimpleTableCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    cell.titleTextView.userInteractionEnabled = NO;
    Article * article = _articles[indexPath.row];
    
    [cell.titleTextView setText:article.title];
    
    [cell.thumbnailImageView setImage:article.image];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPaths{
    return 150;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    SpecificViewController * obj = [[SpecificViewController alloc] init];
    obj.currentArticle = [_articles objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:obj animated:YES];
}

@end
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
        _category = @"home";
        NSString * plusSign = @"\U00002795";
        UIBarButtonItem * addButton = [[UIBarButtonItem alloc] initWithTitle:plusSign style:UIBarButtonItemStylePlain target:self action:@selector(addItemToArray)];
        [addButton setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blueColor]} forState:UIControlStateNormal];
        self.navigationItem.rightBarButtonItem = addButton;
        
        
        NSString * backArrayString = @"\U000025C0\U0000FE0E";
        UIBarButtonItem * delButton = [[UIBarButtonItem alloc] initWithTitle:backArrayString style:UIBarButtonItemStylePlain target:self action:@selector(delItemFromArray)];
        self.navigationItem.leftBarButtonItem = delButton;
        
        [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"grey_bar.png"] forBarMetrics:UIBarMetricsDefault];
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
    });
}

-(void)fetchingArticlesFailedWithError:(NSError *)error{
    NSLog(@"Error %@; %@", error, [error localizedDescription]);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if(![self.navigationController isNavigationBarHidden]){
        [[self navigationController] setNavigationBarHidden:YES animated:NO];
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
    
    [_manager fetchArticles:10 a:_category];
    
    //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(startFetchingGroups:) name:@"TestNotification" object:nil];
    
    UIImage * viewImage = [[_articles objectAtIndex:0] image];//[UIImage imageNamed:@"google_images.jpg"];
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
    
    Article * article = _articles[indexPath.row];
    
    [cell.titleTextView setText:article.title];
    
    //[cell.descriptionLabel setText:article.description];
    //NSData * imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://www.gannett-cdn.com/-mm-/5ec1ae5df5882aa4d086029417cfb91f4e678de1/c=31-271-927-945&r=x404&c=534x401/local/-/media/USATODAY/USATODAY/2014/11/24/635524032122310361-XXX-Tamir.jpg"]];
    //[cell.thumbnailImageView setImage:[UIImage imageWithData:imageData]];
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
//
//  MainViewController.m
//  USATODAY
//
//  Created by Admin on 09.10.14.
//  Copyright (c) 2014 wackycoders. All rights reserved.
//

#import "MainViewController.h"
#import "ChoosBarViewController.h"

@interface MainViewController ()
@property(strong, nonatomic) NSMutableArray * array;
@property (nonatomic)int num;
@end

@implementation MainViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UIImage * viewImage = [UIImage imageNamed:@"google_images.jpg"];
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    screenRect.size.height = screenRect.size.height / 3;
    self.mainImageView.image = viewImage;
    [self.mainImageView setFrame:screenRect];
    
    //self.title = @"Items";
    self.array = [[NSMutableArray alloc] initWithObjects:@"OBJECT 1", @"OBJECT 2", @"OBJECT 3", nil];
    self.num = 3;
    
    NSString *plusSign = @"\U00002795";
    UIBarButtonItem * addButton = [[UIBarButtonItem alloc] initWithTitle:plusSign style:UIBarButtonItemStylePlain target:self action:@selector(addItemToArray)];
    [addButton setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blueColor]} forState:UIControlStateNormal];
    self.navigationItem.rightBarButtonItem = addButton;
    
    
    NSString *backArrayString = @"\U000025C0\U0000FE0E";
    UIBarButtonItem * delButton = [[UIBarButtonItem alloc] initWithTitle:backArrayString style:UIBarButtonItemStylePlain target:self action:@selector(delItemFromArray)];
    self.navigationItem.leftBarButtonItem = delButton;
    
    self.navigationController.view.backgroundColor = [UIColor redColor];
    
    [[UINavigationBar appearance] setBackgroundImage:[UIImage imageNamed:@"grey_bar.png"] forBarMetrics:UIBarMetricsDefault];
    
    [self.tableList setDataSource:self];
    [self.tableList setDelegate:self];
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
    //self.num --;
    //[self.array removeLastObject];
    //[self.tableList reloadData];
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
    return [self.array count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellIdentifier = @"Cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil){
        //cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [_array objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = @"More text";
    cell.imageView.image = [UIImage imageNamed:@"google_images.jpg"];
    
    
    //For sizeable cell
    //CGRect frame = [[UIScreen mainScreen] bounds];
    //[cell setFrame:frame];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

@end



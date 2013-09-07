//
//  RecentViewController.m
//  Top Flickr Places
//
//  Created by Yu Jiang Tham on 9/1/13.
//  Copyright (c) 2013 Yu Jiang Tham. All rights reserved.
//

#import "RecentViewController.h"
#import "LargeImageViewController.h"

@interface RecentViewController ()

@end

@implementation RecentViewController

@synthesize tableView = _tableView;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidAppear:(BOOL)animated {
    //[self reloadInputViews];
    defaults = [NSUserDefaults standardUserDefaults];
    defaultsArray = [defaults arrayForKey:@"recents"];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [defaultsArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    //NSString *indexKey = [NSString stringWithFormat:@"%d", indexPath.row];
    NSDictionary *photo = [defaultsArray objectAtIndex:indexPath.row];
    
    // Write NSUserDefaults to file
    NSDictionary *dict = [defaults dictionaryRepresentation];
    [dict writeToFile:@"/Users/ytham/tmp/userdefaults.plist" atomically:YES];
    // End
    
    NSString *titleString = [photo valueForKey:@"title"];
    if ([titleString isEqualToString:@""]) {
        titleString = @"<No Title>";
    }
    cell.textLabel.text = titleString;
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    LargeImageViewController *livc = [self.storyboard instantiateViewControllerWithIdentifier:@"Image"];
    [self.navigationController pushViewController:livc animated:YES];
    
    livc.photo = [defaultsArray objectAtIndex:indexPath.row];
}

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

@end

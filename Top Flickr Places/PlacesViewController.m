//
//  PlacesViewController.m
//  Top Flickr Places
//
//  Created by Yu Jiang Tham on 9/1/13.
//  Copyright (c) 2013 Yu Jiang Tham. All rights reserved.
//

#import "PlacesViewController.h"
#import "FlickrFetcher.h"
#import "PlacesCollectionViewController.h"

@interface PlacesViewController ()

@end

@implementation PlacesViewController

@synthesize dummyArray;
@synthesize places = _places;

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
    [self setupArray];
    [super viewDidLoad];
}

- (void)setupArray {
    /*
    dummyArray = [[NSMutableArray alloc] init];
    [dummyArray addObject:@"Item 1"];
    [dummyArray addObject:@"Item 2"];
    [dummyArray addObject:@"Item 3"];
    [dummyArray addObject:@"Item 4"];
    [dummyArray addObject:@"Item 5"];
    [dummyArray addObject:@"Item 6"];
    [dummyArray addObject:@"Item 7"];
     */
    self.places = [FlickrFetcher topPlaces];
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
    return [self.places count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [[self.places objectAtIndex:indexPath.row] valueForKey:@"woe_name"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//PlacesCollectionViewController *pcvc = [self.storyboard instantiateViewControllerWithIdentifier:@"Detail"];
    //[self.navigationController pushViewController:pcvc animated:YES];
    
    //pcvc.place = [self.places objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:@"ToCityPhotos" sender:indexPath];
}


#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *indexPath = sender;//[self.tableView indexPathForCell:sender];
    
    PlacesCollectionViewController *pcvc = [segue destinationViewController];
    pcvc.place = [self.places objectAtIndex:indexPath.row];
    NSLog(@"PrepareForSegue");
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}



@end

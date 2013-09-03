//
//  PlacesCollectionViewController.m
//  Top Flickr Places
//
//  Created by Yu Jiang Tham on 9/3/13.
//  Copyright (c) 2013 Yu Jiang Tham. All rights reserved.
//

#import "PlacesCollectionViewController.h"
#import "FlickrFetcher.h"

@interface PlacesCollectionViewController ()

@end

@implementation PlacesCollectionViewController

@synthesize place = _place;
@synthesize photos = _photos;

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
    [self setupArray];
    [super viewDidLoad];
    self.title = [self.place valueForKey:@"woe_name"];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupArray {
    self.photos = [FlickrFetcher photosInPlace:self.place maxResults:50];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.photos count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"Square";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    //UIImage *img = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://example.com/image.png"]]];
    UIImageView *flickrPhotoView = (UIImageView *)[cell viewWithTag:100];
    
    NSData *img = [NSData dataWithContentsOfURL:[FlickrFetcher urlForPhoto:[self.photos objectAtIndex:indexPath.row] format:FlickrPhotoFormatSquare]];
    UIImage *theImage = [UIImage imageWithData:img];
    flickrPhotoView.image = theImage;
    
    return cell;
}

@end

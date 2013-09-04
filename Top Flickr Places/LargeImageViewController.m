//
//  LargeImageViewController.m
//  Top Flickr Places
//
//  Created by Yu Jiang Tham on 9/3/13.
//  Copyright (c) 2013 Yu Jiang Tham. All rights reserved.
//

#import "LargeImageViewController.h"
#import "LargeImageView.h"
#import "FlickrFetcher.h"

@interface LargeImageViewController () <LargeImageViewDataSource>

@property (strong, nonatomic) IBOutlet LargeImageView *largeImageView;

@end

@implementation LargeImageViewController

@synthesize photo = _photo;
@synthesize largeImageView = _largeImageView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)setLargeImageView:(LargeImageView *)largeImageView {
    _largeImageView = largeImageView;
    // Add gesture recognizers
    //self.largeImageView.dataSource = self;
}

- (UIImage *)imageForLargeImageView:(LargeImageView *)sender {
    NSData *img = [NSData dataWithContentsOfURL:[FlickrFetcher urlForPhoto:self.photo format:FlickrPhotoFormatOriginal]];
    return [UIImage imageWithData:img];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = [self.photo valueForKey:@"title"];
}

- (void)viewDidAppear:(BOOL)animated {
    NSData *img = [NSData dataWithContentsOfURL:[FlickrFetcher urlForPhoto:self.photo format:FlickrPhotoFormatOriginal]];
    self.largeImageView.image = [UIImage imageWithData:img];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

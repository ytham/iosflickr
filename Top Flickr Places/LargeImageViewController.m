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
    
    UIGestureRecognizer *pangr = [[UIPanGestureRecognizer alloc] initWithTarget:largeImageView action:@selector(pan:)];
    UIGestureRecognizer *pinchgr = [[UIPinchGestureRecognizer alloc] initWithTarget:largeImageView action:@selector(pinch:)];
    
    [self.largeImageView addGestureRecognizer:pangr];
    [self.largeImageView addGestureRecognizer:pinchgr];
    
    self.largeImageView.dataSource = self;
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

/*- (IBAction)pan:(UIPanGestureRecognizer *)recognizer {
    CGPoint translation = [recognizer translationInView:self.largeImageView];
    recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x,
                                         recognizer.view.center.y + translation.y);
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.largeImageView];
}

- (IBAction)pinch:(UIPinchGestureRecognizer *)recognizer {
    
}*/

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

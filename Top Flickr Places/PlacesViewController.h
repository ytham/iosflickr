//
//  PlacesViewController.h
//  Top Flickr Places
//
//  Created by Yu Jiang Tham on 9/1/13.
//  Copyright (c) 2013 Yu Jiang Tham. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlacesViewController : UITableViewController

@property (nonatomic, strong) NSMutableArray *dummyArray;
@property (nonatomic, strong) NSArray *places;

- (void)setupArray;

@end

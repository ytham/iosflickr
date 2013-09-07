//
//  RecentViewController.h
//  Top Flickr Places
//
//  Created by Yu Jiang Tham on 9/1/13.
//  Copyright (c) 2013 Yu Jiang Tham. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecentViewController : UITableViewController {
    int size;
    NSUserDefaults *defaults;
    NSArray *defaultsArray;
}
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

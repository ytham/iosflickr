//
//  LargeImageView.h
//  Top Flickr Places
//
//  Created by Yu Jiang Tham on 9/3/13.
//  Copyright (c) 2013 Yu Jiang Tham. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LargeImageView;

@protocol LargeImageViewDataSource
- (UIImage *)imageForLargeImageView:(LargeImageView *)sender;
@end

@interface LargeImageView : UIImageView

@property (nonatomic, strong) UIImage *displayImage;

@property (nonatomic, weak) IBOutlet id <LargeImageViewDataSource> dataSource;

@end

//
//  LargeImageView.m
//  Top Flickr Places
//
//  Created by Yu Jiang Tham on 9/3/13.
//  Copyright (c) 2013 Yu Jiang Tham. All rights reserved.
//

#import "LargeImageView.h"

@implementation LargeImageView

@synthesize displayImage = _displayImage;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)pan:(UIPanGestureRecognizer *)recognizer {
    if ((recognizer.state == UIGestureRecognizerStateChanged) ||
        (recognizer.state == UIGestureRecognizerStateEnded)) {
        CGPoint translation = [recognizer translationInView:self];
        self.center = CGPointMake(self.center.x + translation.x, self.center.y + translation.y);
        [recognizer setTranslation:CGPointZero inView:self];
    }
}

- (void)pinch:(UIPinchGestureRecognizer *)recognizer {
    if ((recognizer.state == UIGestureRecognizerStateChanged) ||
        (recognizer.state == UIGestureRecognizerStateEnded)) {
        CGFloat scale = [recognizer scale];
        self.transform = CGAffineTransformScale(self.transform, scale, scale);
        [recognizer setScale:1];
    }
}


// Need to implement pan and pinch gestures


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end

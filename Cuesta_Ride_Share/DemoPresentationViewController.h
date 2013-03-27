//
//  DemoPresentationViewController.h
//  Ride Share
//
//  Created by Arturo Sevilla on 3/5/13.
//  Copyright (c) 2013 Arturo Sevilla. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DemoPresentationViewController : UIViewController <UIScrollViewDelegate>
{
    UIScrollView *scrollView;
    UIPageControl *pageControl;
    //UIImageView *imageView;
}

@property (nonatomic, retain) IBOutlet UIScrollView *scrollView;
@property (nonatomic, retain) IBOutlet UIPageControl *pageControl;
//@property (nonatomic, retain) IBOutlet UIImageView *imageView;

@end

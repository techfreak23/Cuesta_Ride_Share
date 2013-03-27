//
//  DemoPresentationViewController.m
//  Ride Share
//
//  Created by Arturo Sevilla on 3/5/13.
//  Copyright (c) 2013 Arturo Sevilla. All rights reserved.
//

#import "DemoPresentationViewController.h"

#define IMAGE_WIDTH 320
#define IMAGE_HEIGHT 360

@interface DemoPresentationViewController ()

@end

@implementation DemoPresentationViewController
{
    BOOL pageControlBeingUsed;
}
@synthesize scrollView, pageControl;

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
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    pageControlBeingUsed = NO;
    //NSArray *photos = [NSArray arrayWithObjects:[UIImage imageNamed:@"cuesta-college.gif"], [UIImage imageNamed:@"cuesta-college-logo2.jpg"], [UIImage imageNamed:@"StarTrekCast.jpg"], nil];
    
    NSArray *colors = [NSArray arrayWithObjects:[UIColor redColor], [UIColor greenColor], [UIColor blueColor], nil];
    
    //int i = 0;
   /*
    for ( NSString *image in photos )
    {
        CGRect frame;
        frame.origin.x = self.scrollView.frame.size.width * i;
        frame.origin.y = 0;
        frame.size = self.scrollView.frame.size;
        
        UIImage *images = [photos objectAtIndex:i];
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
        imageView = [[UIImageView alloc] initWithImage:images];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.clipsToBounds = YES;
        imageView.tag = 1;
        
        
        UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake( IMAGE_WIDTH * i++, 0, IMAGE_WIDTH, IMAGE_HEIGHT)];
        scrollView.delegate = self;
        scrollView.maximumZoomScale = 3.0f;
        imageView.frame = scrollView.bounds;
        [scrollView addSubview:imageView];
        //[imageView release];
        
        //[self.scrollViewimages addSubview:scrollView];
        
    }
    */
    for (int i = 0; i < colors.count; i++) {
        CGRect frame;
        frame.origin.x = self.scrollView.frame.size.width * i;
        frame.origin.y = 0;
        frame.size = self.scrollView.frame.size;
        
        //imageView.image = [images objectAtIndex:i];
        
        UIView *subview = [[UIView alloc] initWithFrame:frame];
        subview.backgroundColor = [colors objectAtIndex:i];
        [self.scrollView addSubview:subview];
        //[subview release]; 
    }
    
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * colors.count, self.scrollView.frame.size.height);
}

- (IBAction)changePage {
    // update the scroll view to the appropriate page
    CGRect frame;
    frame.origin.x = self.scrollView.frame.size.width * self.pageControl.currentPage;
    frame.origin.y = 0;
    frame.size = self.scrollView.frame.size;
    [self.scrollView scrollRectToVisible:frame animated:YES];
    pageControlBeingUsed = YES;
}

- (IBAction)dismissDemo:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // Update the page when more than 50% of the previous/next page is visible
    CGFloat pageWidth = self.scrollView.frame.size.width;
    int page = floor((self.scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    self.pageControl.currentPage = page;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    pageControlBeingUsed = NO;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    pageControlBeingUsed = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

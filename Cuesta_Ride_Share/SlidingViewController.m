//
//  SlidingViewController.m
//  Cuesta_Ride_Share
//
//  Created by Arturo Sevilla on 4/11/13.
//  Copyright (c) 2013 Arturo Sevilla. All rights reserved.
//

#import "SlidingViewController.h"

@interface SlidingViewController ()

@end

@implementation SlidingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"MainTop"];
}

@end

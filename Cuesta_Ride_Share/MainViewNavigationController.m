//
//  MainViewNavigationController.m
//  Cuesta_Ride_Share
//
//  Created by Arturo Sevilla on 4/11/13.
//  Copyright (c) 2013 Arturo Sevilla. All rights reserved.
//

#import "MainViewNavigationController.h"

@interface MainViewNavigationController ()

@end

@implementation MainViewNavigationController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.view.layer.shadowOpacity = 0.75f;
    self.view.layer.shadowRadius = 10.0f;
    self.view.layer.shadowColor = [UIColor blackColor].CGColor;
    
}

@end

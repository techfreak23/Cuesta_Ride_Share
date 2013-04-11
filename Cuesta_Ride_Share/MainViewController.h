//
//  MainViewController.h
//  Cuesta_Ride_Share
//
//  Created by Arturo Sevilla on 4/11/13.
//  Copyright (c) 2013 Arturo Sevilla. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "ECSlidingViewController.h"
#import "MenuViewController.h"

@interface MainViewController : UITableViewController
{
    UIViewController *menu;
}

@property (nonatomic, strong) UIViewController *menu;

@end

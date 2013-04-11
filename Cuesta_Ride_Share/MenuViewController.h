//
//  MenuViewController.h
//  Cuesta_Ride_Share
//
//  Created by Arturo Sevilla on 4/11/13.
//  Copyright (c) 2013 Arturo Sevilla. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ECSlidingViewController.h"
#import "MainViewController.h"

@interface MenuViewController : UITableViewController
{
    UIViewController *main;
}

@property (nonatomic, strong) UIViewController *main;

@end

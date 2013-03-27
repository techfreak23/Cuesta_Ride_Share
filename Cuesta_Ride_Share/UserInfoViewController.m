//
//  UserInfoViewController.m
//  Cuesta_Ride_Share
//
//  Created by Arturo Sevilla on 3/25/13.
//  Copyright (c) 2013 Arturo Sevilla. All rights reserved.
//

#import "UserInfoViewController.h"

@interface UserInfoViewController ()

@end

@implementation UserInfoViewController

@synthesize email, userid, firebase, authClient;

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
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    
    [authClient checkAuthStatusWithBlock:^(NSError *error, FAUser *user) {
        if (error != nil) {
            NSLog(@"No longer logged in");
        } else {
            self.email.text = user.email;
            self.email.text = user.userId;
        }
    }];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)logout:(id)sender
{
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:^(void) {
        [authClient logout];
        NSLog(@"User has been logged out");
    }];
}

- (IBAction)changePassword:(id)sender
{
    ChangePasswordViewController *controller = [[ChangePasswordViewController alloc] initWithNibName:@"ChangePasswordViewController" bundle:nil];
    
    [controller setFirebase:self.firebase];
    [controller setAuthClient:self.authClient];
    
    
}

@end

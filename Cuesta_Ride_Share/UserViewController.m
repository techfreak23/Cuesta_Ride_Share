//
//  UserViewController.m
//  Cuesta_Ride_Share
//
//  Created by Arturo Sevilla on 3/26/13.
//  Copyright (c) 2013 Arturo Sevilla. All rights reserved.
//

#import "UserViewController.h"
#import "ChangePasswordViewController.h"

@interface UserViewController ()

@end

@implementation UserViewController

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
    [authClient checkAuthStatusWithBlock:^(NSError *error, FAUser *user) {
        if (error != nil) {
            NSLog(@"There is an error with your login status.");
        } else {
            self.email.text = user.email;
            self.userid.text = user.userId;
        }
    }];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changePassword:(id)sender
{
    ChangePasswordViewController *controller = [[ChangePasswordViewController alloc] initWithNibName:@"ChangePasswordViewController" bundle:nil];
    [controller setFirebase:self.firebase];
    [controller setAuthClient:self.authClient];
    
    [self presentViewController:controller animated:YES completion:nil];
    
}

- (IBAction)logout:(id)sender
{
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:^(void) {
        [authClient logout];
    }];
}



@end

//
//  ChangePasswordViewController.m
//  Cuesta_Ride_Share
//
//  Created by Arturo Sevilla on 3/25/13.
//  Copyright (c) 2013 Arturo Sevilla. All rights reserved.
//

#import "ChangePasswordViewController.h"

@interface ChangePasswordViewController ()

@end

@implementation ChangePasswordViewController

@synthesize email, oldPassword, differentPassword, confirmed, firebase, authClient;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.authClient checkAuthStatusWithBlock:^(NSError *error, FAUser *user) {
        if (error != nil) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"You have been logged out." delegate:self cancelButtonTitle:@"Okay" otherButtonTitles: nil];
            [alert show];
        } else if (user == nil) {
            NSLog(@"No one is logged in.");
        } else {
            NSLog(@"Still logged in.");
        }
        
    }];

    self.title = @"Change Password";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(confirm:)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)confirm:(id)sender
{
    if (![self.differentPassword.text isEqual:self.confirmed.text]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Try again" message:@"Your passwords do not match." delegate:self cancelButtonTitle:@"Okay" otherButtonTitles: nil];
        
        [alert show];
    } else {
        [authClient changePasswordForEmail:self.email.text oldPassword:self.oldPassword.text newPassword:self.differentPassword.text completionBlock:^(NSError *error, BOOL success) {
            if (error != nil) {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"There was an error processing the request." delegate:self cancelButtonTitle:@"Okay" otherButtonTitles: nil];
                
                [alert show];
            } else if (success) {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success!" message:@"Your password has been successfully changed!" delegate:self cancelButtonTitle:@"Okay" otherButtonTitles: nil];
                
                [alert show];
            }
        }];
    }
    [self dismissViewControllerAnimated:YES completion:^(void) {
        [self dismissViewControllerAnimated:YES completion:^(void) {
            [self dismissViewControllerAnimated:YES completion:nil];
        }];
    }];
}

@end

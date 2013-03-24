//
//  ViewController.m
//  Cuesta_Ride_Share
//
//  Created by Arturo Sevilla on 3/24/13.
//  Copyright (c) 2013 Arturo Sevilla. All rights reserved.
//

#import "ViewController.h"
#import <FirebaseAuthClient/FirebaseAuthClient.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Button Actions

- (IBAction)login:(id)sender
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Login With:" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Facebook?", @"Email/Password", nil];
    
    [actionSheet showInView:self.view];
    //[self performSegueWithIdentifier:@"login" sender:self];
}

- (IBAction)signup:(id)sender
{
    [self performSegueWithIdentifier:@"signup" sender:self];
}

#pragma mark - Action Sheet Delegate Methods

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1)
    {
        [self performSegueWithIdentifier:@"login" sender:self];
    } else if (buttonIndex == 2) {
        Firebase *fb = [[Firebase alloc] initWithUrl:@"https://cuesta-ride-share.firebaseio.com/"];
        FirebaseAuthClient *authClient = [[FirebaseAuthClient alloc] initWithRef:fb];
        
        [authClient loginToFacebookAppWithId:<#(NSString *)#> permissions:<#(NSArray *)#> withCompletionBlock:<#^(NSError *error, FAUser *user)block#>]
    }
}

@end

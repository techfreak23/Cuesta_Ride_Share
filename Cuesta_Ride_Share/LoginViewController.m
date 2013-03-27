//
//  LoginViewController.m
//  Cuesta_Ride_Share
//
//  Created by Arturo Sevilla on 3/24/13.
//  Copyright (c) 2013 Arturo Sevilla. All rights reserved.
//

#import "LoginViewController.h"


@interface LoginViewController ()

@end

@implementation LoginViewController

@synthesize email, password, loginButton, firebase, authClient;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Returning User";
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel:)];
    
    self.email.delegate = self;
    self.password.delegate = self;
    
    self.email.returnKeyType = UIReturnKeyNext;
    self.password.returnKeyType = UIReturnKeyDone;
    
    self.password.secureTextEntry = YES;
    
    [self.email becomeFirstResponder];
    
    [self validateTextFields];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Text Field Delegate Methods

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    [self validateTextFields];
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.email) {
        [self.email resignFirstResponder];
        [self.password becomeFirstResponder];
    }
    
    if (textField == self.password) {
        [self.password resignFirstResponder];
        [self login:self];
    }
    return YES;
}

- (void)validateTextFields
{
    if (self.email.text.length < 12 || self.password.text.length < 7) {
        self.loginButton.enabled = NO;
    } else {
        self.loginButton.enabled = YES;
    }
}

#pragma mark - Button Actions

- (IBAction)login:(id)sender
{
    
    self.firebase = [[Firebase alloc] initWithUrl:@"https://cuesta-ride-share.firebaseio.com/"];
    self.authClient = [[FirebaseAuthClient alloc] initWithRef:firebase];
    
    [authClient loginWithEmail:self.email.text andPassword:self.password.text withCompletionBlock:^(NSError *error, FAUser *user) {
        if (error != nil) {
            UIAlertView *fail = [[UIAlertView alloc] initWithTitle:nil message:@"Login Failed!" delegate:self cancelButtonTitle:@"Okay" otherButtonTitles: nil];
            
            [fail show];
        } else {
            NSLog(@"Logged in successfully with email %@ user %@", user.email, user.userId);
            UserViewController *detail = [[UserViewController alloc] initWithNibName:@"UserViewController" bundle:nil];
            
            [detail setAuthClient:authClient];
            [detail setFirebase:firebase];
            
            [self presentViewController:detail animated:YES completion:nil];
            
            
        }
    }];
     
}

- (void)cancel:(id)sender
{
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
}

@end

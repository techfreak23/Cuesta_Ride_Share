//
//  LoginViewController.m
//  Geo_Chat_Beta
//
//  Created by Arturo Sevilla on 3/31/13.
//  Copyright (c) 2013 Arturo Sevilla. All rights reserved.
//

#import "LoginViewController.h"

@implementation LoginViewController

@synthesize email, password;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Returning User";
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    
    self.email.delegate = self;
    self.password.delegate = self;
    
    self.email.keyboardType = UIKeyboardTypeEmailAddress;
    self.password.secureTextEntry = YES;
    
    self.email.returnKeyType = UIReturnKeyNext;
    self.email.returnKeyType = UIReturnKeyDone;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Login" style:UIBarButtonItemStyleDone target:self action:@selector(login:)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel:)];
    
    [self.email becomeFirstResponder];
    
    [self validateTextFields];
    
}


#pragma mark - TextField delegate methods

- (void)validateTextFields
{
    if (self.email.text.length < 1 || self.password.text.length < 7) {
        self.navigationItem.rightBarButtonItem.enabled = NO;
    } else {
        NSLog(@"Text Fields are valid...");
        self.navigationItem.rightBarButtonItem.enabled = YES;
    }
}

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

#pragma mark - Button Actions

- (void)login:(id)sender
{
    self.navigationItem.leftBarButtonItem.enabled = NO;
    
    [[FirebaseManager sharedManager].authClient loginWithEmail:self.email.text andPassword:self.password.text withCompletionBlock:^(NSError *error, FAUser *user) {
        if (error != nil) {
            NSLog(@"Login failed...");
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Login failed..." message:@"Please try again..." delegate:self cancelButtonTitle:@"Okay" otherButtonTitles: nil];
            
            [alert show];
        } else {
            NSLog(@"Login successful...");
            [self performSegueWithIdentifier:@"Initialize" sender:self];
        }
    }];
}

- (void)cancel:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

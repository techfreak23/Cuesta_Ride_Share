//
//  LoginViewController.m
//  Cuesta_Ride_Share
//
//  Created by Arturo Sevilla on 3/24/13.
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
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Login" style:UIBarButtonItemStyleDone target:self action:@selector(login:)];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel:)];
    
    self.email.delegate = self;
    self.password.delegate = self;
    
    self.email.returnKeyType = UIReturnKeyNext;
    self.password.returnKeyType = UIReturnKeyDone;
    
    self.email.keyboardType = UIKeyboardTypeEmailAddress;
    self.password.secureTextEntry = YES;
    
    self.password.enablesReturnKeyAutomatically = YES;
    self.password.clearsOnBeginEditing = YES;
    self.password.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    [self.email becomeFirstResponder];
    [self validateTextFields];
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
    if (self.email.text.length > 11 && self.password.text.length > 6) {
        self.navigationItem.rightBarButtonItem.enabled = YES;
    } else {
        self.navigationItem.rightBarButtonItem.enabled = NO;
    }
}

#pragma mark - Button Actions

- (void)login:(id)sender
{
    [self performSegueWithIdentifier:@"loginPath" sender:self];
}

- (void)cancel:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

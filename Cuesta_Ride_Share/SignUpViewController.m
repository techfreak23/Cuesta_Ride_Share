//
//  SignUpViewController.m
//  Cuesta_Ride_Share
//
//  Created by Arturo Sevilla on 3/24/13.
//  Copyright (c) 2013 Arturo Sevilla. All rights reserved.
//

#import "SignUpViewController.h"

@interface SignUpViewController ()

@end

@implementation SignUpViewController

@synthesize firstName, lastName, email, phone, password, confirmPassword;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"New User";
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel:)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Sign Up" style:UIBarButtonItemStyleDone target:self action:@selector(signUp:)];
    
    self.firstName.delegate = self;
    self.lastName.delegate = self;
    self.email.delegate = self;
    self.phone.delegate = self;
    self.password.delegate = self;
    self.confirmPassword.delegate = self;
    
    self.firstName.returnKeyType = UIReturnKeyNext;
    self.lastName.returnKeyType = UIReturnKeyNext;
    self.email.returnKeyType = UIReturnKeyNext;
    self.phone.returnKeyType = UIReturnKeyNext;
    self.password.returnKeyType = UIReturnKeyNext;
    self.confirmPassword.returnKeyType = UIReturnKeyDone;
    
    self.email.keyboardType = UIKeyboardTypeEmailAddress;
    self.phone.keyboardType = UIKeyboardTypeNumberPad;
    
    self.password.secureTextEntry = YES;
    self.confirmPassword.secureTextEntry = YES;
    
    
    
    
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

- (void)validateTextFields
{
    if (self.email.text.length < 12 || self.password.text.length < 7 || self.password.text.length < 7) {
        self.navigationItem.rightBarButtonItem.enabled = NO;
    } else {
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
    if (textField == self.firstName) {
        [self.firstName resignFirstResponder];
        [self.lastName becomeFirstResponder];
    }
    
    if (textField == self.lastName) {
        [self.lastName resignFirstResponder];
        [self.email becomeFirstResponder];
    }
    
    if (textField == self.email) {
        [self.email resignFirstResponder];
        [self.phone becomeFirstResponder];
    }
    
    if (textField == self.phone) {
        [self.phone resignFirstResponder];
        [self.password becomeFirstResponder];
    }
    
    if (textField == self.password) {
        [self.password resignFirstResponder];
        [self.confirmPassword becomeFirstResponder];
    }
    
    if (textField == self.confirmPassword) {
        [self.confirmPassword resignFirstResponder];
        [self signUp:self];
    }
    
    return YES;
}

#pragma mark - Button Actions

- (IBAction)signUp:(id)sender
{
    if (![self.password.text isEqual:self.confirmPassword.text]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Your passwords do not match. Please enter them again." delegate:self cancelButtonTitle:@"Okay" otherButtonTitles: nil];
        
        [alert show];
    } else {
        [self performSegueWithIdentifier:@"signupPath" sender:self];
    }
    
}

- (void)cancel:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

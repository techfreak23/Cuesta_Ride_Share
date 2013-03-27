//
//  SignUpViewController.h
//  Cuesta_Ride_Share
//
//  Created by Arturo Sevilla on 3/24/13.
//  Copyright (c) 2013 Arturo Sevilla. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FirebaseAuthClient/FirebaseAuthClient.h>
#import "UserViewController.h"

@interface SignUpViewController : UITableViewController <UITextFieldDelegate, UIAlertViewDelegate>
{
    IBOutlet UITextField *firstName;
    IBOutlet UITextField *lastName;
    IBOutlet UITextField *email;
    IBOutlet UITextField *phone;
    IBOutlet UITextField *password;
    IBOutlet UITextField *confirmPassword;
    IBOutlet UIBarButtonItem *signUpButton;
    //IBOutlet UIButton *facebook;
}

@property (nonatomic, strong) IBOutlet UITextField *firstName;
@property (nonatomic, strong) IBOutlet UITextField *lastName;
@property (nonatomic, strong) IBOutlet UITextField *email;
@property (nonatomic, strong) IBOutlet UITextField *phone;
@property (nonatomic, strong) IBOutlet UITextField *password;
@property (nonatomic, strong) IBOutlet UITextField *confirmPassword;
@property (nonatomic, strong) IBOutlet UIBarButtonItem *signUpButton;
@property (nonatomic, strong) Firebase *firebase;
@property (nonatomic, strong) FirebaseAuthClient *authClient;
//@property (nonatomic, strong) IBOutlet UIButton *facebook;

@end

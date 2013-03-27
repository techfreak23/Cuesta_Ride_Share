//
//  LoginViewController.h
//  Cuesta_Ride_Share
//
//  Created by Arturo Sevilla on 3/24/13.
//  Copyright (c) 2013 Arturo Sevilla. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FirebaseAuthClient/FirebaseAuthClient.h>
#import "UserViewController.h"

@interface LoginViewController : UITableViewController <UITextFieldDelegate>
{
    IBOutlet UITextField *email;
    IBOutlet UITextField *password;
    IBOutlet UIBarButtonItem *loginButton;
}

@property (nonatomic, strong) IBOutlet UITextField *email;
@property (nonatomic, strong) IBOutlet UITextField *password;
@property (nonatomic, strong) IBOutlet UIBarButtonItem *loginButton;
@property (nonatomic, strong) Firebase *firebase;
@property (nonatomic, strong) FirebaseAuthClient *authClient;

@end

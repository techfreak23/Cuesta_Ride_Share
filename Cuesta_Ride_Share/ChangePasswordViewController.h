//
//  ChangePasswordViewController.h
//  Cuesta_Ride_Share
//
//  Created by Arturo Sevilla on 3/25/13.
//  Copyright (c) 2013 Arturo Sevilla. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FirebaseAuthClient/FirebaseAuthClient.h>

@interface ChangePasswordViewController : UITableViewController <UITextFieldDelegate, UIAlertViewDelegate>
{
    IBOutlet UITextField *email;
    IBOutlet UITextField *oldPassword;
    IBOutlet UITextField *differentPassword;
    IBOutlet UITextField *confirmed;
}

@property (nonatomic, strong) IBOutlet UITextField *email;
@property (nonatomic, strong) IBOutlet UITextField *oldPassword;
@property (nonatomic, strong) IBOutlet UITextField *differentPassword;
@property (nonatomic, strong) IBOutlet UITextField *confirmed;
@property (nonatomic, strong) Firebase *firebase;
@property (nonatomic, strong) FirebaseAuthClient *authClient;

@end

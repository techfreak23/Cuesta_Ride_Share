//
//  LoginViewController.h
//  Geo_Chat_Beta
//
//  Created by Arturo Sevilla on 3/31/13.
//  Copyright (c) 2013 Arturo Sevilla. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FirebaseManager.h"

@interface LoginViewController : UITableViewController <UITextFieldDelegate, UIAlertViewDelegate>
{
    IBOutlet UITextField *email;
    IBOutlet UITextField *password;
}

@property (nonatomic, strong) IBOutlet UITextField *email;
@property (nonatomic, strong) IBOutlet UITextField *password;

@end

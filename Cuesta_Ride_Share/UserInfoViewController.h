//
//  UserInfoViewController.h
//  Cuesta_Ride_Share
//
//  Created by Arturo Sevilla on 3/25/13.
//  Copyright (c) 2013 Arturo Sevilla. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FirebaseAuthClient/FirebaseAuthClient.h>
#import "ChangePasswordViewController.h"

@interface UserInfoViewController : UIViewController
{
    IBOutlet UILabel *email;
    IBOutlet UILabel *userid;
}

@property (nonatomic, strong) IBOutlet UILabel *email;
@property (nonatomic, strong) IBOutlet UILabel *userid;
@property (nonatomic, strong) Firebase *firebase;
@property (nonatomic, strong) FirebaseAuthClient *authClient;
@property (nonatomic, strong) NSString *emailAddress;

@end

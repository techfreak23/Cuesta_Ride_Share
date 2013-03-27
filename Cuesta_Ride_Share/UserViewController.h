//
//  UserViewController.h
//  Cuesta_Ride_Share
//
//  Created by Arturo Sevilla on 3/26/13.
//  Copyright (c) 2013 Arturo Sevilla. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FirebaseAuthClient/FirebaseAuthClient.h>

@interface UserViewController : UIViewController
{
    IBOutlet UILabel *email;
    IBOutlet UILabel *userid;
}

@property (nonatomic, strong) IBOutlet UILabel *email;
@property (nonatomic, strong) IBOutlet UILabel *userid;
@property (nonatomic, strong) Firebase *firebase;
@property (nonatomic, strong) FirebaseAuthClient *authClient;

@end

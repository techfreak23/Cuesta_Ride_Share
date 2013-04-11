//
//  ViewController.m
//  Cuesta_Ride_Share
//
//  Created by Arturo Sevilla on 3/24/13.
//  Copyright (c) 2013 Arturo Sevilla. All rights reserved.
//

#import "ViewController.h"
#import "DemoPresentationViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)contactUs:(id)sender
{
    
    MFMailComposeViewController *composer = [[MFMailComposeViewController alloc] init];
    composer.mailComposeDelegate = self;
    
    [composer setSubject:@"Cuesta Ride Share iOS feedback."];
    
    NSArray *toRecipients = [NSArray arrayWithObjects:@"techfreak23@gmail.com", nil];
    
    [composer setToRecipients:toRecipients];
    
    [self presentViewController:composer animated:YES completion:nil];
     
}

- (IBAction)showDemo:(id)sender
{
    DemoPresentationViewController *demo = [[DemoPresentationViewController alloc] initWithNibName:@"DemoPresentationViewController" bundle:nil];
    [self presentViewController:demo animated:YES completion:nil];
}


- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:nil];
}


@end

//
//  MenuViewController.m
//  Cuesta_Ride_Share
//
//  Created by Arturo Sevilla on 4/11/13.
//  Copyright (c) 2013 Arturo Sevilla. All rights reserved.
//

#import "MenuViewController.h"
@interface MenuViewController()

@property (nonatomic, strong) NSArray *menuItems;
@property (nonatomic, strong) NSArray *menuIcons;

@end

@implementation MenuViewController

@synthesize main;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.menuItems = [NSArray arrayWithObjects:@"Upcoming Rides", @"Account Settings", @"Payment Information", @"Become A Driver", @"Logout", nil];
    self.menuIcons = [NSArray arrayWithObjects:@"53-house.png", @"20-gear2", @"192-credit-card.png", @"73-radar.png", @"54-lock.png", nil];
    
    [self.slidingViewController setAnchorRightRevealAmount:280.0f];
    self.slidingViewController.underLeftWidthLayout = ECFullWidth;
    
    if ([self.slidingViewController.topViewController isKindOfClass:[MainViewController class]]) {
    self.main = self.slidingViewController.topViewController;
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    [self setMain:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.menuItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [self.menuItems objectAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageNamed:[self.menuIcons objectAtIndex:indexPath.row]];
    
    // Configure the cell...
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (![[self.menuItems objectAtIndex:indexPath.row] isEqual:@"Logout"]) {
        
        if ([[self.menuItems objectAtIndex:indexPath.row] isEqual:@"Upcoming Rides"]) {
            [self.slidingViewController anchorTopViewOffScreenTo:ECRight animations:nil onComplete:^ {
                CGRect frame = self.slidingViewController.topViewController.view.frame;
                
                if (self.main == nil) {
                    NSLog(@"Main view is being reinitialized...");
                    self.main = [self.storyboard instantiateViewControllerWithIdentifier:@"MainTop"];
                }
                
                self.slidingViewController.topViewController = self.main;
                self.slidingViewController.topViewController.view.frame = frame;
                [self.slidingViewController resetTopView];
            }];
        }
    } else {
        UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"Are you sure?" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Yes" otherButtonTitles:nil];
        
        [sheet showInView:self.view];
    }
}

#pragma mark - Action sheet delegate methods

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        self.slidingViewController.topViewController = [self.storyboard instantiateInitialViewController];
        [self.slidingViewController resetTopView];
    }
}

@end

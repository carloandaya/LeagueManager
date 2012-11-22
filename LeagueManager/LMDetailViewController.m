//
//  LMDetailViewController.m
//  LeagueManager
//
//  Created by Carlo Andaya on 11/21/12.
//  Copyright (c) 2012 Carlo Andaya. All rights reserved.
//

#import "LMDetailViewController.h"
#import "LMMasterViewController.h"
#import "Team.h"

@interface LMDetailViewController ()

@end

@implementation LMDetailViewController

- (id)initWithRootViewController:(LMMasterViewController *)aRootController team:(Team *)aTeam
{
    self = [super init];
    if (self) {
        self.navigationController.title = NSLocalizedString(@"Team", @"Team");
        self.rootViewController = aRootController;
        self.team = aTeam;
        
        // If we are creating a new team, then add done and cancel buttons to the
        // navigation item.
        if (!self.team) {
            UINavigationItem *navItem = self.navigationItem;

            UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(save:)];
            
            UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel:)];
            
            navItem.rightBarButtonItem = doneButton;
            navItem.leftBarButtonItem = cancelButton;
        }
    }
    return self; 
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // If the detail view controller was called by selecting a team
    // populat the textfields with the contents
    if (self.team) {
        self.nameField.text = self.team.name;
        self.colorField.text = self.team.uniformColor;
    }

}

- (void)viewWillDisappear:(BOOL)animated
{
    NSLog(@"Invoked viewWillDisappear");
    if (self.team) {
        self.team.name = self.nameField.text;
        self.team.uniformColor = self.colorField.text;
        [self.rootViewController saveContext];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation Item Buttons
- (void)save:(id)sender
{
    NSManagedObjectContext *context = [self.rootViewController.fetchedResultsController managedObjectContext];
    NSEntityDescription *entity = [self.rootViewController.fetchedResultsController.fetchRequest entity];
    Team *newTeam = [[Team alloc] initWithEntity:entity insertIntoManagedObjectContext:context];
    
    self.team = newTeam;
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)cancel:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end

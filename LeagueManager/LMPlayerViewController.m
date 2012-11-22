//
//  LMPlayerViewController.m
//  LeagueManager
//
//  Created by Carlo Andaya on 11/21/12.
//  Copyright (c) 2012 Carlo Andaya. All rights reserved.
//

#import "LMPlayerViewController.h"
#import "LMMasterViewController.h"
#import "Team.h"
#import "Player.h"

@interface LMPlayerViewController ()

@end

@implementation LMPlayerViewController

@synthesize rootViewController, team, player;

- (IBAction)deletePlayer:(id)sender
{
    if (player) {
        if (team) {
            [team removePlayersObject:player];
            [rootViewController saveContext];
        }
    } else {
        [self cancel:nil];
    }
    
}

- (id)initWithRootViewController:(LMMasterViewController *)aRootController team:(Team *)aTeam player:(Player *)aPlayer
{
    self = [super init];
    if (self) {
        self.rootViewController = aRootController;
        self.team = aTeam;
        self.player = aPlayer;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    if (self.player) {
        fnameField.text = self.player.firstName;
        lnameField.text = self.player.lastName;
        emailField.text = self.player.email;
    } else {
        UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(savePlayer)];
        self.navigationItem.rightBarButtonItem = doneButton;

        UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel:)];
        self.navigationItem.leftBarButtonItem = cancelButton;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)savePlayer
{
    if (!self.player) {
        NSManagedObjectContext *context = self.rootViewController.fetchedResultsController.managedObjectContext;
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"Player" inManagedObjectContext:context];
        self.player = [[Player alloc] initWithEntity:entity insertIntoManagedObjectContext:context];
    }
    
    player.firstName = fnameField.text;
    player.lastName = lnameField.text;
    player.email = emailField.text;
    player.team = team;

    [rootViewController saveContext];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)cancel:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end

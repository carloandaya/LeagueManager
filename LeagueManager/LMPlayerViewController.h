//
//  LMPlayerViewController.h
//  LeagueManager
//
//  Created by Carlo Andaya on 11/21/12.
//  Copyright (c) 2012 Carlo Andaya. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LMMasterViewController, Team, Player;

@interface LMPlayerViewController : UIViewController
{
    __weak IBOutlet UITextField *fnameField;
    __weak IBOutlet UITextField *lnameField;
    __weak IBOutlet UITextField *emailField;
}

@property (strong, nonatomic) LMMasterViewController *rootViewController;
@property (strong, nonatomic) Team *team;
@property (strong, nonatomic) Player *player;

- (IBAction)deletePlayer:(id)sender;

- (id)initWithRootViewController:(LMMasterViewController *)aRootController team:(Team *)aTeam player:(Player *)aPlayer;

@end

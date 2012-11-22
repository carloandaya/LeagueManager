//
//  LMPlayerListViewController.h
//  LeagueManager
//
//  Created by Carlo Andaya on 11/21/12.
//  Copyright (c) 2012 Carlo Andaya. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LMMasterViewController, Team, Player;

@interface LMPlayerListViewController : UITableViewController

@property (retain, nonatomic) Team *team;
@property (retain, nonatomic) LMMasterViewController *rootViewController;

- (id)initWithRootViewController:(LMMasterViewController *)aController team:(Team *)aTeam;
- (NSArray *)sortPlayers;

@end

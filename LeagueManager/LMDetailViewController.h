//
//  LMDetailViewController.h
//  LeagueManager
//
//  Created by Carlo Andaya on 11/21/12.
//  Copyright (c) 2012 Carlo Andaya. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LMMasterViewController, Team;

@interface LMDetailViewController : UIViewController

@property (retain, nonatomic) Team *team;
@property (retain, nonatomic) LMMasterViewController *rootViewController;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *colorField;

- (id)initWithRootViewController:(LMMasterViewController *)aRootController team:(Team *)aTeam;

@end

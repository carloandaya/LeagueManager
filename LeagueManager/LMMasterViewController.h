//
//  LMMasterViewController.h
//  LeagueManager
//
//  Created by Carlo Andaya on 11/21/12.
//  Copyright (c) 2012 Carlo Andaya. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LMDetailViewController;

#import <CoreData/CoreData.h>

@interface LMMasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) LMDetailViewController *detailViewController;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

- (void)insertTeamWithName:(NSString *)teamName uniformColor:(NSString *)uniformColor;
- (void)saveContext;

@end

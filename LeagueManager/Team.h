//
//  Team.h
//  LeagueManager
//
//  Created by Carlo Andaya on 11/21/12.
//  Copyright (c) 2012 Carlo Andaya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Team : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * uniformColor;
@property (nonatomic, retain) NSSet *players;
@end

@interface Team (CoreDataGeneratedAccessors)

- (void)addPlayersObject:(NSManagedObject *)value;
- (void)removePlayersObject:(NSManagedObject *)value;
- (void)addPlayers:(NSSet *)values;
- (void)removePlayers:(NSSet *)values;

@end

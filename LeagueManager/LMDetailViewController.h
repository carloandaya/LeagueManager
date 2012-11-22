//
//  LMDetailViewController.h
//  LeagueManager
//
//  Created by Carlo Andaya on 11/21/12.
//  Copyright (c) 2012 Carlo Andaya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LMDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end

//
//  PlayersTableViewController.h
//  Ratings
//
//  Created by Adhitya Surya Pratama on 9/20/17.
//  Copyright © 2017 Adhitya Surya Pratama. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "PlayerDetailsTableViewController.h"
@interface PlayersTableViewController : UITableViewController <PlayerDetailsViewControllerDelegate>

@property (nonatomic, strong) NSMutableArray *players;

@end

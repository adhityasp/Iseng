//
//  PlayerDetailsTableViewController.h
//  Ratings
//
//  Created by Adhitya Surya Pratama on 9/20/17.
//  Copyright © 2017 Adhitya Surya Pratama. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PlayerDetailsTableViewController;

@protocol PlayerDetailsViewControllerDelegate <NSObject>

- (void)didCancel:(PlayerDetailsTableViewController*)controller;
- (void)didDone:(PlayerDetailsTableViewController*)controller;

@end

@interface PlayerDetailsTableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UITextField *txtName;
@property (weak, nonatomic) IBOutlet UILabel *labelDetail;

@property (nonatomic, weak) id <PlayerDetailsViewControllerDelegate> delegate;

-(IBAction)cancel:(id)sender;
-(IBAction)done:(id)sender;

@end

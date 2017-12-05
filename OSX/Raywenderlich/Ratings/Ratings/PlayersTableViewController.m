//
//  PlayersTableViewController.m
//  Ratings
//
//  Created by Adhitya Surya Pratama on 9/20/17.
//  Copyright © 2017 Adhitya Surya Pratama. All rights reserved.
//

#import "PlayersTableViewController.h"
#import "Player.h"
#import "PlayerTableViewCell.h"

@interface PlayersTableViewController ()

@end

@implementation PlayersTableViewController
- (UIImage*) insertImage:(int)rating{
    switch (rating) {
        case 1:
            return [UIImage imageNamed:@"1StarSmall"];
        case 2:
            return [UIImage imageNamed:@"2StarsSmall"];
        case 3:
            return [UIImage imageNamed:@"3StarsSmall"];
        case 4:
            return [UIImage imageNamed:@"4StarsSmall"];
        case 5:
            return [UIImage imageNamed:@"5StarsSmall"];
    }
    return nil;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return [self.players count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PlayerTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PlayerCell"];
    Player *player = (self.players)[indexPath.row];
    cell.nameLabel.text = player.name;
    cell.gameLabel.text = player.game;
    cell.ratingImage.image = [self insertImage:player.rating ];
    
    return cell;
}

#pragma mark - PlayerDetailsViewControllerDelegate
- (void) didDone:(PlayerDetailsTableViewController *)controller{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
- (void) didCancel:(PlayerDetailsTableViewController *)controller{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"AddPlayer"]){
        UINavigationController *navController = segue.destinationViewController;
        PlayerDetailsTableViewController *playerDetailViewController = [navController viewControllers][0];
        playerDetailViewController.delegate = self;
    }
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

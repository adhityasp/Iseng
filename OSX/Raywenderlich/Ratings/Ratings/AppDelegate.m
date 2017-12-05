//
//  AppDelegate.m
//  Ratings
//
//  Created by Adhitya Surya Pratama on 9/13/17.
//  Copyright © 2017 Adhitya Surya Pratama. All rights reserved.
//

#import "AppDelegate.h"
#import "Player.h"
#import "PlayersTableViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate{
    NSMutableArray *_players;
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //isi data arrayny
    _players = [NSMutableArray arrayWithCapacity:20];
    Player *player = [[Player alloc] init];
    player.name = @"Adhitya";
    player.game = @"GranblueFantasy";
    player.rating = 5;
    [_players addObject:player];
    
    player = [[Player alloc] init];
    player.name = @"Adhiwira";
    player.game = @"Ragnarok";
    player.rating = 4;
    [_players addObject:player];
    
    player = [[Player alloc] init];
    player.name = @"Bryant";
    player.game = @"Mabinogi Duel";
    player.rating = 1;
    [_players addObject:player];
    
    //bkin reference ke playerviewcontroller
    UITabBarController *tabBarController = (UITabBarController*)self.window.rootViewController;//set uitabbar jadi root (initial view)
    UINavigationController *navController = [tabBarController viewControllers][0];//pilih playerviewcontroller dari navigationcontroller yg ke 1
    PlayersTableViewController *playerViewController = [navController viewControllers][0];
    playerViewController.players = _players;
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end

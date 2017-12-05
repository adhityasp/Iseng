//
//  Player.h
//  Ratings
//
//  Created by Adhitya Surya Pratama on 9/20/17.
//  Copyright © 2017 Adhitya Surya Pratama. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *game;
@property (nonatomic, assign) int rating;

@end

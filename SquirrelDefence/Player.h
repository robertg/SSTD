//
//  Player.h
//  SquirrelDefence
//
//  Created by Park Sunwoo on 11/10/2013.
//  Copyright (c) 2013 Sinusoidal Squirrels. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject
+ (Player*)getPlayer;
@property (readwrite) int health;
@property (readwrite) int money;
@end

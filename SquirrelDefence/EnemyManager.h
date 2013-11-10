//
//  EnemyManager.h
//  SquirrelDefence
//
//  Created by Robert Gawdzik on 11/9/2013.
//  Copyright (c) 2013 Sinusoidal Squirrels. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#import "Enemy.h"

@interface EnemyManager : SKNode

//Properties:
@property NSMutableArray* Enemies;
//Methods:

+(id) getInstance;
-(void) setEnemyPath:(NSMutableArray*)p;
-(void) addEnemies: (NSArray*)enemies;
-(void) updateAll;
-(Enemy *) getNearestEnemyX:(double)x Y:(double)y dist:(double*)d;
@end
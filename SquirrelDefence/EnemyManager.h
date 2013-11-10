//
//  EnemyManager.h
//  SquirrelDefence
//
//  Created by Robert Gawdzik on 11/9/2013.
//  Copyright (c) 2013 Sinusoidal Squirrels. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

@interface EnemyManager : NSObject

//Properties:
@property NSMutableArray* Enemies;
//Methods:

//Constructor:
-(id) initPath: (NSMutableArray*)path
       enemies: (NSMutableArray*)enemies
         width: (int)width
        height: (int)height
    framesWait: (int)framesWait;

-(void) addEnemies: (NSArray*)enemies;
-(void) updateAll;

@end
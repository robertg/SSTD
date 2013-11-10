//
//  BuildingManager.h
//  SquirrelDefence
//
//  Created by Park Sunwoo on 11/10/2013.
//  Copyright (c) 2013 Sinusoidal Squirrels. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "TileWorld.h"
#import "Building.h"

@interface BuildingManager : SKNode
- (id)initWithWorld:(TileWorld*)world;
- (void)updateAll;
- (void)addBuilding:(Building *)b
                  X:(int)x Y:(int)y;
- (void)destroyBuildingX:(int)x Y:(int)y;

@end

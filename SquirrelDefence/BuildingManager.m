//
//  BuildingManager.m
//  SquirrelDefence
//
//  Created by Park Sunwoo on 11/10/2013.
//  Copyright (c) 2013 Sinusoidal Squirrels. All rights reserved.
//

#import "BuildingManager.h"
#import "Tile.h"
#import "TileWorld.h"
#import "Building.h"

@implementation BuildingManager{
    NSMutableArray * _buildings;
}
static BuildingManager * instance = nil;
+(id) getInstance{
    if (!instance){
        instance = [[BuildingManager alloc] init];
    }
    return instance;
}
- (id)init{
    if ((self=[super init])){
        _buildings = [NSMutableArray array];
    }
    return self;
}

- (void)updateAll{
    for (int i=0;i<[_buildings count];i++){
        [(Building*)_buildings[i] update];
    }
    
}
- (void)addBuilding:(Building *)b X:(int)x Y:(int)y{
    Tile *t = [[TileWorld getInstance] getTileX:x Y:y];
    if ([t isKindOfClass:[BuildTile class]]&&![(BuildTile*)t building]){
        [(BuildTile*)t setBuilding:b];
        [_buildings addObject:b];
        b.position = CGPointMake(32*x+16, 32*y+16);
        [self addChild:b];
    }
}
- (void)destroyBuildingX:(int)x Y:(int)y{
    Tile *t = [[TileWorld getInstance] getTileX:x Y:y];
    if ([t isKindOfClass:[BuildTile class]]){
        if ([(BuildTile*)t building]){
            
            [self removeChildrenInArray:[NSArray arrayWithObject:[(BuildTile*)t building]]];
            [_buildings removeObject:[(BuildTile*)t building]];
        }
    }
}
@end

#import "EnemyManager.h"
#import "Enemy.h"
#import "MapLoc.h"

@implementation EnemyManager

//Private Variables:
{
    NSMutableArray* _heldEnemies;
    NSMutableArray* _path;
    int             _screen_width;
    int             _screen_height;
    int             _framesWait;
    int             _framesCounter;
}

-(id) initPath:(NSMutableArray *)path width:(int)width height:(int)height framesWait: (int)framesWait {
    
    //Initialize local variables.
    _path = path;
    _screen_height = height;
    _screen_width = width;
    _heldEnemies = [NSMutableArray array];
    _framesWait = framesWait;
    _framesCounter = 0;
    
    if (self = [super init]) {
        _Enemies = [NSMutableArray array];
    }
    
    return self;
}

-(void) addEnemies: (NSArray*)enemies {
    [_Enemies addObjectsFromArray:enemies];
}

-(void) updateAll {
    if (_framesCounter==0){//shitty addition
        MapLoc* loc = [_path objectAtIndex:0];
        Enemy* e1 = [[Enemy alloc] initWithSpeed:1.0f health:20 pos: CGPointMake(loc.X*32.0+16.0,loc.Y*32.0+16.0) textureloc: @"Spaceship.png" ];
        [_Enemies addObject:e1];
        [self addChild:e1];
    }
    _framesCounter++;
    
    //Add an enemy.
    if(_framesCounter >= _framesWait) {
        if([_heldEnemies count] > 0) {
            //Add the object to the super enemy class.
            [_Enemies addObject:[_heldEnemies objectAtIndex:0]];
            //Make sure it's not held anymore:
            [_heldEnemies removeObjectAtIndex:0];
        }
        _framesCounter = 0;
    }
    
    for(int i = 0; i < [_Enemies count]; i++) {
        if (![(Enemy *)_Enemies[i] update:_path]){
            [self removeChildrenInArray:[NSArray arrayWithObject:_Enemies[i]]];
            [_Enemies removeObjectAtIndex:i];
            i--;
        }
    }
}

- (Enemy *)getNearestEnemy{
    return nil;
}
@end
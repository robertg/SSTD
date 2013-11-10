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

-(id) initPath:(NSMutableArray *)path enemies:(NSMutableArray*)enemies width:(int)width height:(int)height framesWait: (int)framesWait {
    
    //Initialize local variables.
    _path = path;
    _screen_height = height;
    _screen_width = width;
    _heldEnemies = enemies;
    _framesWait = framesWait;
    _framesCounter = 0;
    
    if (self = [super init]) {
        _Enemies = [[NSMutableArray alloc] init];
    }
    
    return self;
}

-(void) addEnemies: (NSArray*)enemies {
    [_Enemies addObjectsFromArray:enemies];
}

-(void) updateAll {
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
        Enemy* currentEnemy = [_Enemies objectAtIndex:i];
        int nextMove = [self nextMove:currentEnemy];
        //NSLog(@"Next Move:")
        
        if(nextMove == 0) {
            currentEnemy.position = CGPointMake(currentEnemy.position.x + currentEnemy.speed, currentEnemy.position.y);
        } else if(nextMove == 1) {
            currentEnemy.position = CGPointMake(currentEnemy.position.x, currentEnemy.position.y + currentEnemy.speed);
        } else {
            currentEnemy.position = CGPointMake(currentEnemy.position.x, currentEnemy.position.y - currentEnemy.speed);
        }
    }
}

//nextMove(enemy):
//Returns 0 to move right, 1 to move up, 2 to move down.
//0: RIGHT
//1: UP
//2: DOWN
-(int) nextMove: (Enemy*) enemy {
    int arb_x = ceil(enemy.position.x / _screen_width);
    int arb_y = ceil(enemy.position.y / _screen_height);
    
    //Let's find this on the map!
    MapLoc* toFollow;
    int index = -1;
    for(int i = 0; i < [_path count]; i++) {
        MapLoc* loc = [_path objectAtIndex:i];
        if(arb_x == loc.X && arb_y == loc.Y) {
            if(i + 1 < [_path count]) {
                index = i;
                toFollow = [_path objectAtIndex:(i + 1)];
            } else {
                //We don't have anything in the future, it's just the exit to worry about. So we go right.
                return 0;
            }
        }
    }
    if(index == -1) { //This is not supposed to happen!
        return 0;
    }
    
    //We need to go straight.
    if(toFollow.X > arb_x) {
        return 0;
    } else if(toFollow.Y > arb_y) { //We need to go up.
        return 1;
    } else { //We will go down.
        return 2;
    }
    
    //The default: We have no idea what to do.
    return 0;
}

@end
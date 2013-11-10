#import "EnemyManager.h"
#import "Enemy.h"
#import "MapLoc.h"

@implementation EnemyManager

//Private Variables:
{
    NSMutableArray* _path;
    int             _screen_width;
    int             _screen_height;
}

-(id) initPath:(NSMutableArray *)path width:(int)width height:(int)height{
    
    //Initialize local variables.
    _path = path;
    _screen_height = height;
    _screen_width = width;
    
    if (self = [super init]) {
        _Enemies = [[NSMutableArray alloc] init];
    }
    
    return self;
}

-(void) addEnemies: (NSArray*)enemies {
    [_Enemies addObjectsFromArray:enemies];
}

-(void) updateAll {
    for(int i = 0; i < [_Enemies count]; i++) {
        Enemy* currentEnemy = [_Enemies objectAtIndex:i];
        int nextMove = [self nextMove:currentEnemy];
        
        if(nextMove == 0) {
            currentEnemy.position = CGPointMake(currentEnemy.position.x + currentEnemy.Speed, currentEnemy.position.y);
        } else if(nextMove == 1) {
            currentEnemy.position = CGPointMake(currentEnemy.position.x, currentEnemy.position.y + currentEnemy.Speed);
        } else {
            currentEnemy.position = CGPointMake(currentEnemy.position.x, currentEnemy.position.y - currentEnemy.Speed);
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
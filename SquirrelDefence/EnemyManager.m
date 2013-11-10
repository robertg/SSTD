
#import "EnemyManager.h"
#import "Enemy.h"

@implementation EnemyManager
{
NSMutableArray* _path;
}

-(id) init:(NSMutableArray *)path {
    
    _path = path;
    if (self = [super init]) {
        _Enemies = [[NSMutableArray alloc] init];
    }
    
    return self;
}

-(void) createEnemy {
    [_Enemies addObject:[[Enemy alloc] init]];
}

@end
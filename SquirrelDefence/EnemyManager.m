#import "EnemyManager.h"
#import "Enemy.h"

@implementation EnemyManager

//Private Variables:
{
    NSMutableArray* _path;
}

-(id) initPath:(NSMutableArray *)path {
    
    _path = path;
    if (self = [super init]) {
        _Enemies = [[NSMutableArray alloc] init];
    }
    
    return self;
}

-(void) createEnemy {
    
}

@end
#import "Enemy.h"

@implementation Enemy

@synthesize speed = _speed;
@synthesize enemyType = _enemyType;

-(id) initWithSpeed:(float)speed type:(int)type pos:(CGPoint)position textureloc:(NSString *)textloc {
    if (self = [super initWithImageNamed:textloc]) {
        _speed = speed;
        self.position = position;
        _enemyType = type;
    }
    
    return self;
}

@end
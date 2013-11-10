#import "Enemy.h"

@implementation Enemy

@synthesize speed = _speed;
@synthesize enemyType = _enemyType;

-(id) initWithSpeed:(float)speed type:(int)type pos:(CGPoint)position textureloc:(NSString *)textloc {
    if (self = [super initWithImageNamed:textloc]) {
        self.size = CGSizeMake(32.0, 32.0);
        _speed = speed;
        self.position = position;
        _enemyType = type;
    }
    
    return self;
}

@end
#import "Enemy.h"
#import "damage.h"

@implementation Enemy

@synthesize speed = _speed;
@synthesize health = _health;

-(id) initWithSpeed:(float)speed health:(int)health pos:(CGPoint)position textureloc:(NSString *)textloc {
    if (self = [super initWithImageNamed:textloc]) {
        self.size = CGSizeMake(32.0, 32.0);
        _speed = speed;
        self.position = position;
        _health = health;
    }
    return self;
}
-(void)update{
    
}
-(void)takeDamage:(int)damage type:(DamageType)type{
    _health-=damage;
}
@end
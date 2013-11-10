#import "Enemy.h"
#import "EnemyManager.h"
#import "damage.h"
#import "MapLoc.h"
#import "Player.h"

@implementation Enemy{
    float _speed;
    int _health;
    int _pathpos;
}

@synthesize speed = _speed;
@synthesize health = _health;

-(id) initWithSpeed:(float)speed health:(int)health pos:(CGPoint)position textureloc:(NSString *)textloc {
    if (self = [super initWithImageNamed:textloc]) {
        self.anchorPoint = CGPointMake(0.5,0.5);
        self.size = CGSizeMake(32.0, 32.0);
        
        _speed = speed;
        self.position = position;
        _health = health;
        
        _pathpos = 1;
    }
    return self;
}
-(BOOL)update:(NSMutableArray*)path{
    if (_health<0){//dead
        [Player getPlayer].money+=100;
        SKSpriteNode * corpse = [self copy];
        corpse.zPosition = -1.0;
        
        SKAction *colorize = [SKAction colorizeWithColor:[SKColor blackColor] colorBlendFactor:0.7 duration:0.1];
        SKAction *fadeAway = [SKAction fadeOutWithDuration:0.1];
        SKAction *removeFromParent = [SKAction removeFromParent];
        SKAction *group = [SKAction group:@[colorize, fadeAway]];
        SKAction *sequence = [SKAction sequence:@[group, removeFromParent]];
        [corpse runAction:sequence];
        [[EnemyManager getInstance] addChild:corpse];
        return NO;
    }
    MapLoc * target = path[_pathpos];
    double dx = target.X*32.0+16.0-self.position.x;
    double dy = target.Y*32.0+16.0-self.position.y;
    double distSquared = dx*dx+dy*dy;
    if(distSquared<(_speed*_speed)){//close enough to next waypoint, snap to it
        _pathpos++;
        if (_pathpos>=[path count]) {//end of path
            [Player getPlayer].health -=5;
            return NO;
        }
        self.position = CGPointMake(target.X*32.0+16.0, target.Y*32.0+16.0);
        //self.position = CGPointMake(target.X, target.Y);
    } else {
        double adj = _speed / sqrt(distSquared);
        self.zRotation = -atan2(dx, dy);
        
        self.position = CGPointMake(self.position.x+dx*adj, self.position.y+dy*adj);
    }
    return YES;
}
-(void)takeDamage:(int)damage type:(DamageType)type{
    _health-=damage;
    SKAction *colorize = [SKAction colorizeWithColor:[SKColor redColor] colorBlendFactor:0.7 duration:0.2];
    SKAction *decolorize = [SKAction colorizeWithColorBlendFactor:0.0 duration:0.2];
    SKAction *sequence = [SKAction sequence:@[colorize, decolorize]];
    [self runAction:sequence];
}
@end
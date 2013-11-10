#import <SpriteKit/SpriteKit.h>
#import "damage.h"

@interface Enemy : SKSpriteNode 

//Enemy Properties:
@property float speed;
@property int health;


-(id) initWithSpeed: (float) speed
      health: (int)health
      pos:  (CGPoint)position
      textureloc: (NSString*)textloc;

-(void) takeDamage: (int) damage
              type: (DamageType) type;

-(BOOL) update:(NSMutableArray*)path;

@end
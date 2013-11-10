#import <SpriteKit/SpriteKit.h>

@interface Enemy : SKSpriteNode {
    float _speed;
    int _enemyType;
}

//Enemy Properties:
@property float speed;
@property int enemyType;

-(id) initWithSpeed: (float) speed
      type: (int)type
      pos:  (CGPoint)position
      textureloc: (NSString*)textloc;

@end
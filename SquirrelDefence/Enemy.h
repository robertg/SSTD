#import <SpriteKit/SpriteKit.h>

@interface Enemy : SKSpriteNode

//Enemy Properties:
@property float Speed;
//
@property int Enemy_type;
@property SKTexture* Texture;

-(id) init: (float) speed
      type: (int)type
      pos:  (CGPoint)position
      textureloc: (NSString*)textloc;

@end
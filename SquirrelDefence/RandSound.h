#import <SpriteKit/SpriteKit.h>

typedef enum{
	RANDSOUND_SHOT,
	RANDSOUND_EXPLOSION,
	RANDSOUND_HURT
}SoundType;

@interface RandSound: SKNode
+ (id)getInstance;
- (void)playRandSound:(SoundType)type;
@end

#import <SpriteKit/SpriteKit.h>
#include <stdlib.h>

@implementation RandSound
static RandSound * instance = nil;
+ (id)getInstance{
	if(!instance){
		instance = [[RandSound] init];
	}
	return instance;
}
- (id)init{
	if((self=[super init])){
		
	}
}
- (void)playRandSound:(SoundType)type{
	int rand = arc4random();
	NSString * sound;
	switch(type){
		case RANDSOUND_SHOT:
			sound = [NSString stringWithformat
		break;
		case RANDSOUND_EXPLOSION:
		break;
		case RANDSOUND_HURT:
		break;
	}	
};
@end

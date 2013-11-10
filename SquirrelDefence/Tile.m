#import <SpriteKit/SpriteKit.h>
#import "Tile.h"

@implementation Tile
- (id)initWithTexture:(SKTexture *)t
	xpos:(int)x
	ypos:(int)y{
	if((self = [super initWithTexture:t]){
		[self anchorPoint:CGPointMake(0.0,0.0)]
		[self position:CGPointMake(x*32.0,y*32.0)]	
	}
	return self;
}
@end

@implementation BuildTile
@end

@implementation PathTile
- (id)initWithTexture:(SKTexture *)t
	xpos:(int)x
	ypos:(int)y{
	if((self = [super initWithTexture:t xpos:x ypos:y])){
		_nextTile = -1;	
	}
	return self;
}
@end

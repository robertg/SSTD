#import <SpriteKit/SpriteKit.h>
#import "Tile.h"

@implementation Tile
- (id)initWithTexture:(SKTexture *)t
	xpos:(int)x
	ypos:(int)y
	set:(NSString *)s{
	if((self = [super initWithTexture:t]){
		
	}
	return self
}
@end

@implementation BuildTile
@end

@implementation PathTile
@end

#import <SpriteKit/SpriteKit.h>

@interface Tile: SKSpriteNode
- (id)initWithTexture:(SKTexture *)t
	xpos:(int)x
	ypos:(int)y;
@end

@interface BuildTile: Tile
@end

@interface PathTile: Tile
@property (readwrite) int nextTile;
@end


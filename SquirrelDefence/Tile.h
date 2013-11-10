#import <SpriteKit/SpriteKit.h>

@interface Tile: SKSpriteNode
- (id)initWithTexture:(int)t
	xpos:(int)x
	ypos:(int)y;
@end

@interface BuildTile: Tile
@end

@interface PathTile: Tile
- (id)initWithTexture:(int)t
            xpos:(int)x
            ypos:(int)y
            nextid:(int)nid;
@property (readwrite) int nextTile;
@end


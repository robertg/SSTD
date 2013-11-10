#import <SpriteKit/SpriteKit.h>
#import "Building.h"

@interface Tile: SKSpriteNode
- (id)initWithTexture:(int)t
	xpos:(int)x
	ypos:(int)y;
@property (readwrite) int texId;
- (NSString*) getTexName;
- (bool) canBuildHere;
@end

@interface BuildTile: Tile
@property (weak) Building* building;
@end

@interface PathTile: Tile
- (id)initWithTexture:(int)t
            xpos:(int)x
            ypos:(int)y
            nextid:(int)nid;
@property (readwrite) int nextTile;
@end


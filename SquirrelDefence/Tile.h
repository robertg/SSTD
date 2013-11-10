#import <SpriteKit/SpriteKit.h>
#import "Building.h"

@interface Tile: SKSpriteNode
- (id)initWithTexture:(SKTexture*)texture
	xpos:(int)x
	ypos:(int)y;
- (NSString*) getTexName;
- (BOOL) canBuildHere;
@end

@interface BuildTile: Tile
@property (weak) Building* building;
@end

@interface PathTile: Tile
- (id)initWithTexture:(SKTexture*)texture
            xpos:(int)x
            ypos:(int)y
            nextid:(int)nid;
@property (readwrite) int nextTile;
@end



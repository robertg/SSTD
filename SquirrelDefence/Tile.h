#import <SpriteKit/SpriteKit.h>
#import "Building.h"

@interface Tile: SKSpriteNode{
    int _x;
    int _y;
}
- (id)initWithTexture:(SKTexture*)texture
	xpos:(int)x
	ypos:(int)y;
@property (readonly) int x;
@property (readonly) int y;
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



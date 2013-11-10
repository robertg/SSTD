#import "TileWorld.h"
#import "Tile.h"

@interface TileWorld ()

@end

@implementation TileWorld {
	NSMutableArray *_tiles;
	
}

static int MAP_HEIGHT=10;
static int MAP_WIDTH=17;

- (id)initWithMapfile:(NSString*)f {
	if ((self = [super init])) {
		SKTextureAtlas * worldTextures = [SKTextureAtlas atlasNamed:@"World1"];
        _tiles = [NSArray arrayWithContentsOfFile:@"World1"];
        /*
		_tiles = [NSMutableArray arrayWithCapacity:170];
		Tile * tile;
		for(int y=0;y<MAP_HEIGHT;y++){
			for(int x=0;x<MAP_WIDTH;x++){
				if(y==3){
                    tile = [[PathTile alloc] initWithTexture:[worldTextures textureNamed:@"path00"] xpos:x ypos:y];
					[(PathTile*)tile setNextTile:(y*MAP_WIDTH +x+1)];//set next node to next in chain
				} else {
					tile = [[BuildTile alloc] initWithTexture:[worldTextures textureNamed:@"build00"]
							xpos: x ypos: y];
				}
				[self addChild:tile];
				[_tiles insertObject:tile atIndex:(y*MAP_WIDTH +x)];
			}
		}
         */
	}
	return self;
}	
- (Tile *)getTileId:(int)x{
	return _tiles[x];
}
- (Tile *)getTileX:(int)x
	Y:(int)y{
	return _tiles[y*MAP_WIDTH +x];
}
@end

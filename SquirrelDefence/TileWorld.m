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
        
        NSStringEncoding * enc;
        NSString * mapPath = [[NSBundle mainBundle] pathForResource:@"World1" ofType:@"txt"];
        NSString * map = [NSString stringWithContentsOfFile:mapPath usedEncoding:enc error:NULL];
        
		_tiles = [NSMutableArray arrayWithCapacity:171];
		Tile * tile;
		for(int y=0;y<MAP_HEIGHT;y++){
			for(int x=0;x<MAP_WIDTH;x++){
                char t =[map characterAtIndex:y*(MAP_WIDTH*6 +1)+ x*6];
                NSString * tileId = [map substringWithRange:NSMakeRange((y*(MAP_WIDTH*6 +1)+ x*6+1), 2)];
                NSString * extraId = [map substringWithRange:NSMakeRange((y*(MAP_WIDTH*6 +1)+ x*6+3), 3)];
				if(t=='P'){
                    tile = [[PathTile alloc] initWithTexture:[worldTextures textureNamed:[NSString stringWithFormat:@"path%@",tileId]]
                            xpos:x ypos:y nextid:[extraId intValue]];
				} else {
					tile = [[BuildTile alloc] initWithTexture:[worldTextures textureNamed:[NSString stringWithFormat:@"build%@",tileId]]
							xpos: x ypos: y];
				}
				[self addChild:tile];
				[_tiles insertObject:tile atIndex:(y*MAP_WIDTH +x)];
			}
		}
        tile = [[PathTile alloc] initWithTexture:[worldTextures textureNamed:@"path00"] xpos:17 ypos:8 nextid:-1];
        [_tiles insertObject:tile atIndex:170];
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

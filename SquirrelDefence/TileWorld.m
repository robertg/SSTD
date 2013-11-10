#import "TileWorld.h"
#import "Tile.h"
#import "MapLoc.h"

@interface TileWorld ()

@end

@implementation TileWorld {
	NSMutableArray *_tiles;
	
}
static TileWorld * instance=nil;
+(id)getInstance{
    if (!instance){
        instance = [[TileWorld alloc] init];
    }
    return instance;
}
-(id)init{
    if((self=[super init])){
        self.zPosition = -10.0;
    }
    return self;
}
static int MAP_HEIGHT=10;
static int MAP_WIDTH=17;

- (BOOL)loadMapfile:(NSString*)f {
    SKTextureAtlas * worldTextures = [SKTextureAtlas atlasNamed:f];
    
    NSStringEncoding * enc = nil;
    NSString * mapPath = [[NSBundle mainBundle] pathForResource:f ofType:@"txt"];
    NSString * map = [NSString stringWithContentsOfFile:mapPath usedEncoding:enc error:NULL];
    
    _tiles = [NSMutableArray arrayWithCapacity:172];
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
    [_tiles insertObject:tile atIndex:170];//End tile
    tile = [[PathTile alloc] initWithTexture:[worldTextures textureNamed:@"path00"] xpos:0 ypos:-1 nextid:0];
    [_tiles insertObject:tile atIndex:171];//Start tile
    return YES;
}
- (Tile *)getTileId:(int)x{
	return _tiles[x];
}
- (Tile *)getTileX:(int)x
	Y:(int)y{
	return _tiles[y*MAP_WIDTH +x];
}
- (NSMutableArray*)generatePath{//builds an unoptimized path of maplocs
    NSMutableArray * ret = [NSMutableArray array];
    PathTile * t = _tiles[171];
    while (t.nextTile!=-1){
        [ret addObject:[[MapLoc alloc]initX:t.x Y:t.y]];
        t = _tiles[t.nextTile];
    }
    [ret addObject:[[MapLoc alloc]initX:t.x Y:t.y]];
    return ret;
}
@end

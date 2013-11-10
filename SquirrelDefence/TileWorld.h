#import <SpriteKit/SpriteKit.h>
#import "Tile.h"

@interface TileWorld: SKNode
+ (id)getInstance;
- (BOOL)loadMapfile:(NSString*)f;
- (Tile *)getTileId:(int)x;
- (Tile *)getTileX:(int)x
	Y:(int)y;
-(NSMutableArray*)generatePath;
@end

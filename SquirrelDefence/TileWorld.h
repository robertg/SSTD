#import <SpriteKit/SpriteKit.h>

@interface TileWorld: SKNode
+ (id)initWithMapfile:(NSString*)f;
- (Tile *)getTileId:(int)x;
- (Tile *)getTileX:(int)x
	Y:(int)y;
@end

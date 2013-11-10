#import "TileWorld.h"
#import "Tile.h"

@interface TileWorld ()

@end

@implementation TileWorld {
	NSMutableArray * tiles;
}

- (id)initWithMapfile:(NSString *)file {
	if ((self = [super init])) {
		tiles = [NSMutableArray arrayWithCapacity:170];
		Tile * tile;
		for(int y=0;y<10;y++){
			for(int x=0;x<17;x++){
				if(y==3){
					tile = [Tile			 
				}
					
			}
		}
	}
	return self;
}	
@end

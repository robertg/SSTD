
//Header files:
#import "MapScene.h"
#import "TileWorld.h"
#import "MapLoc.h"
#import "EnemyManager.h"
#import "Enemy.h"
#import "MenuLayer.h"

@interface MapScene()
@property BOOL contentCreated;
@end

@implementation MapScene

{
	TileWorld *_world;
    EnemyManager *_enemyManager;
    MenuLayer *_menuLayer;
}
    
- (void)didMoveToView: (SKView *)view
{
    if (!self.contentCreated) {
        [self createSceneContents];
        self.contentCreated = YES;
    }
}

- (void)createSceneContents
{
    self.backgroundColor = [SKColor whiteColor];
    
    _world = [[TileWorld alloc] initWithMapfile:@"World1"];
    [self addChild:_world];
    
    _menuLayer = [[MenuLayer alloc] init];
    [self addChild:_menuLayer];
    
    NSMutableArray * path = [_world generatePath];
    
    MapLoc* loc = [path objectAtIndex:0];
    Enemy* e1 = [[Enemy alloc] initWithSpeed:1.0f health:20 pos: CGPointMake(loc.X*32.0f,loc.Y*32.0f) textureloc: @"Spaceship.png" ];
    [self addChild:e1];
    
    NSMutableArray* enemies = [[NSMutableArray alloc] initWithObjects:e1, nil];
    
    
    _enemyManager = [[EnemyManager alloc] initPath:path
                                           width: self.frame.size.width height: self.frame.size.height framesWait: 20];
    [self addChild:_enemyManager];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [_menuLayer touchesBegan:touches withEvent:event];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_menuLayer touchesMoved:touches withEvent:event];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_menuLayer touchesEnded:touches withEvent:event];
}

-(void)update:(CFTimeInterval)currentTime {
    [_enemyManager updateAll];
}

@end

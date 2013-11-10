
//Header files:
#import "MapScene.h"
#import "TileWorld.h"
#import "MapLoc.h"
#import "EnemyManager.h"
#import "Enemy.h"
#import "MenuLayer.h"
#import "Player.h"
#import "BuildingManager.h"

@interface MapScene()
@property BOOL contentCreated;
@end

@implementation MapScene

{
	TileWorld *_world;
    EnemyManager *_enemyManager;
    MenuLayer *_menuLayer;
    BuildingManager *_buildingManager;
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
    [Player getPlayer];
    self.backgroundColor = [SKColor whiteColor];
    
    _world = [[TileWorld alloc] initWithMapfile:@"World1"];
    [self addChild:_world];
    
    NSMutableArray * path = [_world generatePath];
    
    MapLoc* loc = [path objectAtIndex:0];
    Enemy* e1 = [[Enemy alloc] initWithSpeed:1.0f health:20 pos: CGPointMake(loc.X*32.0f,loc.Y*32.0f) textureloc: @"Spaceship.png" ];
    [self addChild:e1];
    
    _enemyManager = [[EnemyManager alloc] initPath:path
                                             width: self.frame.size.width height: self.frame.size.height
                     framesWait: 60];
                     //framesWait: 20];
    [self addChild:_enemyManager];
    
    _buildingManager = [[BuildingManager alloc] initWithWorld:_world];
    [self addChild:_buildingManager];
    
    _menuLayer = [[MenuLayer alloc] initWithBuildingManager:_buildingManager];
    [self addChild:_menuLayer];
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
    if ([[Player getPlayer] health]<0){//game over man, game over
        self.backgroundColor = [SKColor redColor];
    }
    [_enemyManager updateAll];
}

@end

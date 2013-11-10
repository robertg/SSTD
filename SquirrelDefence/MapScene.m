
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
    [Player getPlayer];
    self.backgroundColor = [SKColor whiteColor];
    
    [[TileWorld getInstance] loadMapfile:@"World1"];
    [self addChild:[TileWorld getInstance]];
    
    [[EnemyManager getInstance] setEnemyPath:[[TileWorld getInstance] generatePath]];
    [self addChild:[EnemyManager getInstance]];
    
    [self addChild:[BuildingManager getInstance]];
    
    _menuLayer = [[MenuLayer alloc] init];
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
    [[EnemyManager getInstance] updateAll];
    [[BuildingManager getInstance] updateAll];
}

@end

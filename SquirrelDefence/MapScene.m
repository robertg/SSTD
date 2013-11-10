
//Header files:
#import "MapScene.h"
#import "TileWorld.h"
#import "MapLoc.h"
#import "EnemyManager.h"
#import "Enemy.h"

@interface MapScene()
@property BOOL contentCreated;
@end

@implementation MapScene

{
	TileWorld *_world;
    EnemyManager *_enemyManager;
}

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        //2
        NSLog(@"SKScene:initWithSize %f x %f",size.width,size.height);
        
        //3
        self.backgroundColor = [SKColor whiteColor];
        
		_world = [[TileWorld alloc] initWithMapfile:@"World1"];
		[self addChild:_world];

        //Create space sprite, setup position on left edge centered on the screen, and add to Scene
        //4
        _ship = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship.png"];

        _ship.position = CGPointMake(self.frame.size.width * 0.1, CGRectGetMidY(self.frame));
        
        //Defining the behaviours

        SKAction *remove = [SKAction removeFromParent];
        SKAction *zoom = [SKAction scaleTo: 0.1 duration: 0.10];
        SKAction *right = [SKAction rotateByAngle:-M_PI/2 duration:0.5];

        SKAction *turnRight = [SKAction sequence:@[right]];
        
        Enemy* e1 = [[Enemy alloc] init:0.01f type:1 pos: (CGPointMake(10, 10)) textureloc: @"Spaceship.png" ];
        [self addChild:e1];
        NSMutableArray* enemies = [[NSMutableArray alloc] initWithObjects:e1, nil];
        
         
        _enemyManager = [[EnemyManager alloc] initPath:[self generatePath]
                                               enemies: enemies width: size.width height: size.height framesWait: 20];
    }
    
    return self;
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
    /* Setup your scene here */
    //2
    
    //3
    self.backgroundColor = [SKColor whiteColor];
    
    _world = [[TileWorld alloc] initWithMapfile:@"World1"];
    [self addChild:_world];
    
    [self generatePath];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];

    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    [_enemyManager updateAll];
}

//generatePath: Returns a randomly generated path (NSMutableArray) with MapLoc objects within.
//0th index: Entry point for the enemies.
//(Size - 1)th: Exit point for the enemies.
-(NSMutableArray*)generatePath {
    //Create the Mutable Array.
    NSMutableArray * toReturn =  [[NSMutableArray alloc]
                                  initWithObjects:
                                  [[MapLoc alloc] initX: 0 initY: 2],
                                  [[MapLoc alloc] initX: 1 initY: 2],
                                  [[MapLoc alloc] initX: 1 initY: 3],
                                  [[MapLoc alloc] initX: 1 initY: 4],
                                  [[MapLoc alloc] initX: 1 initY: 5],
                                  [[MapLoc alloc] initX: 2 initY: 5],
                                  [[MapLoc alloc] initX: 3 initY: 5],
                                  [[MapLoc alloc] initX: 3 initY: 6],
                                  [[MapLoc alloc] initX: 3 initY: 7],
                                  [[MapLoc alloc] initX: 3 initY: 8],
                                  [[MapLoc alloc] initX: 4 initY: 8],
                                  [[MapLoc alloc] initX: 5 initY: 8],
                                  [[MapLoc alloc] initX: 6 initY: 8],
                                  [[MapLoc alloc] initX: 6 initY: 7],
                                  [[MapLoc alloc] initX: 6 initY: 6],
                                  [[MapLoc alloc] initX: 7 initY: 6],
                                  [[MapLoc alloc] initX: 8 initY: 6],
                                  [[MapLoc alloc] initX: 9 initY: 6],
                                  [[MapLoc alloc] initX: 10 initY: 6],
                                  [[MapLoc alloc] initX: 11 initY: 6],
                                  [[MapLoc alloc] initX: 12 initY: 6],
                                  [[MapLoc alloc] initX: 12 initY: 5],
                                  [[MapLoc alloc] initX: 12 initY: 4],
                                  [[MapLoc alloc] initX: 12 initY: 3],
                                  [[MapLoc alloc] initX: 13 initY: 3],
                                  [[MapLoc alloc] initX: 14 initY: 3],
                                  [[MapLoc alloc] initX: 15 initY: 3],
                                  [[MapLoc alloc] initX: 16 initY: 3], nil];
    return toReturn;
}

@end

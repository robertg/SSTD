
//Header files:
#import "MapScene.h"
#import "TileWorld.h"
#import "MapLoc.h"

@implementation MapScene
{
    SKSpriteNode *_ship;  //1
	TileWorld *_world;
    CGPoint _previousTouchLocation;
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
        
        
        
        [self generatePath];
        
        SKShapeNode *menuBackground = [[SKShapeNode alloc] init];
        menuBackground.name = @"menuBackground";
        
        CGMutablePathRef myPath = CGPathCreateMutable();
        CGPathAddRect(myPath, NULL, CGRectMake(0.0, 0.0, 100.0, 320.0));
        menuBackground.path = myPath;
        
        menuBackground.lineWidth = 0.0;
        menuBackground.fillColor = [SKColor grayColor];
        menuBackground.strokeColor = [SKColor clearColor];
        menuBackground.glowWidth = 0.0;
        menuBackground.alpha = 0.5;
        
        SKAction *wait = [SKAction waitForDuration:1.0];
        SKAction *snapToLeft = [SKAction moveToX:-100.0 duration:0.25];
        SKAction *sequence = [SKAction sequence:@[wait, snapToLeft]];
        [menuBackground runAction:sequence];
        
        SKSpriteNode *tower = [SKSpriteNode spriteNodeWithImageNamed:@"tower_one_0.gif"];
        
        tower.position = CGPointMake(menuBackground.frame.size.width / 2, menuBackground.frame.size.height - tower.frame.size.height);
        
        [menuBackground addChild:tower];
        
        [self addChild:menuBackground];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];

        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
        
        _previousTouchLocation = location;
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        SKShapeNode *menuBackground = (SKShapeNode *)[self childNodeWithName:@"menuBackground"];
        CGFloat newX = menuBackground.position.x + (location.x - _previousTouchLocation.x);
        if (newX < -100.0)
            newX = -100.0;
        if (newX > 0.0)
            newX = 0.0;
        menuBackground.position = CGPointMake(newX, menuBackground.position.y);
        
        if (newX > -50.0) {
            SKAction *snapToRight = [SKAction moveToX:0.0 duration:0.1];
            [menuBackground runAction:snapToRight];
        } else if (newX < -50.0) {
            SKAction *snapToLeft = [SKAction moveToX:-100.0 duration:0.1];
            [menuBackground runAction:snapToLeft];
        }
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
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

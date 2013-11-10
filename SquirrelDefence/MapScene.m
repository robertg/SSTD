
//Header files:
#import "MapScene.h"
#import "MapLoc.h"

@implementation MapScene
{
    SKSpriteNode *_ship;  //1
}
-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        //2
        NSLog(@"SKScene:initWithSize %f x %f",size.width,size.height);
        
        //3
        self.backgroundColor = [SKColor whiteColor];
        
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
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];

        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
    
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
    NSMutableArray * toReturn =  [[NSMutableArray alloc] init];
    
    //Generate a random number from 1 to 10, add 20; making it between 20-30.
    int size = (rand() % 10) + 20;
    
    //Seed the random object:
    srand([[NSDate date] timeIntervalSince1970]);

    //Create an entranceObject, and push it into the Return Object.
    MapLoc *entrance = [[MapLoc alloc] initX: 0 initY: (rand() % 10)];
    [toReturn addObject:entrance];
    
    //Check what random number is generated:
    NSLog([NSString stringWithFormat: @"Random Number Generated: %d", size]);
    
    for(int i = 1; i < size; i++) {
        srand([[NSDate date] timeIntervalSince1970]);

    }
    
    MapLoc *a = [[MapLoc alloc] initX:3 initY:4];
    return toReturn;
}

@end

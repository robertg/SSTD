
//Header files:
#import "MapScene.h"
#import "MapLoc.h"

@implementation MapScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        
        myLabel.text = @"Hello, World!";
        myLabel.fontSize = 30;
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMidY(self.frame));
        
        [self generatePath];
        
        [self addChild:myLabel];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];

        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
        
        sprite.position = location;
        
        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
        
        [sprite runAction:[SKAction repeatActionForever:action]];
        
        [self addChild:sprite];
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
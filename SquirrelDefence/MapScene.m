
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
                                  [[MapLoc alloc] initX: 16 initY: 3], Nil];
    return toReturn;
    /*
    //Generate a random number from 1 to 10, add 20; making it between 20-30.
    int size = (arc4random() % 10) + 20;
    
    //Seed the random object:
    srand([[NSDate date] timeIntervalSince1970]);

    //Create an entranceObject, and push it into the Return Object.
    MapLoc *entrance = [[MapLoc alloc] initX: 0 initY: (arc4random() % 10)];
    [toReturn addObject:entrance];
    
    //Check what random number is generated:
    NSLog([NSString stringWithFormat: @"Random Number Generated: %d", size]);
    
    for(int i = 1; i < size; i++) {
        srand([[NSDate date] timeIntervalSince1970]);
        MapLoc *lastObj = [toReturn objectAtIndex:(i - 1)];
        
        //Check if the lastObject is nearing the edge of the map.
        if([lastObj X] == 15) {
            MapLoc *new = [[MapLoc alloc] initX: 16 initY: [lastObj Y]];
            [toReturn addObject:new];
            
        }
        else if([lastObj X] == 16) { //We reached the end of the map. We can stop this madness!
            break;
        }
        //If the randomly generated number is equal to 2, we can just extend the path
        else {
            //We add to the path by the right.
            if(arc4random() % 3 == 1) {
                MapLoc *temp = [[MapLoc alloc] initX: ([lastObj X] + 1) initY: [lastObj Y]];
                [toReturn addObject:temp];
            } else if(arc4random() % 3 == 2) { //We add to the path upwards (if possible), else sideways.
                if([lastObj Y] == 9) {
                    MapLoc *temp = [[MapLoc alloc] initX: ([lastObj X] + 1) initY: [lastObj Y]];
                    [toReturn addObject:temp];
                } else {
                    MapLoc *temp = [[MapLoc alloc] initX: ([lastObj X]) initY: [lastObj Y] + 1];
                    [toReturn addObject:temp];
                }
            } else { //We try adding to the bottom:
                if([lastObj Y] == 0) {
                    MapLoc *temp = [[MapLoc alloc] initX: ([lastObj X] + 1) initY: [lastObj Y]];
                    [toReturn addObject:temp];
                } else {
                    MapLoc *temp = [[MapLoc alloc] initX: ([lastObj X]) initY: [lastObj Y] - 1];
                    [toReturn addObject:temp];
                }
            }
        }
    }
    
    for(int i = 0; i < [toReturn count]; i++) {
        MapLoc *obj = [toReturn objectAtIndex:i];
        NSLog([NSString stringWithFormat: @"X: %d , Y: %d", [obj X], [obj Y]]);
    }
    
    MapLoc *a = [[MapLoc alloc] initX:3 initY:4];
     
    */
}

@end
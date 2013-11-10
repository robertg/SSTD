
//Header files:
#import "MapScene.h"
#import "MapLoc.h"

@implementation MapScene
<<<<<<< HEAD
{
    SKSpriteNode *_ship;  //1
}
-(id)initWithSize:(CGSize)size {    
=======

-(id)initWithSize:(CGSize)size {
>>>>>>> ce3274964cfeeccc3343ba315863df6808e216ac
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        //2
        NSLog(@"SKScene:initWithSize %f x %f",size.width,size.height);
        
<<<<<<< HEAD
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
=======
        self.backgroundColor = [SKColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
        
        SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"HelveticaNeue-UltraLight"];
        
        myLabel.name = @"title";
        myLabel.text = @"Tower Defence";
        myLabel.fontSize = 30;
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMidY(self.frame));
        myLabel.fontColor = [SKColor blackColor];
        
        [self addChild:myLabel];
        
        SKLabelNode *tapToBegin = [SKLabelNode labelNodeWithFontNamed:@"HelveticaNeue-UltraLight"];
        
        tapToBegin.name = @"tapToBegin";
        tapToBegin.text = @"tap to begin";
        tapToBegin.fontSize = 24;
        tapToBegin.position = CGPointMake(CGRectGetMidX(self.frame),
                                          CGRectGetMidY(self.frame)/2-12);
        tapToBegin.fontColor = [SKColor blackColor];
        
        [self addChild:tapToBegin];
        
        SKLabelNode *info = [SKLabelNode labelNodeWithFontNamed:@"HelveticaNeue-UltraLight"];
        
        info.name = @"info";
        info.text = @"info";
        info.fontSize = 24;
        info.position = CGPointMake(self.frame.size.width-40,
                                    22);
        info.fontColor = [SKColor blueColor];
        
        [self addChild:info];
>>>>>>> ce3274964cfeeccc3343ba315863df6808e216ac
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
<<<<<<< HEAD

        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
    
=======
        
        SKLabelNode *infoNode = (SKLabelNode *)[self childNodeWithName:@"info"];
        if (infoNode != nil) {
            if (CGRectContainsPoint(infoNode.frame, location)) {
                infoNode.fontColor = [SKColor colorWithRed:0.0 green:0.0 blue:1.0 alpha:0.5];
                return;
            }
        }
        
        //        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
        //
        //        sprite.position = location;
        //
        //        SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
        //
        //        [sprite runAction:[SKAction repeatActionForever:action]];
        //
        //        [self addChild:sprite];
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        SKLabelNode *infoNode = (SKLabelNode *)[self childNodeWithName:@"info"];
        if (infoNode != nil) {
            if (CGRectContainsPoint(infoNode.frame, location)) {
                infoNode.fontColor = [SKColor blueColor];
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Info" message:@"Info message" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alertView show];
                return;
            }
        }
        
        // TODO: transition to next scene
        SKScene *mapScene = [[MapScene alloc] initWithSize:self.size];
        SKTransition *transition = [SKTransition doorwayWithDuration:0.5];
        [self.view presentScene:mapScene transition:transition];
>>>>>>> ce3274964cfeeccc3343ba315863df6808e216ac
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

//
//  SquirrelMyScene.m
//  SquirrelDefence
//
//  Created by Park Sunwoo on 11/9/2013.
//  Copyright (c) 2013 Sinusoidal Squirrels. All rights reserved.
//

#import "SquirrelMyScene.h"

@implementation SquirrelMyScene
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
        SKAction *moveTo = [SKAction moveTo:<#(CGPoint)#> duration:<#(NSTimeInterval)#>];
        SKAction *remove = [SKAction removeFromParent];
        SKAction *zoom = [SKAction scaleTo: 0.1 duration: 0.10];
        SKAction *right = [SKAction rotateByAngle:-M_PI/2 duration:0.5];

        SKAction *turnRight = [SKAction sequence:@[right]];
        SKAction *moveSequence = [SKAction sequence:@[zoom, moveToNodeOne, right, moveToNodeTwo, remove]];

        
        
        
        
        
    
    }
    return self;}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
//    /* Called when a touch begins */
//    
//    for (UITouch *touch in touches) {
//        CGPoint location = [touch locationInNode:self];
//        
//        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
//        
//        sprite.position = location;
//        
//        SKAction *action = [SKAction rotateByAngle:M_PI duration:5];
//        
//        [sprite runAction:[SKAction repeatActionForever:action]];
//        
//        [self addChild:sprite];
//    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end

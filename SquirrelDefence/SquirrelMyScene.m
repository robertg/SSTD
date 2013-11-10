//
//  SquirrelMyScene.m
//  SquirrelDefence
//
//  Created by Park Sunwoo on 11/9/2013.
//  Copyright (c) 2013 Sinusoidal Squirrels. All rights reserved.
//

#import "SquirrelMyScene.h"

@implementation SquirrelMyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
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
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
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
        SKScene *mapScene = [[SquirrelMyScene alloc] initWithSize:self.size];
        SKTransition *transition = [SKTransition doorwayWithDuration:0.5];
        [self.view presentScene:mapScene transition:transition];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end

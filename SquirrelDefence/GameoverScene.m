//
//  GameoverScene.m
//  SquirrelDefence
//
//  Created by Park Sunwoo on 11/10/2013.
//  Copyright (c) 2013 Sinusoidal Squirrels. All rights reserved.
//

#import "GameoverScene.h"
#import "TitleScene.h"

@interface GameoverScene()
@property BOOL contentCreated;
@end

@implementation GameoverScene

- (void)didMoveToView:(SKView *)view
{
    if (!self.contentCreated) {
        [self createSceneContents];
        self.contentCreated = YES;
    }
}

- (void)createSceneContents
{
    self.backgroundColor = [SKColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
    
    SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"HelveticaNeue-UltraLight"];
    
    myLabel.name = @"title";
    myLabel.text = @"Game Over";
    myLabel.fontSize = 30;
    myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                   CGRectGetMidY(self.frame));
    myLabel.fontColor = [SKColor redColor];
    
    [self addChild:myLabel];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    SKScene *titleScene = [[TitleScene alloc] initWithSize:self.size];
    SKTransition *transition = [SKTransition doorwayWithDuration:0.5];
    [self.view presentScene:titleScene transition:transition];
}

@end

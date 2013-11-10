//
//  TitleScene.m
//  SquirrelDefence
//
//  Created by Wasiur Rahman on 11/9/2013.
//  Copyright (c) 2013 Sinusoidal Squirrels. All rights reserved.
//

#import "TitleScene.h"
#import "MapScene.h"

@interface TitleScene()
@property BOOL contentCreated;
@end

@implementation TitleScene

- (void)didMoveToView:(SKView *)view
{
    if (!self.contentCreated) {
        [self createSceneContents];
        self.contentCreated = YES;
    }
}

- (void)createSceneContents
{
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
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    SKScene *mapScene = [[MapScene alloc] initWithSize:self.size];
    SKTransition *transition = [SKTransition doorwayWithDuration:0.5];
    [self.view presentScene:mapScene transition:transition];
}

@end

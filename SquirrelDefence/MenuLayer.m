//
//  MenuLayer.m
//  SquirrelDefence
//
//  Created by Wasiur Rahman on 11/10/2013.
//  Copyright (c) 2013 Sinusoidal Squirrels. All rights reserved.
//

#import "MenuLayer.h"
#import "BuildingManager.h"
#import "DFTurret.h"

@implementation MenuLayer {
    CGPoint _previousTouchLocation;
    BOOL _menuOpen;
    BOOL _dragging;
    int _menuItemCount;
}

- (id)init
{
    if ((self = [super init])) {
        
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
        self.zPosition = 10.0;
        
        SKAction *wait = [SKAction waitForDuration:1.0];
        SKAction *snapToLeft = [SKAction moveToX:-100.0 duration:0.25];
        SKAction *sequence = [SKAction sequence:@[wait, snapToLeft]];
        [self runAction:sequence];
        
        NSArray *menuItems = [NSArray arrayWithObjects:
                              [SKSpriteNode spriteNodeWithImageNamed:@"tower_one_0.gif"],
                              nil];
        
        [self addChild:menuBackground];

        for (int i = 0; i < [menuItems count]; i++) {
            SKSpriteNode *item = (SKSpriteNode *)[menuItems objectAtIndex:i];
            item.name = [NSString stringWithFormat:@"menuItem%d", i];
            item.anchorPoint = CGPointMake(0.0, 0.0);
            item.size = CGSizeMake(48.0, 48.0);
            item.position = CGPointMake(menuBackground.frame.size.width / 2 - item.frame.size.width / 2, menuBackground.frame.size.height - ((i+2) * item.frame.size.height));
            [self addChild:item];
        }
        _menuItemCount = [menuItems count];
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        _previousTouchLocation = location;
        
        SKShapeNode *menuBackground = (SKShapeNode *)self;
        for (int i = 0; i < _menuItemCount; i++) {
            SKSpriteNode *item = (SKSpriteNode *)[menuBackground childNodeWithName:[NSString stringWithFormat:@"menuItem%d", i]];
            if (CGRectContainsPoint(item.frame, [touch locationInNode:menuBackground])) {
                SKAction *snapToLeft = [SKAction moveToX:-100.0 duration:0.25];
                [self runAction:snapToLeft];
                _menuOpen = NO;
                
                SKSpriteNode *cloneItem = [item copy];
                cloneItem.name = @"cloneItem";
                cloneItem.size = CGSizeMake(32.0, 32.0);
                cloneItem.anchorPoint = CGPointMake(0.5, 0.5);
                [self addChild:cloneItem];
                
                _dragging = YES;
                break;
            } else {
                _dragging = NO;
            }
        }
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        if (_dragging) {
            SKSpriteNode *cloneItem = (SKSpriteNode *)[self childNodeWithName:@"cloneItem"];
            cloneItem.position = CGPointMake(32 * floor(location.x / 32)+16.0, 32 * floor(location.y / 32)+16.0);
            return;
        }
        
        SKShapeNode *menuBackground = (SKShapeNode *)self;
        
        CGFloat newX = menuBackground.position.x + (location.x - _previousTouchLocation.x);
        if (newX < -100.0)
            newX = -100.0;
        if (newX > 0.0)
            newX = 0.0;
        menuBackground.position = CGPointMake(newX, menuBackground.position.y);
        
        if (newX > -50.0) {
            SKAction *snapToRight = [SKAction moveToX:0.0 duration:0.1];
            [self runAction:snapToRight];
        } else if (newX < -50.0) {
            SKAction *snapToLeft = [SKAction moveToX:-100.0 duration:0.1];
            [self runAction:snapToLeft];
        }
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    BOOL shittyhackboolean = YES;
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        if (_dragging && shittyhackboolean) {
            SKSpriteNode *cloneItem = (SKSpriteNode *)[self childNodeWithName:@"cloneItem"];
            [[BuildingManager getInstance] addBuilding:[[DFTurret alloc] init]
                                        X:floor(location.x/32)-3.0 Y:floor(location.y/32)];//Why do I need to subtract 3? I don't know either. Ask the phone.
            [self removeChildrenInArray:[NSArray arrayWithObject:cloneItem]];
            
            _dragging = NO;
            shittyhackboolean = NO;
            return;
        }
        
        SKShapeNode *menuBackground = (SKShapeNode *)self;
        
        if (_menuOpen == YES) {
            if (!CGRectContainsPoint(menuBackground.frame, _previousTouchLocation)) {
                SKAction *snapToLeft = [SKAction moveToX:-100.0 duration:0.25];
                [self runAction:snapToLeft];
                _menuOpen = NO;
            }
        }
        
        if (menuBackground.position.x == 0.0)
            _menuOpen = YES;
        else
            _menuOpen = NO;
    }
}

@end

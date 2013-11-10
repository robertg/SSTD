//
//  InfoLayer.m
//  SquirrelDefence
//
//  Created by Robert Gawdzik on 11/10/2013.
//  Copyright (c) 2013 Sinusoidal Squirrels. All rights reserved.
//

#import "InfoLayer.h"

@implementation InfoLayer {
    SKLabelNode *_label;
}

-(id) init {
    if ((self = [super init])) {
        
        _label = [[SKLabelNode alloc] initWithFontNamed:@"Helvetica Light"];
        _label.name = @"Money/Health";
        _label.text = @"Money: %d, Health: %d";
        _label.fontSize = 20;
        [self addChild:_label];
    }
    return self;
}

-(void)update:(Player *)player {
    _label.text = [NSString stringWithFormat:@"Money: $%d  Health: %d ♥", player.money, player.health];
    //NSLog(_label.text);
}

@end
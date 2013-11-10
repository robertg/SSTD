//
//  InfoLayer.h
//  SquirrelDefence
//
//  Created by Robert Gawdzik on 11/10/2013.
//  Copyright (c) 2013 Sinusoidal Squirrels. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "Player.h"

@interface InfoLayer : SKNode

-(void)update: (Player*)player;

@end
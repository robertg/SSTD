//
//  GenericAndUselessBuilding.m
//  SquirrelDefence
//
//  Created by Park Sunwoo on 11/10/2013.
//  Copyright (c) 2013 Sinusoidal Squirrels. All rights reserved.
//

#import "GenericAndUselessBuilding.h"

@implementation GenericAndUselessBuilding
- (id)init{
    if ((self = [super init])){
        self.texture = [SKTexture textureWithImageNamed:@"tower_one_0.gif"];
        self.color = [SKColor blueColor];
        self.colorBlendFactor = 0.7;
        self.size = CGSizeMake(32.0, 32.0);
        self.anchorPoint = CGPointMake(0.5, 0.5);
    }
    return self;
}
@end

//
//  DFTurret.m
//  SquirrelDefence
//
//  Created by Park Sunwoo on 11/10/2013.
//  Copyright (c) 2013 Sinusoidal Squirrels. All rights reserved.
//

#import "DFTurret.h"

@implementation DFTurret{
    double _range;
    int _delay;
    int _damage;
}
- (id)init{
    if ((self = [super init])){
        self.texture = [SKTexture textureWithImageNamed:@"tower_one_0.gif"];
        self.size = CGSizeMake(32.0, 32.0);
        self.anchorPoint = CGPointMake(0.0, 0.0);
        
        _range = 64.0;
        _delay = 12;
        _damage = 4;
    }
    return self;
}
- (void)update{
    
}
@end

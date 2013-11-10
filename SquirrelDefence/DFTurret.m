//
//  DFTurret.m
//  SquirrelDefence
//
//  Created by Park Sunwoo on 11/10/2013.
//  Copyright (c) 2013 Sinusoidal Squirrels. All rights reserved.
//

#import "DFTurret.h"
#import "Enemy.h"
#import "EnemyManager.h"
#import "damage.h"

@implementation DFTurret{
    double _range;
    int _delay;
    int _damage;
    int _cooldown;
}
- (id)init{
    if ((self = [super init])){
        self.texture = [SKTexture textureWithImageNamed:@"tower_one_0.gif"];
        self.size = CGSizeMake(32.0, 32.0);
        self.anchorPoint = CGPointMake(0.5, 0.5);
        
        _range = 64.0;
        _delay = 10;
        _damage = 2;
        _cooldown = 0;
    }
    return self;
}
- (void)update{
    if (_cooldown>0){
        _cooldown--;
    }else{
        double dist;
        Enemy * e = [[EnemyManager getInstance] getNearestEnemyX:self.position.x Y:self.position.y dist:&dist];
        
        if(dist<_range){
            self.zRotation = -atan2(e.position.x-self.position.x,e.position.y-self.position.y);
            
            [e takeDamage:_damage type:DMG_BULLET];
            _cooldown = _delay;
        }
    }
    
    
}
@end

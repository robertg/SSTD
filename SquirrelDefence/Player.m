//
//  Player.m
//  SquirrelDefence
//
//  Created by Park Sunwoo on 11/10/2013.
//  Copyright (c) 2013 Sinusoidal Squirrels. All rights reserved.
//

#import "Player.h"

@implementation Player{
    int _health;
    int _money;
}
@synthesize health=_health;
@synthesize money=_money;
static Player *instance = nil;
+ (Player*) getPlayer{
    if (instance==nil) {
        instance = [[Player alloc] init];
    }
    return instance;
}
- (id)init{
    if((self=[super init])){
        self.money = 200;
        self.health = 100;
    }
    return self;
}
- (void)destroy {
    instance = nil;
}

@end
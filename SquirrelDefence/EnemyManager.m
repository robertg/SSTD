//
//  EnemyManager.m
//  SquirrelDefence
//
//  Created by Robert Gawdzik on 11/9/2013.
//  Copyright (c) 2013 Sinusoidal Squirrels. All rights reserved.
//

#import "EnemyManager.h"

@implementation EnemyManager

NSMutableArray* Path;

-(id) init:(NSMutableArray *)path {
    
    Path = path;
    if (self = [super init]) {
        _Enemies = [[NSMutableArray alloc] init];
    }
    
    return self;
}

-(void) createEnemy {
    [_Enemies addObject:[]];
    
}


@end
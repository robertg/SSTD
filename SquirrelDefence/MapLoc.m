//
//  MapLoc.m
//  SquirrelDefence
//
//  Created by Robert Gawdzik on 11/9/2013.
//  Copyright (c) 2013 Sinusoidal Squirrels. All rights reserved.
//

#import "MapLoc.h"

@implementation MapLoc

//
//initMapLoc: (int x, int y): Takes in two numbers, X, and Y, and stores them into it's property.
//
-(id)initX: (int)x_param
     initY: (int)y_param {
    if ((self = [super init])) {
        _X = x_param;
        _Y = y_param;
    }
    
    return self;
}

@end
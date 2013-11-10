//
//  main.m
//  LevelGen
//
//  Created by Park Sunwoo on 11/10/2013.
//  Copyright (c) 2013 Sinusoidal Squirrels. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Tile.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSArray *array = [NSArray arrayWithObjects:
                                
                          ];
        
        [array writeToFile:@"../SquirrelDefence/World1.lvl" atomically:NO];
        
    }
    return 0;
}


#import "Enemy.h"

@implementation Enemy

-(id) init:(float)speed type:(int)type pos:(CGPoint)position textureloc:(NSString *)textloc {
    if (self = [super init]) {
        _Speed = speed;
        self.position = position;
        _Enemy_type = type;
        //Set up the texture from the path:
        _Texture = [SKTexture textureWithImageNamed:textloc];
    }
    
    return self;
}

@end
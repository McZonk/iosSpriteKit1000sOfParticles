//
//  MyScene.m
//  SpriteKit_1000s_of_Sprites_Tutorial
//
//  Created by Sam  keene on 2/01/14.
//  Copyright (c) 2014 Sam  keene. All rights reserved.
//

#import "MyScene.h"

#import "idRandom2.h"

@interface MyScene() {
	idRandom2 random;
}
@property (nonatomic, strong) NSArray *sprites;
@end

@implementation MyScene

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
		idRandom2Init(&random, (int)time(0));
    }
    return self;
}

- (void)setupLEDs
{
    self.backgroundColor = [SKColor blackColor];
    
    // create the particle texture
    SKTexture *ledTexture = [SKTexture textureWithImageNamed:@"whitePixel"];
	
    // cycle through and throw as many sprites into the node as you want
    for (int i = 0; i < 5000; i++) {
		UIColor *randColor = i & 1 ? [UIColor redColor] : [UIColor greenColor];
		SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithTexture:ledTexture];
        sprite.position = CGPointZero;
        sprite.colorBlendFactor = 1.;
        sprite.color = randColor;
        [self addChild:sprite];
    }

    self.sprites = [NSArray arrayWithArray:self.children];
}


-(void)update:(CFTimeInterval)currentTime {
    
    // cycle through the children of the sprite and reposition
    // this is where most of the heavy lifting now happens, as opposed to at the drawing stage
    
    for (SKSpriteNode *sprite in self.sprites) {
        sprite.position = CGPointMake(idRandom2Float(&random) * 320, idRandom2Float(&random) * 568);
    }
}

@end

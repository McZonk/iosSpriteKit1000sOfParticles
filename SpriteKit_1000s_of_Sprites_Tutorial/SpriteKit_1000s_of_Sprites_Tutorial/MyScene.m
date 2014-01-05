//
//  MyScene.m
//  SpriteKit_1000s_of_Sprites_Tutorial
//
//  Created by Sam  keene on 2/01/14.
//  Copyright (c) 2014 Sam  keene. All rights reserved.
//

#import "MyScene.h"

@interface MyScene()
@end

@implementation MyScene

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        
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
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithTexture:ledTexture];
        sprite.position = CGPointMake(arc4random_uniform(320), arc4random_uniform(568));
        sprite.colorBlendFactor = 1.;
        [self addChild:sprite];
    }
    
}


-(void)update:(CFTimeInterval)currentTime {
    
    // cycle through the children of the sprite and reposition
    // this is where most of the heavy lifting now happens, as opposed to at the drawing stage
    
    for (SKSpriteNode *sprite in self.children) {
        UIColor *randColor = (arc4random_uniform(10) >= 5) ? [UIColor redColor] : [UIColor greenColor];
        sprite.position = CGPointMake(arc4random_uniform(320), arc4random_uniform(568));
        [sprite setColor:randColor];
    }
}

@end

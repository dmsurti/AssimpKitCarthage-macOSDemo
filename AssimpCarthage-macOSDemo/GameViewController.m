//
//  GameViewController.m
//  AssimpCarthage-macOSDemo
//
//  Created by Deepak Surti on 11/18/16.
//  Copyright (c) 2016 Ison Apps. All rights reserved.
//

#import "GameViewController.h"
#import <AssimpKit/PostProcessingFlags.h>
#import <AssimpKit/SCNAssimpAnimSettings.h>
#import <AssimpKit/SCNNode+AssimpImport.h>
#import <AssimpKit/SCNScene+AssimpImport.h>

@implementation GameViewController

- (void)awakeFromNib
{
    NSString *soldierPath =
        @"/Users/deepaksurti/ios-osx/assimp/demo/assets/attack.dae";
    SCNAssimpScene *scene =
    [SCNScene assimpSceneWithURL:[NSURL URLWithString:soldierPath]
                postProcessFlags:AssimpKit_JoinIdenticalVertices |
                                 AssimpKit_Process_FlipUVs |
                                 AssimpKit_Process_Triangulate];
    SCNAssimpAnimSettings *settings =
    [[SCNAssimpAnimSettings alloc] init];
    settings.repeatCount = 3;
    SCNScene *anim = [scene animationSceneForKey:@"attack-1"];
    [scene.modelScene.rootNode addAnimationScene:anim forKey:@"attack-1"
                                    withSettings:settings];
    self.gameView.scene = scene.modelScene;

    // allows the user to manipulate the camera
    self.gameView.allowsCameraControl = YES;

    // show statistics such as fps and timing information
    self.gameView.showsStatistics = YES;

    // configure the view
    self.gameView.backgroundColor = [NSColor whiteColor];

    self.gameView.playing = YES;
}

@end
